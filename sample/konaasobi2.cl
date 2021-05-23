typedef struct{
	unsigned char b;
	unsigned char g;
	unsigned char r;
} Vec3c;


//簡易ランダム、ワングハッシュ
uint wang_hash(uint seed)
{
	seed = (seed ^ 61) ^ (seed >> 16);
	seed *= 9;
	seed = seed ^ (seed >> 4);
	seed *= 0x27d4eb2d;
	seed = seed ^ (seed >> 15);
	return seed;
}


//p_pos一定時間経過後初期化
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


//w3に壁情報がbgrで入っている。この3charを1charにまとめる
__kernel void w3_to_w(__global Vec3c *w3_vram,__global unsigned char *w_vram) 
{
	uint id = get_global_id(0);
	Vec3c col=w3_vram[id];
	unsigned char outc=0;
	if ((col.r!=0)|(col.g!=0)|(col.b!=0))outc=255;
	w_vram[id]=outc;
}




//パーティクルのmoveを計算
__kernel void Move(__global uint *p_pos,__global int *vram_dmy0,__global int *vram_dmy1
,__global int *vram_dmy2,__global unsigned char *p_vram,uint seed_in) 
{
	uint id = get_global_id(0);
	uint tp=p_pos[id];
	uint x=tp&0x0000ffff;
	uint y=tp>>16;
	
	//一番下のラインにきていたら消滅＝計算しない。
	if (y==WINY-1)
	{
		return;
	}
	
	//move1 もし下があいていたら100%下に落下する
	unsigned char c=p_vram[x+(WINY-1-y-1)*WINX];
	if (c==0)
	{
		y++;
		vram_dmy0[y*WINX+x]=id;//落下後の座標で一時画面に登録
	}else{//落下先があいてなければ
		//０左に移動、１右に移動、２移動しない。右が埋まっていて左があいていれば100%左に、左が埋まって右があいていれば100%右に移動する
		uint rnd=wang_hash(seed_in + id * 1847483629);
		rnd%=2;
		unsigned char cr=255;//255=壁
		unsigned char cl=255;//255=壁
		if (x!=0)cl=p_vram[x-1+(WINY-1-y)*WINX];//左の状態
		if (x!=WINX-1)cr=p_vram[x+1+(WINY-1-y)*WINX];//右の状態
		
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
			vram_dmy1[y*WINX+x-1]=id;//左移動後の座標で一時画面に登録
		}
		if (rnd==1)
		{
			vram_dmy2[y*WINX+x+1]=id;//右移動後の座標で一時画面に登録
		}
	}
	
	
}






//パーティクルの仮移動を確定させて
//vram_dmyの中身を-1初期化
__kernel void FixPosition(__global uint *p_pos,__global int *vram_dmy0,__global int *vram_dmy1
,__global int *vram_dmy2,uint seed_in) 
{
	uint id = get_global_id(0);
	int pid;
	
	//もし上からきていたらそれが優先。上から来ておらず、左右からきて重なってるならじゃんけん
	if (vram_dmy0[id]!=-1)
	{
		pid=vram_dmy0[id];
		p_pos[pid]+=65536;//y座標を1プラスすることと同じ
	}
	else
	{
		int v[2];//レジスタ初期化
		v[0]=vram_dmy1[id];
		v[1]=vram_dmy2[id];
		int mode=-1;
		//mode 0なら確定で右からパーティクルが移動してきた
		//mode 1なら確定で左からパーティクルが移動してきた
		//mode 2なら左右からパーティクルが移動してきたのでじゃんけん
		
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
			p_pos[pid]+=mode*2-1;//mode==0で右のパーティクルが-1ドット移動してきた、mode==1で左のパーティクルが+1ドット移動してきた
		}
	}
	
	
	
	//初期化
	vram_dmy0[id]=-1;
	vram_dmy1[id]=-1;
	vram_dmy2[id]=-1;
}


//パーティクルをドット情報p_vramに更新
__kernel void Psetp_vram(__global uint *p_pos,__global unsigned char *p_vram) 
{
	uint id = get_global_id(0);
	uint tp=p_pos[id];
	uint x=tp&0x0000ffff;
	uint y=tp>>16;
	p_vram[(WINY-1-y)*WINX+x]=255;
}






//パーティクル描画
//HSPのvram画面はb,g,rの順で左下から右に向かっていくので
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

