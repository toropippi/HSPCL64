






















//global_size=256*raw
//local_size=256
//Y=Ax
__kernel void SGEMV(__global float* A,__global float* X,__global float* Y,int col)
{
	int gi=get_group_id(0);
	int i=get_local_id(0);
	int li=i;
	float r=0.0;
	for(;i<col;i+=256)
	{
		r+=A[gi*col+i]*X[i];
	}
	
	__local float S[256];
	S[li]=r;
	i=128;
	for(;i>0;i/=2)
	{
		barrier(CLK_LOCAL_MEM_FENCE);
		if (li<i)S[li]+=S[li+i];
	}
	if (li==0){Y[gi]=S[0];}
}


//global_size=(col+63)/64*64
//local_size=64
//Y=xA
__kernel void SGEVM(__global float* A,__global float* X,__global float* Y,int col,int raw)
{
	int idx=get_global_id(0);
	if (idx>=col)return;
	float r=0.0;
	for(int j=0;j<raw;j++)
	{
		r+=A[idx+j*col]*X[j];
	}
	Y[idx]=r;
}