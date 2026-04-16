// 2pass 構成
// pass1: 画面上の各ピクセルについて、最前面の三角形IDを求める
// pass2: 三角形IDから頂点法線を取り出し、重心座標で補間して Lambert ライティングする
//
// 前提:
// - 頂点位置 inPos は 1頂点あたり float3 (xyz)
// - 頂点法線 inNrm は 1頂点あたり float3 (xyz)
// - triidx は 1三角形あたり int3 (頂点index)
// - nmat は 3x3 の法線変換行列 (row-major)
// - lightParam のレイアウトは以下
//     [0..2]  : ライト方向ベクトル (view space, surface -> light)
//     [4..6]  : ambient RGB (0.0～1.0)
//     [8..10] : diffuse RGB (0.0～1.0)
//
// 注意:
// - 法線補間は perspective-correct にしてあります
// - ここでは鏡面反射は入れていません。まずは拡散反射のみです

inline float4 mul_mat4_vec4(float16 m, float4 v)
{
    return (float4)(
        m.s0 * v.x + m.s1 * v.y + m.s2 * v.z + m.s3 * v.w,
        m.s4 * v.x + m.s5 * v.y + m.s6 * v.z + m.s7 * v.w,
        m.s8 * v.x + m.s9 * v.y + m.sa * v.z + m.sb * v.w,
        m.sc * v.x + m.sd * v.y + m.se * v.z + m.sf * v.w
    );
}

inline float3 mul_mat3_vec3_row_major(__global const float* m, float3 v)
{
    return (float3)(
        m[0] * v.x + m[1] * v.y + m[2] * v.z,
        m[3] * v.x + m[4] * v.y + m[5] * v.z,
        m[6] * v.x + m[7] * v.y + m[8] * v.z
    );
}

inline float edge2d(float2 a, float2 b, float2 p)
{
    return (p.x - a.x) * (b.y - a.y) - (p.y - a.y) * (b.x - a.x);
}

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

inline float3 load_normal3(__global const float* inNrm, int vertexIndex)
{
    const int base = vertexIndex * 3;
    return (float3)(
        inNrm[base + 0],
        inNrm[base + 1],
        inNrm[base + 2]
    );
}

inline float16 load_matrix16(__global const float* gmvp)
{
    return (float16)(
        gmvp[ 0], gmvp[ 1], gmvp[ 2], gmvp[ 3],
        gmvp[ 4], gmvp[ 5], gmvp[ 6], gmvp[ 7],
        gmvp[ 8], gmvp[ 9], gmvp[10], gmvp[11],
        gmvp[12], gmvp[13], gmvp[14], gmvp[15]
    );
}

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

// ------------------------------------------------------------
// pass1: 最前面の三角形IDを求める
// ------------------------------------------------------------
__kernel void RasterizeTriId(
    __global const float* inPos,
    __global const float* gmvp,
    __global const int* triidx,
    __global int* triIdBuffer,
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
        if (fabs(area) < 1.0e-12f)
            continue;

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

    triIdBuffer[pixelIndex] = bestTri;
}

// ------------------------------------------------------------
// pass2: triId から法線を補間して色を決める
// ------------------------------------------------------------
__kernel void ShadeFromTriId(
    __global const float* inPos,
    __global const float* inNrm,
    __global const float* gmvp,
    __global const float* nmat,
    __global const int* triidx,
    __global const int* triIdBuffer,
    __global const float* lightParam,
    __global uchar* vram,
    const int triCount,
    const int width,
    const int height)
{
    const int pixelIndex = (int)get_global_id(0);
    const int px = pixelIndex % width;
    const int py = pixelIndex / width;
    const int outBase = (px + (height - 1 - py) * width) * 3;

    const int tri = triIdBuffer[pixelIndex];
    if (tri < 0 || tri >= triCount)
    {
        vram[outBase + 0] = (uchar)0;
        vram[outBase + 1] = (uchar)0;
        vram[outBase + 2] = (uchar)0;
        return;
    }

    const int triBase = tri * 3;
    const int i0 = triidx[triBase + 0];
    const int i1 = triidx[triBase + 1];
    const int i2 = triidx[triBase + 2];

    const float16 mvp = load_matrix16(gmvp);

    const float4 v0 = load_position3_as_float4(inPos, i0);
    const float4 v1 = load_position3_as_float4(inPos, i1);
    const float4 v2 = load_position3_as_float4(inPos, i2);

    const float4 c0 = transform_vertex_to_screen(v0, mvp, width, height);
    const float4 c1 = transform_vertex_to_screen(v1, mvp, width, height);
    const float4 c2 = transform_vertex_to_screen(v2, mvp, width, height);

    const float2 p = (float2)((float)px, (float)py);
    const float area = edge2d(c0.xy, c1.xy, c2.xy);
    if (fabs(area) < 1.0e-12f)
    {
        vram[outBase + 0] = (uchar)0;
        vram[outBase + 1] = (uchar)0;
        vram[outBase + 2] = (uchar)0;
        return;
    }

    const float a0 = edge2d(c1.xy, c2.xy, p) / area;
    const float a1 = edge2d(c2.xy, c0.xy, p) / area;
    const float a2 = edge2d(c0.xy, c1.xy, p) / area;

    // perspective-correct 重み
    const float rw0 = a0 / c0.w;
    const float rw1 = a1 / c1.w;
    const float rw2 = a2 / c2.w;
    const float denom = rw0 + rw1 + rw2;

    if (fabs(denom) < 1.0e-12f)
    {
        vram[outBase + 0] = (uchar)0;
        vram[outBase + 1] = (uchar)0;
        vram[outBase + 2] = (uchar)0;
        return;
    }

    const float w0 = rw0 / denom;
    const float w1 = rw1 / denom;
    const float w2 = rw2 / denom;

    const float3 n0 = load_normal3(inNrm, i0);
    const float3 n1 = load_normal3(inNrm, i1);
    const float3 n2 = load_normal3(inNrm, i2);

    // object space で補間 → view space に回す
    float3 N = n0 * w0 + n1 * w1 + n2 * w2;
    N = normalize(mul_mat3_vec3_row_major(nmat, N));

    const float3 L = normalize((float3)(lightParam[0], lightParam[1], lightParam[2]));
    const float3 ambient = (float3)(lightParam[4], lightParam[5], lightParam[6]);
    const float3 diffuse = (float3)(lightParam[8], lightParam[9], lightParam[10]);

    const float ndotl = fmax(dot(N, L), 0.0f);
    float3 lit = ambient + diffuse * ndotl;
    lit = clamp(lit, 0.0f, 1.0f);

    const uchar r = (uchar)(lit.x * 255.0f);
    const uchar g = (uchar)(lit.y * 255.0f);
    const uchar b = (uchar)(lit.z * 255.0f);

    // HSP 側 VRAM は BGR 順で書き込む
    vram[outBase + 0] = b;
    vram[outBase + 1] = g;
    vram[outBase + 2] = r;
}
