//eventのタイムスタンプを表示するモジュール
//他のコードから参照される
#ifndef HCLinit

#include "HSPCL64.as"
	HCLinit
	
	source={"
__kernel void vecAdd(__global int* a,__global int* b,__global int* c)
{
    uint gid = get_global_id(0);
    c[gid] = a[gid] + b[gid];
}
	"}
	prg=HCLCreateProgramWithSource(source)//OpenCLのコードが書かれたstrを直接入れることもできる
	krn=HCLCreateKernel(prg,"vecAdd")
	
	n=65536
	
	dim host_A,n
	dim host_B,n
	dim host_C,n
		repeat n
		host_A.cnt=cnt
		host_B.cnt=cnt
		loop

	clmem_A=HCLCreateBufferFrom(host_A)
	clmem_B=HCLCreateBufferFrom(host_B)
	clmem_C=HCLCreateBuffer(n*4)
	
	HCLSetKrns krn,clmem_A,clmem_B,clmem_C
	
	HCLDoKrn1 krn,n,64,0//event_id 0
	
	HCLFinish
	HCLReadBuffer clmem_C,host_C,n*4,,,,1//event_id 1
	
	//eventから時間情報を取得。返り値は64bit int
	screen 0,640,480,0
	ViewEvents1 2
	screen 1,640,480,0
	ViewEvents2 2
	screen 2,640,480,0
	ViewEvents3 2
	stop

#endif






#module ViewTimeStamp

#deffunc ViewEvents1 int event_num
	if event_num<=0:return
	//まずはすべての計算時間を取得
	dim_i64 kinfo,event_num
	sdim kinfos,128,event_num
	dim_i64 start_time,event_num
	dim_i64 end_time,event_num
		repeat event_num
		start_time.cnt=HCLGetEventLogs(cnt,6)//6はCL_PROFILING_COMMAND_STARTのtime
		end_time.cnt=HCLGetEventLogs(cnt,7)//7はCL_PROFILING_COMMAND_ENDのtime
		
		kinfo.cnt=HCLGetEventLogs(cnt,0)//0はeventがなんのコマンドだったか取得
		if kinfo.cnt==CL_COMMAND_WRITE_BUFFER  :kinfos.cnt="WRITE_BUFFER"
		if kinfo.cnt==CL_COMMAND_READ_BUFFER   :kinfos.cnt="READ_BUFFER"
		if kinfo.cnt==CL_COMMAND_NDRANGE_KERNEL:kinfos.cnt="KERNEL"
		loop
		
	offset=start_time.0
	
		repeat event_num
		start_time.cnt-=offset
		end_time.cnt-=offset
		loop

	scalex=end_time.(event_num-1)

	//計算時間をグラフで表示
	//軸
	line 30,30,30,450
	pos 3,240

	line 30,450,620,450
	line 620,450,615,447
	line 620,450,615,453
	pos 270,460
	font msgothic,12
	mes "時間(μs)"
		repeat 9
		line 30+cnt*580/8,450,30+cnt*580/8,445
		pos 30+cnt*580/8,450
		mes scalex*cnt/8000
		loop

	//実行単位で表示していく
		repeat event_num
			hsvcolor rnd(192),200,200
			lx=start_time.cnt*580/scalex+30
			rx=end_time.cnt*580/scalex+30
			boxf int(lx),200,int(rx),240
			pos int(lx),190
			color 0,0,0
			mes kinfos.cnt
		loop
	return







#deffunc ViewEvents2 int event_num
	if event_num<=0:return
	//まずはすべての計算時間を取得
	dim_i64 kinfo,event_num
	sdim kinfos,128,event_num
	dim_i64 qued_time,event_num
	dim_i64 subd_time,event_num
	dim_i64 start_time,event_num
	dim_i64 end_time,event_num
		repeat event_num
		qued_time.cnt=HCLGetEventLogs(cnt,4)//4はCL_PROFILING_COMMAND_QUEUEDのtime
		subd_time.cnt=HCLGetEventLogs(cnt,5)//5はCL_PROFILING_COMMAND_SUBMITのtime
		start_time.cnt=HCLGetEventLogs(cnt,6)//6はCL_PROFILING_COMMAND_STARTのtime
		end_time.cnt=HCLGetEventLogs(cnt,7)//7はCL_PROFILING_COMMAND_ENDのtime
		
		kinfo.cnt=HCLGetEventLogs(cnt,0)//はeventがなんのコマンドだったか取得
		if kinfo.cnt==CL_COMMAND_WRITE_BUFFER  :kinfos.cnt="WRITE_BUFFER"
		if kinfo.cnt==CL_COMMAND_READ_BUFFER   :kinfos.cnt="READ_BUFFER"
		if kinfo.cnt==CL_COMMAND_NDRANGE_KERNEL:kinfos.cnt="KERNEL"
		loop
		
	offset=qued_time.0
	
		repeat event_num
		start_time.cnt-=offset
		end_time.cnt-=offset
		qued_time.cnt-=offset
		subd_time.cnt-=offset
		loop

	scalex=end_time.(event_num-1)
	
	//計算時間をグラフで表示
	//軸
	line 30,30,30,450
	pos 3,240

	line 30,450,620,450
	line 620,450,615,447
	line 620,450,615,453
	pos 270,460
	font msgothic,12
	mes "時間(μs)"
		repeat 9
		line 30+cnt*580/8,450,30+cnt*580/8,445
		pos 30+cnt*580/8,450
		mes scalex*cnt/8000
		loop
		

	//実行単位で表示していく
		repeat event_num
			hsvcolor rnd(192),200,200
			//まず実行時間を表示
			lx=start_time.cnt*580/scalex+30
			rx=end_time.cnt*580/scalex+30
			boxf int(lx),100+cnt*50,int(rx),130+cnt*50
			
			//文字表示
			color 0,0,0
			pos int(lx),90+cnt*50
			mes kinfos.cnt
			
			//キューに入れられた時間やsubmitされた時間表示
			color 100,200,0
			lx=qued_time.cnt*580/scalex+30
			line int(lx),100+cnt*50,int(lx),130+cnt*50
			color 100,100,0
			lx=subd_time.cnt*580/scalex+30
			line int(lx),100+cnt*50,int(lx),130+cnt*50
		loop
	return





#deffunc ViewEvents3 int event_num
	if event_num<=0:return
	//まずはすべての計算時間を取得
	dim_i64 kinfo,event_num
	sdim kinfos,128,event_num
	dim_i64 start_time,event_num
	dim_i64 end_time,event_num
	dim cmdq_no,event_num
	offset=int64("9223372036854775807")
		repeat event_num
		start_time.cnt=HCLGetEventLogs(cnt,6)//6はCL_PROFILING_COMMAND_STARTのtime
		end_time.cnt=HCLGetEventLogs(cnt,7)//7はCL_PROFILING_COMMAND_ENDのtime
		cmdq_no.cnt=HCLGetEventLogs(cnt,3)//3は何番のcommand queで実行されたか取得
		kinfo.cnt=HCLGetEventLogs(cnt,0)//0はeventがなんのコマンドだったか取得
		if kinfo.cnt==CL_COMMAND_WRITE_BUFFER  :kinfos.cnt="WRITE_BUFFER"
		if kinfo.cnt==CL_COMMAND_READ_BUFFER   :kinfos.cnt="READ_BUFFER"
		if kinfo.cnt==CL_COMMAND_NDRANGE_KERNEL:kinfos.cnt="KERNEL"
		offset=MIN64(offset,start_time.cnt)
		loop

	scalex=int64("-9223372036854775808")
		repeat event_num
		start_time.cnt-=offset
		end_time.cnt-=offset
		scalex=MAX64(scalex,end_time.cnt)
		loop

	//計算時間をグラフで表示
	//軸
	line 30,30,30,450
	line 30,30,27,35
	line 30,30,33,35
	pos 0,240
	font msgothic,12
	mes "Queue\n番号"

	line 30,450,620,450
	line 620,450,615,447
	line 620,450,615,453
	pos 270,460
	mes "時間(μs)"
		repeat 9
		line 30+cnt*580/8,450,30+cnt*580/8,445
		pos 30+cnt*580/8,450
		mes scalex*cnt/8000
		loop

	//実行単位で表示していく
		repeat event_num
			hsvcolor rnd(192),200,200
			//まず実行時間を表示
			lx=start_time.cnt*580/scalex+30
			rx=end_time.cnt*580/scalex+30
			yy=270-int(cmdq_no.cnt)*50
			boxf int(lx),yy,int(rx),yy+30
			
			//文字表示
			color 0,0,0
			pos int(lx),yy-10
			mes kinfos.cnt
		loop
	return








#global