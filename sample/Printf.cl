__kernel void prnt(__global int* a)
{
	int b=a[get_global_id(0)];
	printf("%d\n",b);
}
