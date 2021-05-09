typedef struct{
	float x;
	float y;
	float z;
} Vec3;


__kernel void kona(__global Vec3 *mema,__global Vec3 *memb, __global float *vram2 , float mousex,float mousey,float mousez,int ipn,float keyct) {
	int ic = get_global_id(0);
	Vec3 zahyo=mema[ic];
	Vec3 sokudo=memb[ic];
	Vec3 p;
	p.x=zahyo.x-mousex;
	p.y=zahyo.y-mousey;
	p.z=zahyo.z-mousez;
	float ll=min(keyct/sqrt(p.x*p.x+p.y*p.y+p.z*p.z),65536.0f);
	sokudo.x-=0.25*p.x*ll;
	sokudo.y-=0.25*p.y*ll;
	sokudo.z-=0.25*p.z*ll;
	sokudo.x*=0.998;
	sokudo.y*=0.998;
	sokudo.z*=0.998;
	zahyo.x+=sokudo.x;
	zahyo.y+=sokudo.y;
	zahyo.z+=sokudo.z;
	if (fabs(zahyo.x)>290.0f){sokudo.x=-sokudo.x*0.9;zahyo.x+=sokudo.x*1.12;}
	if (fabs(zahyo.y)>230.0f){sokudo.y=-sokudo.y*0.9;zahyo.y+=sokudo.y*1.12;}
	if (fabs(zahyo.z-125.0f)>40.0f){sokudo.z=-sokudo.z;zahyo.z+=sokudo.z;}
	memb[ic]=sokudo;
	mema[ic]=zahyo;
	float okuyuki=125.0f/zahyo.z;
	int xx=zahyo.x*okuyuki*ipn;
	if (abs(xx)<320*ipn){
		int yy=zahyo.y*okuyuki*ipn;
		if (abs(yy)<240*ipn){
			vram2[xx+320*ipn+(yy+240*ipn)*640*ipn]+=okuyuki*20.0;
		}
	}
}


__kernel void konacl(__global float *vram2, __global char *vram,int ipn) {//charŒ^‚Í0`255‚Ì1byte®”
	int ic = get_global_id(0);
	int yy=ic/640;
	int ipp=ipn*640;
	yy=(ic%640+yy*ipp)*ipn;
	int gf=0;
	int hhj=0;
	for( int x=0; x <ipp*ipn; x+=ipp) {
	for( int y=0; y < ipn; y++) {
	hhj=yy+y+x;
	gf+=vram2[hhj];
	vram2[hhj]=0.0f;
	}
	}
	ic*=3;
	if (gf>255){gf=255;}
	vram[ic]=gf;//b—v‘f
	vram[ic+1]=gf;//g—v‘f
	vram[ic+2]=gf;//r—v‘f
}