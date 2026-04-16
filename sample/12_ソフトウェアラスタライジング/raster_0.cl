// まず動かすための最小版
// transform_verticesで全頂点を線形変換
// Rasterで全ピクセル×全三角形のソフトウェアラスタライジング

uint wang_hash(uint seed)
{
	seed = (seed ^ 61) ^ (seed >> 16);
	seed *= 9;
	seed = seed ^ (seed >> 4);
	seed *= 0x27d4eb2d;
	seed = seed ^ (seed >> 15);
	return seed;
}

inline float4 mul_mat4_vec4(__global const float* m, float4 v)
{
    return (float4)(
        m[ 0] * v.x + m[ 1] * v.y + m[ 2] * v.z + m[ 3] * v.w,
        m[ 4] * v.x + m[ 5] * v.y + m[ 6] * v.z + m[ 7] * v.w,
        m[ 8] * v.x + m[ 9] * v.y + m[10] * v.z + m[11] * v.w,
        m[12] * v.x + m[13] * v.y + m[14] * v.z + m[15] * v.w
    );
}

inline float edge2d(float2 a, float2 b, float2 p)
{
    return (p.x - a.x) * (b.y - a.y) - (p.y - a.y) * (b.x - a.x);
}

__kernel void transform_vertices(
    __global const float* inPos,
    __global float4* screenClip,
    __global const float* mvp,
    const int vertexCount,
    const int width,
    const int height)
{
    const int vid = (int)get_global_id(0);
    if (vid >= vertexCount) return;

    float4 pos;
    pos.x = inPos[vid*3+0];
    pos.y = inPos[vid*3+1];
    pos.z = inPos[vid*3+2];
    pos.w = 1;
    const float4 clip = mul_mat4_vec4(mvp, pos);
    
    float4 ret;
    const float invW = 1.0 / clip.w;
    const float ndcX = clip.x * invW;
    const float ndcY = clip.y * invW;

    const float sx = (ndcX * 0.5 + 0.5) * (float)width;
    const float sy = (1.0 - (ndcY * 0.5 + 0.5)) * (float)height;
    ret = (float4)(sx, sy, clip.z, clip.w);
    if (fabs(clip.w) < 1.0e-12) ret = (float4)(1.0e30, 1.0e30, clip.z, clip.w);
    
    screenClip[vid] = ret;
}


__kernel void Raster(
    __global float4* screenClip,
    __global int* triidx,
    __global uchar* vram,
    const int triCount,
    const int width,
    const int height)
{
    const int vid = (int)get_global_id(0);
    const int px = vid % width;
    const int py = vid / width;
	int bestTri = -1;
	float bestDepth = 99999999999.0;
    for(int i=0;i<triCount;i++)
	{
		int base = i*3;
		int t0 = triidx[base];//頂点
		int t1 = triidx[base+1];//頂点
		int t2 = triidx[base+2];//頂点
		//頂点indexから座標を見る
		float4 c0 = screenClip[t0];
		float4 c1 = screenClip[t1];
		float4 c2 = screenClip[t2];
		float2 p = (float2)(px,py);
		//自分担当の座標がこの三角形内にあるかないか
        float area = edge2d(c0.xy, c1.xy, c2.xy);
        float e0 = edge2d(c1.xy, c2.xy, p);
        float e1 = edge2d(c2.xy, c0.xy, p);
        float e2 = edge2d(c0.xy, c1.xy, p);
        int allPos = (e0 >= 0.0f) && (e1 >= 0.0f) && (e2 >= 0.0f);
        int allNeg = (e0 <= 0.0f) && (e1 <= 0.0f) && (e2 <= 0.0f);
        if (!(allPos || allNeg)) continue;
        // screen-space barycentric
        // perspective-correct ndc z
        float ndcZ = (e0 * c0.z / c0.w + e1 * c1.z / c1.w + e2 * c2.z / c2.w) / area;
        if (ndcZ >= 0.0 && ndcZ <= 1.0 && ndcZ <= bestDepth)
        {
			if (ndcZ < bestDepth)
			{
				bestDepth = ndcZ;
				bestTri = i;
			}else{
				if (bestTri<i)
				{
					bestDepth = ndcZ;
					bestTri=i;
				}
            }
        }
	}
	//画面領域に色付け
	int outbase = (px+(height-1-py)*width)*3;
	if (bestTri!=-1)
	{
		uchar3 u3=255;//color
		uint newcol = wang_hash(bestTri*99326473)%16777216;
		u3.x=newcol%256;
		newcol/=256;
		u3.y=newcol%256;
		newcol/=256;
		u3.z=newcol;
		vram[outbase+0]=u3.z;
		vram[outbase+1]=u3.y;
		vram[outbase+2]=u3.x;
	}
}
