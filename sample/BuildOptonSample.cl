__kernel void Mul(__global int* a)
{
	a[1]=a[0]*SCALE;
	a[1]=printf("aaaaaaaaaaa\n\r\n");
}
