__kernel void Subtraction(__global double* a)
{
    double a0=a[0];
    double a1=a[1];
    double a2;
	a2=a1-a0;
    a[2]=a2;
}
