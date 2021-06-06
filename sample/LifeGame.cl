__kernel void GameMain(__global int* A,__global int* B)
{
	int gid = get_global_id(0);
	int x=gid%WX;
	int y=gid/WX;
	int idx=x+y*WX;

	int mycell=A[idx];
	
	int cell0=A[(x-1+WX)%WX+(y+WY-1)%WY*WX];
	int cell1=A[x          +(y+WY-1)%WY*WX];
	int cell2=A[(x+1)%WX   +(y+WY-1)%WY*WX];

	int cell3=A[(x-1+WX)%WX+y*WX];
	int cell4=A[(x+1)%WX   +y*WX];
	
	int cell5=A[(x-1+WX)%WX+(y+1)%WY*WX];
	int cell6=A[x          +(y+1)%WY*WX];
	int cell7=A[(x+1)%WX   +(y+1)%WY*WX];

	int sm=cell0+cell1+cell2+cell3+cell4+cell5+cell6+cell7;

	if (mycell==0)
	{
		if (sm==3) mycell=1;
	}
	else
	{
		if ((sm<=1)|(sm>=4)) mycell=0;
	}

	B[idx]=mycell;
}

__kernel void CellView(__global int* A,__global uchar* vrm)
{
	int gid = get_global_id(0);
	int x=gid%WX;
	int y=gid/WX;
	int idx=x+y*WX;

	int mycell=A[idx];

	idx=((WY-1-y)*WX+x)*3;
	vrm[idx+0]=0;//b
	vrm[idx+1]=(uchar)mycell*190;//g
	vrm[idx+2]=0;//r
}