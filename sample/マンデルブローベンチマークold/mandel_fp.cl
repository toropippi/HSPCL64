__kernel void mand(__global uchar* OUT,double x,double y,int w,int h,double scalex,double scaley)
{
	uint gid = get_global_id(0);
	float zx=0.0f;//実数部
	float zy=0.0f;//虚数部
	float cx=(float)x+(float)((int)(gid%w))/(float)w*(float)scalex;
	float cy=(float)y+(float)((int)(gid/w))/(float)h*(float)scaley;
	float tmp=0.0f;
	for(int i=0;i<65536*2;i++){
		tmp=zx*zx-(zy*zy-cx);//2*FMA
		zy=2.0f*zx*zy+cy;//1*MUL+1*FMA
		
		zx=tmp*tmp-(zy*zy-cx);//2*FMA
		zy=2.0f*tmp*zy+cy;//1*MUL+1*FMA
	}
	if ((zy<6553600.0f)&(zy>-6553600.0f)){
		OUT[gid] = (uchar)1;
	}else{
		OUT[gid] = (uchar)0;
	}
}
