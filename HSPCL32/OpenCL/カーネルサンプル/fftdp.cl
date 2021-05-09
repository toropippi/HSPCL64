#ifdef cl_khr_fp64
  #pragma OPENCL EXTENSION cl_khr_fp64 : enable
#elif defined(cl_amd_fp64)
  #pragma OPENCL EXTENSION cl_amd_fp64 : enable
#else
  #error Double precision floating point not supported by OpenCL implementation.
#endif



typedef struct{
	double r;
	double i;
} Vec2;



void bitReverse(uint gid,uint m,uint *rvs)
{
    uint j = gid;
    j = (j & 0x55555555) <<  1 | (j & 0xAAAAAAAA) >>  1; 
    j = (j & 0x33333333) <<  2 | (j & 0xCCCCCCCC) >>  2; 
    j = (j & 0x0F0F0F0F) <<  4 | (j & 0xF0F0F0F0) >>  4; 
    j = (j & 0x00FF00FF) <<  8 | (j & 0xFF00FF00) >>  8; 
    j = (j & 0x0000FFFF) << 16 | (j & 0xFFFF0000) >> 16; 

    j >>= (32-m);
	*rvs=j;
}




__kernel void fft(__global Vec2 *fftarray,uint n,uint bekisisuu,uint cnt) {
/*
			dup reitjoqccnt1,reitjo(inind2.qct0q)
			dup imitjoqccnt1,imitjo(inind2.qct0q)
			dup reitjoqccnt2,reitjo(inind2.qct1q)
			dup imitjoqccnt2,imitjo(inind2.qct1q)
			ita=reitjoqccnt2*qcosq.qcn2q-imitjoqccnt2*qsinq.qcn2q
			itb=imitjoqccnt2*qcosq.qcn2q+reitjoqccnt2*qsinq.qcn2q
			reitjoqccnt2=reitjoqccnt1-ita
			imitjoqccnt2=imitjoqccnt1-itb
			reitjoqccnt1+=ita
			imitjoqccnt1+=itb
*/

	uint gid = get_global_id(0);
	uint index1=((gid>>cnt)<<(cnt+1))+(gid%(1<<cnt));
	uint index2=index1+(1<<cnt);
	Vec2 itj1=fftarray[index1];
	Vec2 itj2=fftarray[index2];
	Vec2 itab;
	double rad=-3.1415926535897932384626433832795*2.0*(gid%(1<<cnt))/(n>>(bekisisuu-1-cnt));
	double tcos=cos(rad);
	double tsin=sin(rad);
	itab.r=itj2.r*tcos-itj2.i*tsin;
	itab.i=itj2.i*tcos+itj2.r*tsin;
	itj2.r=itj1.r-itab.r;
	itj2.i=itj1.i-itab.i;
	itj1.r+=itab.r;
	itj1.i+=itab.i;
	fftarray[index2]=itj2;
	fftarray[index1]=itj1;
}

__kernel void kbitReverse(__global Vec2 *fftarrays,__global Vec2 *fftarrayd,uint bekisisuu) {
	uint gid=get_global_id(0);
	uint revindex;
	bitReverse(gid,bekisisuu,&revindex);
	fftarrayd[gid]=fftarrays[revindex];
}
