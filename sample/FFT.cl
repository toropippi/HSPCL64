#define PI 3.14159265358979323846264338328

typedef struct{
	double r;
	double i;
} Complex;

Complex add(Complex a,Complex b)
{
	Complex c;
	c.r = a.r + b.r;
	c.i = a.i + b.i;
	return c;
}

Complex sub(Complex a,Complex b)
{
	Complex c;
	c.r = a.r - b.r;
	c.i = a.i - b.i;
	return c;
}

Complex mul(Complex a,Complex b)
{
	Complex c;
	c.r = a.r * b.r - a.i * b.i;
	c.i = a.r * b.i + a.i * b.r;
	return c;
}

Complex radtow(double rad)
{
	Complex w;
	w.r = cos(rad);
	w.i = sin(rad);
	return w;
}




uint reversebits(uint id)
{
	uint j = id;
	j = (j & 0x55555555) <<  1 | (j & 0xAAAAAAAA) >>  1; 
	j = (j & 0x33333333) <<  2 | (j & 0xCCCCCCCC) >>  2; 
	j = (j & 0x0F0F0F0F) <<  4 | (j & 0xF0F0F0F0) >>  4; 
	j = (j & 0x00FF00FF) <<  8 | (j & 0xFF00FF00) >>  8; 
	j = (j & 0x0000FFFF) << 16 | (j & 0xFFFF0000) >> 16; 
	return j;
}


//thread数は(N, 1, 1)
__kernel void BitRev(__global Complex *buffer,int M)
{
	uint id = get_global_id(0);
	uint rid=reversebits(id)>>(32-M);
	if (id>=rid)return;
	Complex d2a=buffer[id];
	Complex d2b=buffer[rid];
	buffer[id]=d2b;
	buffer[rid]=d2a;
}

//thread数は(N/2, 1, 1)
__kernel void CooleyTukey(__global Complex *buffer,int M,int loopidx)
{
	uint id = get_global_id(0);
	
	uint dleng = 1 << (M - loopidx - 1);
	uint t = id % dleng;
	uint t0 = (id / dleng) * dleng * 2 + t;
	uint t1 = t0 + dleng;
	
	Complex c1 = buffer[t1];
	Complex c0 = buffer[t0];
	
	double rad = -PI * t / dleng;//invの場合これに-をかける
	Complex rotate = radtow(rad);
	
	buffer[t0] = add(c0,c1);
	buffer[t1] = mul(sub(c0,c1),rotate);
}






//thread数は(N/2, 1, 1)
__kernel void Stockham(__global Complex *buffer,__global Complex *buffer2,int M,int loopidx)
{
	uint id = get_global_id(0);
	uint s = 1<<loopidx;
	uint N = 1<<M;
	
	uint t = id % s;
	uint in0 = id;
	uint in1 = id+N/2;
	uint out0 = (id/s)*s*2+t;
	uint out1 = out0+s;
	
	
	Complex c0 = buffer[in0];
	Complex c1 = buffer[in1];
	
	double rad = -PI*t/s;
	Complex rotate = radtow(rad);
	
	c1 = mul(c1,rotate);
	
	buffer2[out0] = add(c0,c1);
	buffer2[out1] = sub(c0,c1);
}
