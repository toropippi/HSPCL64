__kernel void vecAdd(__global int* a)
{
    uint gid = get_global_id(0);

    a[gid] += a[gid];
}
