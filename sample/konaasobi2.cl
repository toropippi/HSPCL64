typedef struct{
	unsigned char b;
	unsigned char g;
	unsigned char r;
} Vec3c;


//�ȈՃ����_���A�����O�n�b�V��
uint wang_hash(uint seed)
{
	seed = (seed ^ 61) ^ (seed >> 16);
	seed *= 9;
	seed = seed ^ (seed >> 4);
	seed *= 0x27d4eb2d;
	seed = seed ^ (seed >> 15);
	return seed;
}


//p_pos��莞�Ԍo�ߌ㏉����
__kernel void p_pos_init(__global uint *p_pos,__global unsigned char *p_vram,uint offset) 
{
	uint id = get_global_id(0);
	uint tp=p_pos[id+offset];
	uint x=tp&0x0000ffff;
	uint y=tp>>16;
	
	if (y>WINY-2)
	{
		unsigned char c=p_vram[(WINY-1)*WINX+WINX/2-16+id%32];
		if (c==0)
		{
			p_pos[id+offset]=WINX/2-16+id%32;
		}
	}
}


//w3�ɕǏ��bgr�œ����Ă���B����3char��1char�ɂ܂Ƃ߂�
__kernel void w3_to_w(__global Vec3c *w3_vram,__global unsigned char *w_vram) 
{
	uint id = get_global_id(0);
	Vec3c col=w3_vram[id];
	unsigned char outc=0;
	if ((col.r!=0)|(col.g!=0)|(col.b!=0))outc=255;
	w_vram[id]=outc;
}




//�p�[�e�B�N����move���v�Z
__kernel void Move(__global uint *p_pos,__global int *vram_dmy0,__global int *vram_dmy1
,__global int *vram_dmy2,__global unsigned char *p_vram,uint seed_in) 
{
	uint id = get_global_id(0);
	uint tp=p_pos[id];
	uint x=tp&0x0000ffff;
	uint y=tp>>16;
	
	//��ԉ��̃��C���ɂ��Ă�������Ł��v�Z���Ȃ��B
	if (y==WINY-1)
	{
		return;
	}
	
	//move1 �������������Ă�����100%���ɗ�������
	unsigned char c=p_vram[x+(WINY-1-y-1)*WINX];
	if (c==0)
	{
		y++;
		vram_dmy0[y*WINX+x]=id;//������̍��W�ňꎞ��ʂɓo�^
	}else{//�����悪�����ĂȂ����
		//�O���Ɉړ��A�P�E�Ɉړ��A�Q�ړ����Ȃ��B�E�����܂��Ă��č��������Ă����100%���ɁA�������܂��ĉE�������Ă����100%�E�Ɉړ�����
		uint rnd=wang_hash(seed_in + id * 1847483629);
		rnd%=2;
		unsigned char cr=255;//255=��
		unsigned char cl=255;//255=��
		if (x!=0)cl=p_vram[x-1+(WINY-1-y)*WINX];//���̏��
		if (x!=WINX-1)cr=p_vram[x+1+(WINY-1-y)*WINX];//�E�̏��
		
		if (cl!=0)
		{
			rnd=1;
			if (cr!=0)rnd=2;
		}
		else
		{
			if (cr!=0)rnd=0;
		}
		
		
		if (rnd==0)
		{
			vram_dmy1[y*WINX+x-1]=id;//���ړ���̍��W�ňꎞ��ʂɓo�^
		}
		if (rnd==1)
		{
			vram_dmy2[y*WINX+x+1]=id;//�E�ړ���̍��W�ňꎞ��ʂɓo�^
		}
	}
	
	
}






//�p�[�e�B�N���̉��ړ����m�肳����
//vram_dmy�̒��g��-1������
__kernel void FixPosition(__global uint *p_pos,__global int *vram_dmy0,__global int *vram_dmy1
,__global int *vram_dmy2,uint seed_in) 
{
	uint id = get_global_id(0);
	int pid;
	
	//�����ォ�炫�Ă����炻�ꂪ�D��B�ォ�痈�Ă��炸�A���E���炫�ďd�Ȃ��Ă�Ȃ炶��񂯂�
	if (vram_dmy0[id]!=-1)
	{
		pid=vram_dmy0[id];
		p_pos[pid]+=65536;//y���W��1�v���X���邱�ƂƓ���
	}
	else
	{
		int v[2];//���W�X�^������
		v[0]=vram_dmy1[id];
		v[1]=vram_dmy2[id];
		int mode=-1;
		//mode 0�Ȃ�m��ŉE����p�[�e�B�N�����ړ����Ă���
		//mode 1�Ȃ�m��ō�����p�[�e�B�N�����ړ����Ă���
		//mode 2�Ȃ獶�E����p�[�e�B�N�����ړ����Ă����̂ł���񂯂�
		
		if ((v[0]!=-1)&(v[1]==-1))//
		{
			mode=0;
		}
		if ((v[0]==-1)&(v[1]!=-1))//
		{
			mode=1;
		}
		
		if ((v[0]!=-1)&(v[1]!=-1))//
		{
			mode=2;
			uint rnd=wang_hash(seed_in+v[0]+v[1]);
			mode=rnd%2;
		}
		
		if (mode!=-1)
		{
			pid=v[mode];
			p_pos[pid]+=mode*2-1;//mode==0�ŉE�̃p�[�e�B�N����-1�h�b�g�ړ����Ă����Amode==1�ō��̃p�[�e�B�N����+1�h�b�g�ړ����Ă���
		}
	}
	
	
	
	//������
	vram_dmy0[id]=-1;
	vram_dmy1[id]=-1;
	vram_dmy2[id]=-1;
}


//�p�[�e�B�N�����h�b�g���p_vram�ɍX�V
__kernel void Psetp_vram(__global uint *p_pos,__global unsigned char *p_vram) 
{
	uint id = get_global_id(0);
	uint tp=p_pos[id];
	uint x=tp&0x0000ffff;
	uint y=tp>>16;
	p_vram[(WINY-1-y)*WINX+x]=255;
}






//�p�[�e�B�N���`��
//HSP��vram��ʂ�b,g,r�̏��ō�������E�Ɍ������Ă����̂�
__kernel void PsetParticle(__global uint *p_pos,__global unsigned char *d3_vram) 
{
	uint id = get_global_id(0);
	uint tp=p_pos[id];
	uint x=tp&0x0000ffff;
	uint y=tp>>16;
	
	
	uint widx=((WINY-1-y)*WINX+x)*3;
	d3_vram[widx+0]=255;//b
	d3_vram[widx+1]=255;//g
	d3_vram[widx+2]=255;//r
	
}

