__kernel void vecAdd(__global int* a,__global int* b,__global int* c)
{
    uint gid = get_global_id(0);
    c[gid] = a[gid] + b[gid];
}


__kernel void vecAddD(__global double* a,__global double* b,__global double* c)
{
    uint gid = get_global_id(0);
    c[gid] = a[gid] + b[gid];
}
