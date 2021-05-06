__kernel void t1(__global uint* OUT)
{
    uint ic = get_global_id(0);
    OUT[ic] = ic+4;
}

uint bitReverse(unsigned int gid,unsigned int bit_long)
{
    unsigned int j = gid;
    j = (j & 0x55555555) <<  1 | (j & 0xAAAAAAAA) >>  1; 
    j = (j & 0x33333333) <<  2 | (j & 0xCCCCCCCC) >>  2; 
    j = (j & 0x0F0F0F0F) <<  4 | (j & 0xF0F0F0F0) >>  4; 
    j = (j & 0x00FF00FF) <<  8 | (j & 0xFF00FF00) >>  8; 
    j = (j & 0x0000FFFF) << 16 | (j & 0xFFFF0000) >> 16; 
    j >>= (32-bit_long);
	return j;
}

__kernel void t2(__global uint* OUT)
{
	uint ic = get_global_id(0);
	uint store_ic=bitReverse(ic,28);
	OUT[store_ic] = ic+4;//ここでのメモリアクセスはランダムである
}