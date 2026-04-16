// transform_vertices と raster を統合した版
// 各スレッドが 1 ピクセルを担当し、全三角形を総当たりで判定する
// 現在はライティング未実装、可視三角形に疑似乱数色を付けるのみ

// 簡易ランダム関数、色付けのため
uint wang_hash(uint seed)
{
    seed = (seed ^ 61u) ^ (seed >> 16);
    seed *= 9u;
    seed = seed ^ (seed >> 4);
    seed *= 0x27d4eb2du;
    seed = seed ^ (seed >> 15);
    return seed;
}

// 行列積
inline float4 mul_mat4_vec4(float16 m, float4 v)
{
    return (float4)(
        m.s0 * v.x + m.s1 * v.y + m.s2 * v.z + m.s3 * v.w,
        m.s4 * v.x + m.s5 * v.y + m.s6 * v.z + m.s7 * v.w,
        m.s8 * v.x + m.s9 * v.y + m.sa * v.z + m.sb * v.w,
        m.sc * v.x + m.sd * v.y + m.se * v.z + m.sf * v.w
    );
}

// 三角形の内外判定用
inline float edge2d(float2 a, float2 b, float2 p)
{
    return (p.x - a.x) * (b.y - a.y) - (p.y - a.y) * (b.x - a.x);
}

// 後半の計算まわり
inline float4 transform_vertex_to_screen(float4 pos, float16 mvp, int width, int height)
{
    const float4 clip = mul_mat4_vec4(mvp, pos);

    if (fabs(clip.w) < 1.0e-12f)
    {
        return (float4)(1.0e30f, 1.0e30f, clip.z, clip.w);
    }

    const float invW = 1.0f / clip.w;
    const float ndcX = clip.x * invW;
    const float ndcY = clip.y * invW;

    const float sx = (ndcX * 0.5f + 0.5f) * (float)width;
    const float sy = (1.0f - (ndcY * 0.5f + 0.5f)) * (float)height;

    return (float4)(sx, sy, clip.z, clip.w);
}

// 頂点座標をfloat3から4にするやつ
inline float4 load_position3_as_float4(__global const float* inPos, int vertexIndex)
{
    const int base = vertexIndex * 3;
    return (float4)(
        inPos[base + 0],
        inPos[base + 1],
        inPos[base + 2],
        1.0f
    );
}

// mvp4x4行列よみとり
inline float16 load_matrix16(__global const float* gmvp)
{
    return (float16)(
        gmvp[ 0], gmvp[ 1], gmvp[ 2], gmvp[ 3],
        gmvp[ 4], gmvp[ 5], gmvp[ 6], gmvp[ 7],
        gmvp[ 8], gmvp[ 9], gmvp[10], gmvp[11],
        gmvp[12], gmvp[13], gmvp[14], gmvp[15]
    );
}

// メイン部分
__kernel void Transform_vertices_And_Raster(
    __global const float* inPos,
    __global const float* gmvp,
    __global const int* triidx,
    __global uchar* vram,
    const int vertexCount,
    const int triCount,
    const int width,
    const int height)
{
    const int pixelIndex = (int)get_global_id(0);
    const int px = pixelIndex % width;
    const int py = pixelIndex / width;

    const float2 p = (float2)((float)px, (float)py);
    const float16 mvp = load_matrix16(gmvp);

    int bestTri = -1;
    float bestDepth = 1.0e30f;

    for (int tri = 0; tri < triCount; ++tri)
    {
        const int triBase = tri * 3;
        const int i0 = triidx[triBase + 0];
        const int i1 = triidx[triBase + 1];
        const int i2 = triidx[triBase + 2];

        const float4 v0 = load_position3_as_float4(inPos, i0);
        const float4 v1 = load_position3_as_float4(inPos, i1);
        const float4 v2 = load_position3_as_float4(inPos, i2);

        const float4 c0 = transform_vertex_to_screen(v0, mvp, width, height);
        const float4 c1 = transform_vertex_to_screen(v1, mvp, width, height);
        const float4 c2 = transform_vertex_to_screen(v2, mvp, width, height);

        const float area = edge2d(c0.xy, c1.xy, c2.xy);

        const float e0 = edge2d(c1.xy, c2.xy, p);
        const float e1 = edge2d(c2.xy, c0.xy, p);
        const float e2 = edge2d(c0.xy, c1.xy, p);

        const int allPos = (e0 >= 0.0f) && (e1 >= 0.0f) && (e2 >= 0.0f);
        const int allNeg = (e0 <= 0.0f) && (e1 <= 0.0f) && (e2 <= 0.0f);

        if (!(allPos || allNeg))
            continue;

        const float ndcZ =
            (e0 * (c0.z / c0.w) +
             e1 * (c1.z / c1.w) +
             e2 * (c2.z / c2.w)) / area;

        if (ndcZ >= 0.0f && ndcZ <= 1.0f)
        {
            if (ndcZ < bestDepth)
            {
                bestDepth = ndcZ;
                bestTri = tri;
            }
            else if (ndcZ == bestDepth && bestTri < tri)
            {
                bestDepth = ndcZ;
                bestTri = tri;
            }
        }
    }

	// HSP用にindexととのえたり色付け
    const int outBase = (px + (height - 1 - py) * width) * 3;
    if (bestTri != -1)
    {
        uint color = wang_hash((uint)bestTri * 99326473u) % 16777216u;
        const uchar r = (uchar)( color        & 255u);
        const uchar g = (uchar)((color >> 8)  & 255u);
        const uchar b = (uchar)((color >> 16) & 255u);
        // BGR 書き込み
        vram[outBase + 0] = b;
        vram[outBase + 1] = g;
        vram[outBase + 2] = r;
    }
}
