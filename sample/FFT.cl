#define PI 3.14159265358979323846264338328

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


//thread数は(N, 1, 1)
__kernel void BitRev(__global dVec2 *buffer,int M)
{
	uint id = get_global_id(0);
	uint rid=reversebits(id)>>(32-M);
	if (id>=rid)return;
	dVec2 d2a=buffer[id];
	dVec2 d2b=buffer[rid];
	buffer[id]=d2b;
	buffer[rid]=d2a;
}

//thread数は(N/2, 1, 1)
__kernel void FFT(__global dVec2 *buffer,__global dVec2 *bufferdmy,int M,int loopidx)
{
	uint id = get_global_id(0);
	
	uint dleng = 1 << (M - loopidx - 1);
	uint t = id % dleng;
	uint t0 = (id / dleng) * dleng * 2 + t;
	uint t1 = t0 + dleng;
	double r1 = buffer[t1].r;
	double i1 = buffer[t1].i;
	double r0 = buffer[t0].r - r1;
	double i0 = buffer[t0].i - i1;
	double rad = PI * t / dleng;//invで-がかかる
	double dsin = sin(rad);
	double dcos = cos(rad);
	buffer[t0].r += r1;
	buffer[t0].i += i1;
	buffer[t1].r = r0 * dcos - i0 * dsin;
	buffer[t1].i = r0 * dsin + i0 * dcos;
}
