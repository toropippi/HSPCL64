#define alpha (float)1.7
#define WX (uint)128
#define WY (uint)128
#define ipn (uint)4



__kernel void newgrad(__global float *yn, __global float *y, __global float *GX, __global float *GY, __global uchar *kabe) {
int i = get_global_id(0);
int j = get_global_id(1);
int i0=(i-1+WX)%WX;
int i1=(i+1) % WX;
int j0=(j-1+WY) % WY;
int j1=(j+1) % WY;
j*=WX;
j0*=WX;
j1*=WX;
int ij=i+j; 
GX [ij] +=(yn[i1+j]-yn[i0+j]-y[i1 +j]+y[i0 + j])*0.5f*(kabe[ij]>128);
GY [ij] +=(yn[i + j1]-yn[i + j0]-y[i +j1]+y[i + j0])*0.5f*(kabe[ij]>128);
}


__kernel void dcip0(__global float *fn,__global float *gxn,__global float *gyn,__global float *u,__global float *v,__global float *GXd,__global float *GYd,__global float *Yd,float DT,__global uchar *kabe) {
int i = get_global_id(0);
int j = get_global_id(1);
int jwx=j*WX;
float a1;
float b1;
float c1;
float d1;
float f1;
float e1;
float g1;
float tmp0;

float xx=-u[i+jwx]*DT;
float yy=-v[i+jwx]*DT;

char isn;
char jsn;

if (xx==0.0f){isn=0;}else{
if (xx>0.0f){isn=-1;}else{isn=1;}}
if (yy==0.0f){jsn=0;}else{
if (yy>0.0f){jsn=-1;}else{jsn=1;}}

int im1=(i-isn+WX)%WX;
int jm1=((j-jsn+WY)%WY)*WX;
j=i+jm1;
jm1+=im1;
im1+=jwx;
jwx+=i;

	a1=Yd[jwx]-Yd[j]-Yd[im1]+Yd[jm1];
	b1=GYd[im1]-GYd[jwx];
	d1=(-a1-b1*jsn)*isn;
	c1=(-a1-(GXd[j]-GXd[jwx])*isn)*jsn;
	g1=(c1-b1)*isn;
	a1=GXd[im1]+GXd[jwx]-2.0f*isn*(Yd[jwx]-Yd[im1]);
	b1=GYd[j  ]+GYd[jwx]-2.0f*jsn*(Yd[jwx]-Yd[j  ]);
	e1=3.0f*(Yd[im1]-Yd[jwx])+(GXd[im1]+2.0f*GXd[jwx])*isn;
	f1=3.0f*(Yd[j  ]-Yd[jwx])+(GYd[j  ]+2.0f*GYd[jwx])*jsn;
	a1*=xx;
	b1*=yy;

if (kabe[jwx]){
	tmp0=((a1+c1*yy+e1)*xx+g1*yy+GXd[jwx])*xx+((b1+d1*xx+f1)*yy+GYd[jwx])*yy+Yd[jwx];
	if (tmp0<-2.5f){tmp0=-2.5f;}
	if (tmp0> 2.5f){tmp0= 2.5f;}
	fn[jwx]=tmp0;
}
a1=(3.0f*a1+2.0f*(c1*yy+e1))*xx+(d1*yy+g1)*yy+GXd[jwx];
b1=(3.0f*b1+2.0f*(d1*xx+f1))*yy+(c1*xx+g1)*xx+GYd[jwx];

j = get_global_id(1);
i = get_global_id(0);
im1=(i+WX-1)%WX+j*WX;
jm1=(i+1)%WX+j*WX;
if (kabe[jwx]){gxn[jwx]=(a1-0.5f*DT*(a1*(u[jm1]-u[im1])+b1*(v[jm1]-v[im1])));}

im1=((j+WY-1)%WY)*WX+i;
jm1=((j+1)%WY)*WX+i;
if (kabe[jwx]){gyn[jwx]=(b1-0.5f*DT*(a1*(u[jm1]-u[im1])+b1*(v[jm1]-v[im1])));}
}






