__kernel void wake(__global int *mema,__local int kisublock[],__local int gusublock[],__global int *memb,__global int *memc) {
	int ic = get_global_id(0)*64;
	int lid= get_local_id(0);//���[�J��id�擾=0�`255�̂ǂꂩ
	int gid= get_group_id(0);//�O���[�vid�擾=0�`255�̂ǂꂩ
	int reg=0;
	int kisu=0;//0�`255�̐����ϐ�
	int gusu=0;

	for(int i=0;i<64;i++){
	reg=mema[ic+i];
		if (reg%2==0){//if�̌�̓J�b�R�Ŋ���A�u=�v�ł͂Ȃ��u==�v�ɂ��Ȃ��ƃG���[
			gusu++;
		}else{
			kisu++;
		}
	}


	kisublock[lid]=kisu;
	gusublock[lid]=gusu;
	barrier(CLK_LOCAL_MEM_FENCE);//256�̃X���b�h�����A�S�ẴX���b�h�����̖��߂�ǂނ܂ł��̍s�ő҂�


	//256�̐������v����1�ɂ܂Ƃ߂����B
	//256��128��64�E�E�E�ƂȂ�悤�ɑ������킹
	for(int i=128;i>0;i/=2){
		if (i>lid){//���[�J���A�C�e��id��128���Ⴂ�X���b�h�����v�Z�A���̃��[�v�ł�64���Ⴂ�X���b�h�����v�Z�E�E�E�E
			kisublock[lid]+=kisublock[lid+i];
			gusublock[lid]+=gusublock[lid+i];
		}
	barrier(CLK_LOCAL_MEM_FENCE);//256�̃X���b�h�����A����͑S�ẴX���b�h�Ŏ��s���Ȃ���΂����Ȃ�
	}


	if (lid==0){
		memb[gid]=kisublock[0];
		memc[gid]=gusublock[0];
	}
}