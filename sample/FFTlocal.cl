#define PI 3.14159265358979323846264338328

typedef struct{
	float r;
	float i;
} Vec2;
typedef struct{
	double r;
	double i;
} dVec2;




unsigned int reversebits(uint id)
{
	unsigned int j = id;
	j = (j & 0x55555555) <<  1 | (j & 0xAAAAAAAA) >>  1; 
	j = (j & 0x33333333) <<  2 | (j & 0xCCCCCCCC) >>  2; 
	j = (j & 0x0F0F0F0F) <<  4 | (j & 0xF0F0F0F0) >>  4; 
	j = (j & 0x00FF00FF) <<  8 | (j & 0xFF00FF00) >>  8; 
	j = (j & 0x0000FFFF) << 16 | (j & 0xFFFF0000) >> 16; 
	return j;
}



//#define M (8)
//#define N (1<<M)
//thread数は(N/2, 1, 1)
__kernel void fp_FFTlocal(__global Vec2 *buffer,int M,__local Vec2 *block)
{
	uint id = get_global_id(0);
	block[id * 2] = buffer[id * 2];
	block[id * 2 + 1] = buffer[id * 2 + 1];
	
	for (uint loopidx = 0; loopidx < M; loopidx++)
	{
		uint dleng = 1 << (M - loopidx - 1);
		uint t = id % dleng;
		uint t0 = (id / dleng) * dleng * 2 + t;
		uint t1 = t0 + dleng;
		barrier(CLK_LOCAL_MEM_FENCE);
		float r1 = block[t1].r;
		float i1 = block[t1].i;
		float r0 = block[t0].r - r1;
		float i0 = block[t0].i - i1;
		float rad = -PI * t / dleng;
		float fsin = sin(rad);
		float fcos = cos(rad);
		block[t0].r += r1;
		block[t0].i += i1;
		block[t1].r = r0 * fcos - i0 * fsin;
		block[t1].i = r0 * fsin + i0 * fcos;
	}
	
	barrier(CLK_LOCAL_MEM_FENCE);
	Vec2 reim0 = block[reversebits(id * 2) >> (32 - M)];//32はuint=32bitの32
	Vec2 reim1 = block[reversebits(id * 2 + 1) >> (32 - M)];
	buffer[id * 2] = reim0;
	buffer[id * 2 + 1] = reim1;
}



//thread数は(N/2, 1, 1)
__kernel void dp_FFTlocal(__global dVec2 *buffer,int M,__local dVec2 *block)
{
	uint id = get_global_id(0);
	block[id * 2] = buffer[id * 2];
	block[id * 2 + 1] = buffer[id * 2 + 1];
	
	for (uint loopidx = 0; loopidx < M; loopidx++)
	{
		uint dleng = 1 << (M - loopidx - 1);
		uint t = id % dleng;
		uint t0 = (id / dleng) * dleng * 2 + t;
		uint t1 = t0 + dleng;
		barrier(CLK_LOCAL_MEM_FENCE);
		double r1 = block[t1].r;
		double i1 = block[t1].i;
		double r0 = block[t0].r - r1;
		double i0 = block[t0].i - i1;
		double rad = -PI * t / dleng;//invで-がかかる
		double dsin = sin(rad);
		double dcos = cos(rad);
		block[t0].r += r1;
		block[t0].i += i1;
		block[t1].r = r0 * dcos - i0 * dsin;
		block[t1].i = r0 * dsin + i0 * dcos;
	}
	
	barrier(CLK_LOCAL_MEM_FENCE);
	dVec2 reim0 = block[reversebits(id * 2) >> (32 - M)];//32はuint=32bitの32
	dVec2 reim1 = block[reversebits(id * 2 + 1) >> (32 - M)];
	buffer[id * 2] = reim0;
	buffer[id * 2 + 1] = reim1;
}