__kernel void pressure0(__global float *DIV,__global float *YPN,__global uchar *kabeP) {
uint i = mad24(get_global_id(0),(uint)2,(uint)1);
uint j = i>>7;
uint i0=((j%2)==1);
i-=mad24(j,(uint)128,i0);

i0=i+WX-1;
uint i1=i0>>7;
i0-=mul24(i1,(uint)128);

i1=i+1;
uint j0=i1>>7;
i1-=mul24(j0,(uint)128);

j0=j+WY-1;
uint j1=j0>>7;
j0-=mul24(j1,(uint)128);

j1=j+1;
uint ij=j1>>7;
j1-=mul24(ij,(uint)128);

ij=mad24(j,(uint)128,i);
float ff=DIV[ij];
float p=YPN[ij];


j0=mad24(j0,(uint)128,i);
j1=mad24(j1,(uint)128,i);
i0=mad24(j,(uint)128,i0);
i1=mad24(j,(uint)128,i1);

float f1=YPN[i0];
float f2=YPN[i1];
float f3=YPN[j0];
float f4=YPN[j1];



if (kabeP[i0]!=0){ff-=f1;}else{ff-=p;}
if (kabeP[i1]!=0){ff-=f2;}else{ff-=p;}
if (kabeP[j0]!=0){ff-=f3;}else{ff-=p;}
if (kabeP[j1]!=0){ff-=f4;}else{ff-=p;}

YPN[ij]-=mad(0.25f,ff,p)*alpha*(kabeP[ij]>128);




																		/*
																		int i = get_global_id(0)*2;
																		int j = i/WX;
																		i=i%WX+(j%2);
																		int i0=(i+WX-1)%WX;
																		int i1=(i+1)%WX;
																		int j0=(j+WY-1)%WY;
																		int j1=(j+1)%WY;
																		int ij=i+j*WX;
																		float ff=DIV[ij];


																		j*=WX;
																		float p=YPN[ij];
																		if (kabeP[i0+j]!=0){ff-=YPN[i0+j];}else{ff-=p;}
																		if (kabeP[i1+j]!=0){ff-=YPN[i1+j];}else{ff-=p;}
																		if (kabeP[i+j0*WX]!=0){ff-=YPN[i+j0*WX];}else{ff-=p;}
																		if (kabeP[i+j1*WX]!=0){ff-=YPN[i+j1*WX];}else{ff-=p;}

																		YPN[ij]+=(-0.25*ff-p)*alpha*(kabeP[ij]>128);
																		*/
}




__kernel void pressure1(__global float *DIV,__global float *YPN,__global uchar *kabeP) {
uint i = mad24(get_global_id(0),(uint)2,(uint)1);
uint j = i>>7;
uint i0=((j%2)==0);
i-=mad24(j,(uint)128,i0);

i0=i+WX-1;
uint i1=i0>>7;
i0-=mul24(i1,(uint)128);

i1=i+1;
uint j0=i1>>7;
i1-=mul24(j0,(uint)128);

j0=j+WY-1;
uint j1=j0>>7;
j0-=mul24(j1,(uint)128);

j1=j+1;
uint ij=j1>>7;
j1-=mul24(ij,(uint)128);

ij=mad24(j,(uint)128,i);
float ff=DIV[ij];
float p=YPN[ij];


j0=mad24(j0,(uint)128,i);
j1=mad24(j1,(uint)128,i);
i0=mad24(j,(uint)128,i0);
i1=mad24(j,(uint)128,i1);


float f1=YPN[i0];
float f2=YPN[i1];
float f3=YPN[j0];
float f4=YPN[j1];



if (kabeP[i0]!=0){ff-=f1;}else{ff-=p;}
if (kabeP[i1]!=0){ff-=f2;}else{ff-=p;}
if (kabeP[j0]!=0){ff-=f3;}else{ff-=p;}
if (kabeP[j1]!=0){ff-=f4;}else{ff-=p;}

YPN[ij]-=mad(0.25f,ff,p)*alpha*(kabeP[ij]>128);
}



//,__local float PL[]
//barrier(CLK_GLOBAL_MEM_FENCE);
//barrier(CLK_LOCAL_MEM_FENCE);






__kernel void div(__global float *DIV, __global float *YU, __global float *YV) {
int i = get_global_id(0);
int j = get_global_id(1);
int i1=(i+1)%WX;
int j1=(j+1)%WY;
j*=WX;
j1*=WX;
int ij=i+j;
DIV[ij]=(YU[i1+j]-YU[ij]+YV[i+j1]-YV[ij]);
}

/*
__kernel void narasi(__global float *YP, float yp00) {
int i = get_global_id(0)+get_global_id(1)*WX;
YP[i]-=yp00;
}
*/


