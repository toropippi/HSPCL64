#pragma OPENCL EXTENSION cl_khr_fp16 : enable

#define PI 3.14159265358979323846264338328
#define fT float

//F[k]=ƒ°_j=0^n-1 a[j]*cos(pi*(j+1/2)*k/n),0<=k<n ‚ðŒvŽZ‚·‚é.
__kernel void dct_ii(int n,__global uchar *hspvram,__global fT *b,__local fT *block,uint width)
{
	uint id = get_global_id(0);
	uint lid = get_local_id(0);
	uint width8=width/8;
	uint gid = id/64;
	uint gidx = gid%width8;
	uint gidy = gid/width8;
	uint k=lid%8;
	uint g=lid/8;
	uint posid=(gidy*8+g)*width+gidx*8+k;
	float col=(float)((uint)(hspvram[posid*3])+(uint)(hspvram[posid*3+1])+(uint)(hspvram[posid*3+2]));
	block[lid]=col*0.3333333333/256;
	
	barrier(CLK_LOCAL_MEM_FENCE);
	fT ret=0.0;
	for(int j=0;j<8;j++)
	{
		ret+=block[g*8+j]*cos(PI*(0.5+j)*k/n);
	}
	
	barrier(CLK_LOCAL_MEM_FENCE);
	block[g*8+k]=ret;
	barrier(CLK_LOCAL_MEM_FENCE);
	
	ret=0.0;
	for(int j=0;j<8;j++)
	{
		ret+=block[j*8+g]*cos(PI*(0.5+j)*k/n);
	}
	
	block[k*8+g]=ret;
	barrier(CLK_LOCAL_MEM_FENCE);
	
	ret=block[lid];
	if (g+k>=4)ret=0;
	if (g+k<=3){
		half h=ret;
		ret=(float)h;
	}
	
	b[id]=ret;
}



//a[k]=ƒ°_j=0^n-1 F[j]*cos(pi*j*(k+1/2)/n),0<=k<n ‚ðŒvŽZ‚·‚é.
__kernel void dct_iii(int n,__global fT *b,__global uchar *hspvram,__local fT *block,__local fT *a0,uint width)
{
	uint id = get_global_id(0);
	uint lid = get_local_id(0);
	uint width8 = width/8;
	uint gid = id/64;
	uint gidx = gid%width8;
	uint gidy = gid/width8;
	uint k=lid%8;
	uint g=lid/8;
	uint posid=(gidy*8+g)*width+gidx*8+k;
	
	fT aa=b[id];
	block[lid]=aa;
	if (g==0){
		a0[k]=aa;
	}
	barrier(CLK_LOCAL_MEM_FENCE);
	
	
	fT ret=0.0;
	for(int j=0;j<8;j++)
	{
		ret+=block[j*8+g]*cos(PI*j*(0.5+k)/n);
	}
	ret=(ret*2.0-a0[g])/n;
	barrier(CLK_LOCAL_MEM_FENCE);
	
	block[k*8+g]=ret;
	if (g==0){
		a0[k]=ret;
	}
	barrier(CLK_LOCAL_MEM_FENCE);
	
	
	ret=0.0;
	for(int j=0;j<8;j++)
	{
		ret+=block[j+g*8]*cos(PI*j*(0.5+k)/n);
	}
	ret=(ret*2.0-a0[g])/n;
	
	
	if (ret<0)ret=0.0;
	if (ret>=1.0)ret=1.0;
	//float col=(float)((uint)(hspvram[posid*3])+(uint)(hspvram[posid*3+1])+(uint)(hspvram[posid*3+2]));
	uchar col=(uchar)(ret*255.9);
	hspvram[posid*3  ]=col;
	hspvram[posid*3+1]=col;
	hspvram[posid*3+2]=col;
}

















