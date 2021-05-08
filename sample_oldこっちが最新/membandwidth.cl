__kernel void membdwdth(__global int* a)
{
	uint gid = get_global_id(0);
	a[gid]=12345;
}