__kernel void rhs(__global float *YUN,__global float *YVN,__global float *YPN,__global uchar *kabeX,__global uchar *kabeY) {
int i = get_global_id(0);
int j = get_global_id(1);
int i0=(i-1+WX)%WX;
int j0=(j-1+WY)%WY;
j*=WX;
j0*=WX;
int ij=i+j;
YUN[ij]-=(YPN[ij]-YPN[i0+j])*(kabeX[ij]>128);
YVN[ij]-=(YPN[ij]-YPN[i+j0])*(kabeY[ij]>128);
}


__kernel void veloc(__global float *YU,__global float *YV,__global float *YVU, __global float *YUV ,__global float *YVT, __global float *YUT ) {
int i = get_global_id(0);
int j = get_global_id(1);
int i0=(i-1+WX) % WX;
int i1=(i+1) % WX;
int j0=(j-1+WY) % WY;
int j1=(j+1) % WY;
j*=WX;
j0*=WX;
j1*=WX;
int ij=i+j;
YVU [ij] =0.25f*(YV[ij]+YV[i+j1]+YV[i0+j]+YV[i0+j1]);
YUV [ij] =0.25f*(YU[ij]+YU[i1+j]+YU[i+j0]+YU[i1+j0]);
YVT [ij] =0.5f*(YV[ij]+YV[i+j1]);
YUT [ij] =0.5f*(YU[ij]+YU[i1+j]);
}


__kernel void copyy(__global float *AAA,__global float *BBB) {
int i = get_global_id(0)+get_global_id(1)*WX;
AAA[i]=BBB[i];
}



__kernel void out(__global uchar *outt,__global float *RYU,__global float *YU,__global float *YV) {
																										/*
																										int i = get_global_id(0);
																										int j = i/(WX*ipn);
																										i=i%(WX*ipn);
																										int cc= ((WY*ipn-j-1)*WX*ipn+i)*3;
																										i/=ipn;
																										j/=ipn;
																										int i0=(i-1+WX) % WX;
																										int j0=(j-1+WY) % WY;
																										j*=WX;
																										j0*=WX;
																										float uzudo=8412.3f*(YV[i+j]-YU[i+j]-YV[i0+j]+YU[i+j0]);
																										(int)uzudo;
																										outt[cc  ]=uzudo;
																										outt[cc+1]=-uzudo;
																										if (uzudo<0){uzudo=-uzudo;}
																										uzudo/=14;
																										outt[cc+2]=uzudo;
																										*/

int i = get_global_id(0)*2;
int xx=(RYU[i]);
int yy=(RYU[i+1]);
int j=(xx+(WY*ipn-yy-1)*WX*ipn)*3;
i*=16;
outt[j+0]+=i%256;
i/=256;
outt[j+1]+=i%128+128;
i/=128;
outt[j+2]+=i%32+128+64+32;

}




__kernel void out0(__global uint *outt) {
outt[get_global_id(0)]=0;
}




__kernel void nensei0(__global float *YU,__global float *YUN,__global float *YV,__global float *YVN,__global float *GXd,__global float *GYd,float arufa,float ar1fa,__global uchar *kabeX,__global uchar *kabeY) {
int i = get_global_id(0);
int j = get_global_id(1);
int i0=(i-1+WX) % WX;
int i1=(i+1) % WX;
int j0=(j-1+WY) % WY;
int j1=(j+1) % WY;
j*=WX;
j0*=WX;
j1*=WX;

if (kabeX[i+j]){GXd[i+j]=(YU[i+j]+arufa*(YUN[i0+j]+YUN[i1+j]+YUN[i+j0]+YUN[i+j1]))*ar1fa;}
if (kabeY[i+j]){GYd[i+j]=(YV[i+j]+arufa*(YVN[i0+j]+YVN[i1+j]+YVN[i+j0]+YVN[i+j1]))*ar1fa;}
}


__kernel void nensei1(__global float *YU,__global float *YUN,__global float *YV,__global float *YVN,__global float *GXd,__global float *GYd,float arufa,float ar1fa,__global uchar *kabeX,__global uchar *kabeY) {
int i = get_global_id(0);
int j = get_global_id(1);
int i0=(i-1+WX) % WX;
int i1=(i+1) % WX;
int j0=(j-1+WY) % WY;
int j1=(j+1) % WY;
j*=WX;
j0*=WX;
j1*=WX;
if (kabeX[i+j]){YUN[i+j]=(YU[i+j]+arufa*(GXd[i0+j]+GXd[i1+j]+GXd[i+j0]+GXd[i+j1]))*ar1fa;}
if (kabeY[i+j]){YVN[i+j]=(YV[i+j]+arufa*(GYd[i0+j]+GYd[i1+j]+GYd[i+j0]+GYd[i+j1]))*ar1fa;}
}



