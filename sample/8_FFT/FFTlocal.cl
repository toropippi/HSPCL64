#define PI 3.14159265358979323846264338328

typedef struct{
	double r;
	double i;
} Complex;

typedef struct{
	float r;
	float i;
} fComplex;


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

fComplex fcadd(fComplex a,fComplex b)
{
	fComplex c;
	c.r = a.r + b.r;
	c.i = a.i + b.i;
	return c;
}

fComplex fcsub(fComplex a,fComplex b)
{
	fComplex c;
	c.r = a.r - b.r;
	c.i = a.i - b.i;
	return c;
}

fComplex fcmul(fComplex a,fComplex b)
{
	fComplex c;
	c.r = a.r * b.r - a.i * b.i;
	c.i = a.r * b.i + a.i * b.r;
	return c;
}

fComplex fcradtow(float rad)
{
	fComplex w;
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


//#define M (8)
//#define N (1<<M)
//thread数は(N/2, 1, 1)
__kernel void fp_FFTlocal(__global fComplex *buffer,int M,__local fComplex *block)
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
		
		fComplex c1 = block[t1];
		fComplex c0 = block[t0];
		
		float rad = -PI * t / dleng;//invの場合これに-をかける
		fComplex rotate = fcradtow(rad);
		
		block[t0] = fcadd(c0,c1);
		block[t1] = fcmul(fcsub(c0,c1),rotate);
	}
	
	barrier(CLK_LOCAL_MEM_FENCE);
	fComplex reim0 = block[reversebits(id * 2) >> (32 - M)];//32はuint=32bitの32
	fComplex reim1 = block[reversebits(id * 2 + 1) >> (32 - M)];
	buffer[id * 2] = reim0;
	buffer[id * 2 + 1] = reim1;
}



//thread数は(N/2, 1, 1)
__kernel void dp_FFTlocal(__global Complex *buffer,int M,__local Complex *block)
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
		
		Complex c1 = block[t1];
		Complex c0 = block[t0];
		
		double rad = -PI * t / dleng;//invの場合これに-をかける
		Complex rotate = radtow(rad);
		
		block[t0] = add(c0,c1);
		block[t1] = mul(sub(c0,c1),rotate);
	}
	
	barrier(CLK_LOCAL_MEM_FENCE);
	Complex reim0 = block[reversebits(id * 2) >> (32 - M)];//32はuint=32bitの32
	Complex reim1 = block[reversebits(id * 2 + 1) >> (32 - M)];
	buffer[id * 2] = reim0;
	buffer[id * 2 + 1] = reim1;
}
