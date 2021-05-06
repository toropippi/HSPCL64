__kernel void calc(__global float *mem,float cnt,float b1,float b2,float b3,float c1,float c2,float c3) {
	int icx = get_global_id(0);
	int icy = icx+1;
	int icz = icy+1;
	float xx=0.6214554*(((icx%1001-500)*35438965239782347-4312452874234562561)%1335);
	xx=xx*sin(cnt*icx);
	float yy=0.6214554*(((icy%1001-500)*35438965239782347-4312452874234562561)%1335);
	yy=yy*cos(cnt*icy);
	float zz=0.6214554*(((icz%1001-500)*35438965239782347-4312452874234562561)%1335);
	zz=zz*sin(cnt*icz);
	icx*=12;
	mem[icx  ]=xx-b1;
	mem[icx+1]=yy-b2;
	mem[icx+2]=zz-b3;
	mem[icx+3]=xx-c1;
	mem[icx+4]=yy-c2;
	mem[icx+5]=zz-c3;
	mem[icx+6]=xx+b1;
	mem[icx+7]=yy+b2;
	mem[icx+8]=zz+b3;
	mem[icx+9]=xx+c1;
	mem[icx+10]=yy+c2;
	mem[icx+11]=zz+c3;
}