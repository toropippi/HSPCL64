__kernel void membdwdth(__global int* a)
{
	uint gid = get_global_id(0);
    for(uint i=0;i<250000000/128;i++){
		a[gid+i*128]=i;
	}

}
