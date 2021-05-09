__kernel void calc(__global float *mem,float cnt) {
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
	mem[icx  ]=xx;
	mem[icx+1]=yy;
	mem[icx+2]=zz;
	mem[icx+3]=xx+10.1f;
	mem[icx+4]=yy;
	mem[icx+5]=zz+3.1f;
	mem[icx+6]=xx+10.1f;
	mem[icx+7]=yy+10.1f;
	mem[icx+8]=zz+10.1f;
	mem[icx+9]=xx;
	mem[icx+10]=yy+10.1f;
	mem[icx+11]=zz+10.1f;
}