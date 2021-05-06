__kernel void mand(__global uchar* OUT,double x,double y,int w,int h,double scalex,double scaley)
{
	uint gid = get_global_id(0);
	double zx=0.0;//実数部
	double zy=0.0;//虚数部
	double cx=x+(double)((int)(gid%w))/(double)w*scalex;
	double cy=y+(double)((int)(gid/w))/(double)h*scaley;
	double tmp=0.0;
	for(int i=0;i<65536*2;i++){
		tmp=zx*zx-(zy*zy-cx);//2*FMA
		zy=2.0*zx*zy+cy;//1*FMA
		
		zx=tmp*tmp-(zy*zy-cx);//2*FMA
		zy=2.0*tmp*zy+cy;//1*FMA
	}
	if ((zy<6553600.0)&(zy>-6553600.0)){
		OUT[gid] = (uchar)1;
	}else{
		OUT[gid] = (uchar)0;
	}
}
