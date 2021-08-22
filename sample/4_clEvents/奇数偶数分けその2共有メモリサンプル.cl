__kernel void wake(__global int *mema,__local int kisublock[],__local int gusublock[],__global int *memb,__global int *memc) {
	int ic = get_global_id(0)*64;
	int lid= get_local_id(0);//ローカルid取得=0～255のどれか
	int gid= get_group_id(0);//グループid取得=0～255のどれか
	int reg=0;
	int kisu=0;//0～255の整数変数
	int gusu=0;

	for(int i=0;i<64;i++){
	reg=mema[ic+i];
		if (reg%2==0){//ifの後はカッコで括る、「=」ではなく「==」にしないとエラー
			gusu++;
		}else{
			kisu++;
		}
	}


	kisublock[lid]=kisu;
	gusublock[lid]=gusu;
	barrier(CLK_LOCAL_MEM_FENCE);//256個のスレッド同期、全てのスレッドがこの命令を読むまでこの行で待つ


	//256個の数を合計して1つにまとめたい。
	//256個→128個→64個・・・となるように足し合わせ
	for(int i=128;i>0;i/=2){
		if (i>lid){//ローカルアイテムidが128より低いスレッドだけ計算、次のループでは64より低いスレッドだけ計算・・・・
			kisublock[lid]+=kisublock[lid+i];
			gusublock[lid]+=gusublock[lid+i];
		}
	barrier(CLK_LOCAL_MEM_FENCE);//256個のスレッド同期、これは全てのスレッドで実行しなければいけない
	}


	if (lid==0){
		memb[gid]=kisublock[0];
		memc[gid]=gusublock[0];
	}
}