__kernel void syokise(__global float *AA){
uint i = get_global_id(0)%(WX*ipn);
uint j = get_global_id(0)/(WX*ipn);
uint ij=(i+j*WX*ipn)*2;
AA[ij]=WX*ipn-1.0f*j-1.0f;
AA[ij+1]=1.0f*i;
}





__kernel void ryuusi(__global float *RYS,__global float *YUN,__global float *YVN,float DT,__global float *GXU,__global float *GYU,__global float *GXV,__global float *GYV){
uint di = get_global_id(0)*2;
float xx=RYS[di];
float yy=RYS[di+1];
int ixx=xx/ipn;
int iyy=yy/ipn;
float sxx=xx/ipn-ixx;
float syy=yy/ipn-iyy;

int im1=(ixx+1)%WX;
int jm1=((iyy+1)%WY)*WX;
iyy*=WX;

xx+=(( (1.0f-sxx)*YUN[ixx+iyy]+sxx*YUN[im1+iyy] )*(1.0f-syy) + ( (1.0f-sxx)*YUN[ixx+jm1]+sxx*YUN[im1+jm1] )*syy)*DT*ipn;
yy+=(( (1.0f-sxx)*YVN[ixx+iyy]+sxx*YVN[im1+iyy] )*(1.0f-syy) + ( (1.0f-sxx)*YVN[ixx+jm1]+sxx*YVN[im1+jm1] )*syy)*DT*ipn;

																										/*
																										float a1;
																										float b1;
																										float c1;
																										float d1;
																										float f1;
																										float e1;
																										float g1;
																										float tmp;
																										float tmq;

																										int jwx=iyy*WX;

																										iyy=ixx+jm1;
																										jm1+=im1;
																										im1+=jwx;
																										jwx+=ixx;

																											a1=GXU[im1]+GXU[jwx]-2.0f*(YUN[jwx]-YUN[im1]);
																											b1=GYU[iyy]+GYU[jwx]-2.0f*(YUN[jwx]-YUN[iyy]);
																											e1=3.0*(YUN[im1]-YUN[jwx])+(GXU[im1]+2.0*GXU[jwx]);
																											f1=3.0*(YUN[iyy]-YUN[jwx])+(GYU[iyy]+2.0*GYU[jwx]);
																											tmp=YUN[jwx]-YUN[iyy]-YUN[im1]+YUN[jm1];
																											tmq=GYU[im1]-GYU[jwx];
																											d1=(-tmp-tmq);
																											c1=(-tmp-(GXU[iyy]-GXU[jwx]));
																											g1=(c1-tmq);
																										xx+=(((a1*sxx+c1*syy+e1)*sxx+g1*syy+GXU[jwx])*sxx+((b1*syy+d1*sxx+f1)*syy+GYU[jwx])*syy+YUN[jwx])*DT*ipn;


																											a1=GXV[im1]+GXV[jwx]-2.0*(YVN[jwx]-YVN[im1]);
																											b1=GYV[iyy]+GYV[jwx]-2.0*(YVN[jwx]-YVN[iyy]);
																											e1=3.0*(YVN[im1]-YVN[jwx])+(GXV[im1]+2.0*GXV[jwx]);
																											f1=3.0*(YVN[iyy]-YVN[jwx])+(GYV[iyy]+2.0*GYV[jwx]);
																											tmp=YVN[jwx]-YVN[iyy]-YVN[im1]+YVN[jm1];
																											tmq=GYV[im1]-GYV[jwx];
																											d1=(-tmp-tmq);
																											c1=(-tmp-(GXV[iyy]-GXV[jwx]));
																											g1=(c1-tmq);
																										yy+=(((a1*sxx+c1*syy+e1)*sxx+g1*syy+GXV[jwx])*sxx+((b1*syy+d1*sxx+f1)*syy+GYV[jwx])*syy+YVN[jwx])*DT*ipn;

																										*/

if (xx>=(1.0*ipn*WX)){xx=0.0;yy=(1.0*ipn*WY-0.1);}
if (yy>=(1.0*ipn*WY)){yy-=(1.0*ipn*WY);}
if (xx<0.0){xx+=(1.0*ipn*WX);}
if (yy<0.0){yy+=(1.0*ipn*WY);}
RYS[di]=xx;
RYS[di+1]=yy;
}