void bitReverse(uint gid,uint m,uint *rvs)
{
    uint j = gid;
    j = (j & 0x55555555) <<  1 | (j & 0xAAAAAAAA) >>  1; 
    j = (j & 0x33333333) <<  2 | (j & 0xCCCCCCCC) >>  2; 
    j = (j & 0x0F0F0F0F) <<  4 | (j & 0xF0F0F0F0) >>  4; 
    j = (j & 0x00FF00FF) <<  8 | (j & 0xFF00FF00) >>  8; 
    j = (j & 0x0000FFFF) << 16 | (j & 0xFFFF0000) >> 16; 

    j >>= (32-m);
	*rvs=j;
}




__kernel void test(__global int *vram) {
	uint ic = get_global_id(0);//0�`32*1024*1024 �܂�2^25
	uint nweic;
	bitReverse(ic,(uint)25,&nweic);//�r�b�g�t�����v�Z
	bitReverse(nweic,(uint)25,&ic);//������x�r�b�g�t�����v�Z�A����Ō��ɖ߂����B
	vram[ic]=get_global_id(0);//�����ł̃������A�N�Z�X�͘A���ł���
}