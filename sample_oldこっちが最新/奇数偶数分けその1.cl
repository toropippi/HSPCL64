__kernel void wake(__global int *mema,__global uchar *memb,__global uchar *memc) {
	int ic = get_global_id(0);
	int ic64 = get_global_id(0)*64;
	int reg=0;
	uchar kisu=0;//0�`255�̐����ϐ�
	uchar gusu=0;

	for(int i=0;i<64;i++){
	reg=mema[ic64+i];
		if (reg%2==0){//if�̌�̓J�b�R�Ŋ���A�u=�v�ł͂Ȃ��u==�v�ɂ��Ȃ��ƃG���[
			gusu++;
		}else{
			kisu++;
		}
	}

	memb[ic]=kisu;
	memc[ic]=gusu;
}