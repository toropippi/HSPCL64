float forleng(float4 npos){
	float4 mnos=fmod(npos,(float4)(20.0f,20.0f,30.0f,30.0f));
	if (mnos.x<0.0f)mnos.x+=20.0f;
	if (mnos.y<0.0f)mnos.y+=20.0f;
	if (mnos.z<0.0f)mnos.z+=30.0f;
	
	float x=max(fabs(mnos.x-10.0f)-1.5f,0.0f);
	float y=max(fabs(mnos.y-10.0f)-1.5f,0.0f);
	float z=max(fabs(mnos.z-15.0f)-12.0f,0.0f);
	
	float flen=sqrt(x*x+y*y+z*z)-2.5f;
	//mnos-=(float4)(15.0f,15.0f,15.0f,0.0f);
	//float flen=length(mnos)-1.6f;
	
	
	
	return flen;
}


float4 thenormal(float4 raypos){
	return normalize((float4)(
forleng(raypos+(float4)(0.001f,0.0,0.0,0.0))-forleng(raypos-(float4)(0.001f,0.0,0.0,0.0)),
forleng(raypos+(float4)(0.0,0.001f,0.0,0.0))-forleng(raypos-(float4)(0.0,0.001f,0.0,0.0)),
forleng(raypos+(float4)(0.0,0.0,0.001f,0.0))-forleng(raypos-(float4)(0.0,0.0,0.001f,0.0)),
0.0));
}


/////////////////////////////////////////////////////////////////
///ray進行方向初期化
__kernel void firststep(__global float4 *ray,
float m11,float m12,float m13,float m14,
float m21,float m22,float m23,float m24,
float m31,float m32,float m33,float m34,
float m41,float m42,float m43,float m44) 
{
	uint gid=get_global_id(0);
	int u=gid%WX;
	int v=gid/WX;
	float4 tray=0;
	tray.x=0.01f*(float)(u-WX/2);
	tray.y=0.01f*(float)(v-WY/2);
	tray.z=0.0035f*(float)(WX+WY);
	tray.w=0;
	tray=normalize(tray);
	float4 ry;
	
	ry.x=m11*tray.x+m12*tray.y+m13*tray.z+m14;
	ry.y=m21*tray.x+m22*tray.y+m23*tray.z+m24;
	ry.z=m31*tray.x+m32*tray.y+m33*tray.z+m34;
	ry.w=0.0f;
	
	ray[gid]=normalize(ry);
}




//////////////////////////////////////////////////////////////メイン
//////////////////////////////////////////////////////////////メイン
__kernel void mainloop(__global float4 *rpos,__global float4 *ray,__global float *tlen,
float movex,float movey,float movez)
{
	uint gid=get_global_id(0);
	float4 rp=0;
	rp.x+=movex;
	rp.y+=movey;
	rp.z+=movez;
	float4 ry=ray[gid];
	float len=0.0f;
	float llen=0.0f;
	for(int ii=0;ii<256;ii++){
		llen=forleng(rp);
		rp.s0+=llen*ry.x;
		rp.s1+=llen*ry.y;
		rp.s2+=llen*ry.z;
		len+=llen;
	}
	tlen[gid]+=len;
	rpos[gid]=rp;
}

//////////////////////////////////////////////////////////////メイン
//////////////////////////////////////////////////////////////メイン

__kernel void renderling(__global uchar *buf,__global float4 *rpos,__global float4 *ray,__global float *tlen) {
	uchar color_r=0;
	uchar color_g=0;
	uchar color_b=0;
	uint gid=get_global_id(0);
	float4 rp=rpos[gid];
	float4 ry=ray[gid];
	float4 color4;
	float len=forleng(rp);
	float ttlen=fabs(tlen[gid]);
	ttlen-=20.0f;
	if (ttlen<0.0f)ttlen=0.0f;
	float fog=pow(0.5f,0.01625f*ttlen);
	
	if (len<0.05f){
		float4 n=thenormal(rp);
		float dotn=n.x*ry.x+n.y*ry.y+n.z*ry.z;
		ry=ry-n*dotn*2.0f;
		ry=normalize(ry);
		
		float4 lvec=(float4)(0.6,0.5,-0.2,0);
		lvec=normalize(lvec);
		float df=n.x*lvec.x+n.y*lvec.y+n.z*lvec.z;
		if (df<0.0f)df*=0.35f;
		df+=0.35;
		float sp=ry.x*lvec.x+ry.y*lvec.y-ry.z*lvec.z;
		sp=pow(sp,29.0f);
		if (sp<0.0f)sp=0.0f;
		
		float rcol=(90.0f+139.0f*df+390.0f*sp);
		float gcol=(18.0f+42.0f*df+320.0f*sp);
		float bcol=(104.0f+122.0f*df+290.0f*sp);
		
		rcol=fog*rcol+(1.0f-fog)*220.0f;
		gcol=fog*gcol+(1.0f-fog)*220.0f;
		bcol=fog*bcol+(1.0f-fog)*255.0f;
		
		if (rcol>255.0f)rcol=255;
		if (rcol<0.0f)rcol=0;
		
		if (gcol>255.0f)gcol=255;
		if (gcol<0.0f)gcol=0;
		
		if (bcol>255.0f)bcol=255;
		if (bcol<0.0f)bcol=0;
		
		color_r=(uchar)rcol;
		color_g=(uchar)gcol;
		color_b=(uchar)bcol;
	}else{
		color_r=(uchar)(220.0f);
		color_g=(uchar)(220.0f);
		color_b=(uchar)(255.0f);
	}
	
	buf[gid*3  ]=color_b;
	buf[gid*3+1]=color_g;
	buf[gid*3+2]=color_r;
}
