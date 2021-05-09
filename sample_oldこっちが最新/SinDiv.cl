__kernel void SinDiv(__global int* a,__global int* b,int loopnum)
{
	uint gid = get_global_id(0);
	float x=0.00003f*a[gid];
	float y=1.0f;
	
	for(int i=0;i<loopnum;i++)
	{
		y=(y+0.8f)/(1.0f+sin(y+x));
	}
	b[gid] = (int)(1000000.0f*y);
}
