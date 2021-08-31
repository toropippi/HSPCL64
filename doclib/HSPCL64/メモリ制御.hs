;------------------------
;   メモリ関連
;------------------------

;-------- header --------
%dll
HSPCL64.dll

%ver
1.1

%date
2021/08/31

%author
toropippi

%note
hspcl64.as をインクルードしてください。

%type
64bitランタイムGPGPU用プラグイン

%group
OpenCLメモリ制御

%port
Win

;-------- ref --------

%index
HCLCreateBuffer
VRAM作成

%prm
(int64 p1)
int64 p1 : 確保するbyte数	[in]

%inst
HCLSetDeviceで指定されたグラフィックボードなどのデバイス上にメモリを確保します。
CL_mem_object idが返ります。
これは64bit int型です。
主にGDDR5,6などのメモリのあるグラボ上に、指定したサイズのメモリが確保されることになります。
HCLReleaseBufferで解放することができます。

このCL_mem_object idを解放前にロストすると、GPU側のメモリにアクセスできないことになり、メモリリークに近い状態になってしまいます。
CL_mem_object idを変数で保持している場合上書きにはご注意下さい。


%href
HCLSetDevice
HCLReleaseBuffer
;--------

%index
HCLReleaseBuffer
VRAM破棄

%prm
int64 p1
int64 p1 : CL_mem_object id			[in]
%inst
デバイス上のメモリを解放します。

%href
HCLCreateBuffer
;--------

%index
HCLWriteBuffer
HSP配列情報をVRAMに書込

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : コピー先CL_mem_object id		[in]
array p2:コピー元配列変数			[in]
int64 p3 : コピーサイズbyte,省略可		[in]
int64 p4 : コピー先のオフセット,省略可		[in]
int64 p5 : コピー元のオフセット,省略可		[in]
int p6 : ブロッキングモードoff,省略可		[in]
int p7 : event_id,省略可			[in]

%inst
ホスト(CPU)からHCLSetDeviceで指定したデバイス(GPU)側にデータを転送します。
p3は省略時、コピー先とコピー元の配列のうち小さい方が採用されます。
p4,p5は省略時0です。
p3,p4,p5の単位はbyteです。
p6のブロッキングモードは0を指定するとoffになり、転送が完了しないうちに次の命令に移ります。
p6は省略時デフォルトで1です。つまりブロッキングモードがonになっており、転送が終わるまでこの命令の実行が終わりません。


%href
HCLCreateBuffer
HCLReadBuffer
HCLFillBuffer
;--------

%index
HCLReadBuffer
VRAMからHSP配列情報に読込

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : コピー元CL_mem_object id		[in]
array p2:コピー先配列変数			[out]
int64 p3 : コピーサイズbyte,省略可		[in]
int64 p4 : コピー元のオフセット,省略可		[in]
int64 p5 : コピー先のオフセット,省略可		[in]
int p6 : ブロッキングモードoff,省略可		[in]
int p7 : event_id,省略可			[in]

%inst
HCLSetDeviceで指定したデバイス(GPU)からホスト(CPU)側にデータを転送します。
p3は省略時、コピー先とコピー元の配列のうち小さい方が採用されます。
p4,p5は省略時0です。
p3,p4,p5の単位はbyteです。
p6のブロッキングモードは0を指定するとoffになり、転送が完了しないうちに次の命令に移ります。
p6は省略時デフォルトで1です。つまりブロッキングモードがonになっており、転送が終わるまでこの命令の実行が終わりません。


%href
HCLCreateBuffer
HCLWriteBuffer
HCLFillBuffer
;--------

%index
HCLCopyBuffer
VRAM同士コピー

%prm
int64 p1,int64 p2,int64 p3,int64 p4,int64 p5,int p6
int64 p1 : コピー先CL_mem_object id		[in]
int64 p2 : コピー元CL_mem_object id		[in]
int64 p3 : コピーサイズbyte,省略可		[in]
int64 p4 : コピー先のオフセット,省略可		[in]
int64 p5 : コピー元のオフセット,省略可		[in]
int p6 : event_id,省略可			[in]

%inst
HCLSetDeviceで指定したデバイス上のメモリ間でコピーをします。
p3は省略時、コピー先とコピー元の配列のうち小さい方が採用されます。
p4,p5は省略時0です。
p3,p4,p5の単位はbyteです。


%href
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer

;--------
%index
HCLCreateBufferFrom
VRAM作成(HSP配列変数から)

%prm
(array p1)
array p1 : HSP側の配列変数		[in]

%inst
dim命令などで確保したHSPの配列変数を、そのままコピーしてVRAMの作成をします。
CL_mem_object idが返ります。
これは64bit int型です。

%href
HCLCreateBuffer
;--------

%index
HCLWriteBuffer_NonBlocking
HSP配列情報をVRAMに書込、強制ノンブロッキングモード

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : コピー先CL_mem_object id		[in]
array p2:コピー元配列変数			[in]
int64 p3 : コピーサイズbyte,省略可		[in]
int64 p4 : コピー先のオフセット,省略可		[in]
int64 p5 : コピー元のオフセット,省略可		[in]
int p6 : ブロッキングモードoff,省略可		[in]
int p7 : event_id,省略可			[in]

%inst

ホスト(CPU)からHCLSetDeviceで指定したデバイス(GPU)側にデータを転送します。

■HCLWriteBufferとの違い
HCLWriteBufferのノンブロッキングモード指定はNVIDIA GPUでは無効なようで、必ずブロッキングがonになってしまいます。
転送が終わるまで待たされるのがどうしても困る場合、このHCLWriteBuffer_NonBlocking命令を使用してください。
プラグイン内部では
std::thread
で別スレッドを立ち上げ、その中でclEnqueueWriteBufferを実行しています。
このとき、別スレッドがいつどのタイミングで実行されるかはわからないことに注意してください。

例えばHCLWriteBuffer_NonBlockingの転送が終わるまで待ちたい場合HCLFinishを実行しても、clEnqueueWriteBuffer自体の実行がまだの可能性もあります。
その場合転送が終わる前にHCLFinishの実行が完了してしまうということが起こります。

そのためにHCLGet_NonBlocking_Statusという命令があり、これが0になっていれば確実にHCLWriteBuffer_NonBlockingの処理が終わっていることが保証されます。


%href
HCLWriteBuffer
HCLReadBuffer_NonBlocking
HCLGet_NonBlocking_Status
;--------

%index
HCLReadBuffer_NonBlocking
VRAMからHSP配列情報に読込、強制ノンブロッキングモード

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : コピー元CL_mem_object id		[in]
array p2:コピー先配列変数			[out]
int64 p3 : コピーサイズbyte,省略可		[in]
int64 p4 : コピー元のオフセット,省略可		[in]
int64 p5 : コピー先のオフセット,省略可		[in]
int p6 : ブロッキングモードoff,省略可		[in]
int p7 : event_id,省略可			[in]

%inst

HCLSetDeviceで指定したデバイス(GPU)からホスト(CPU)側にデータを転送します。

■HCLReadBufferとの違い
HCLReadBufferのノンブロッキングモード指定はNVIDIA GPUでは無効なようで、必ずブロッキングがonになってしまいます。
転送が終わるまで待たされるのがどうしても困る場合、このHCLReadBuffer_NonBlocking命令を使用してください。
プラグイン内部では
std::thread
で別スレッドを立ち上げ、その中でclEnqueueReadBufferを実行しています。
このとき、別スレッドがいつどのタイミングで実行されるかはわからないことに注意してください。

例えばHCLReadBuffer_NonBlockingの転送が終わるまで待ちたい場合HCLFinishを実行しても、clEnqueueReadBuffer自体の実行がまだの可能性もあります。
その場合転送が終わる前にHCLFinishの実行が完了してしまうということが起こります。

そのためにHCLGet_NonBlocking_Statusという命令があり、これが0になっていれば確実にHCLReadBuffer_NonBlockingの処理が終わっていることが保証されます。

%href
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLGet_NonBlocking_Status
;--------


%index
HCLGet_NonBlocking_Status
NonBlocking実行状況取得

%prm
()

%inst

HCLReadBuffer_NonBlockingとHCLWriteBuffer_NonBlockingの実行状況がどうなっているかを取得します。
以降この2つをNonBlocking命令と言います。
まずNonBlocking命令を呼び出したあとはプラグイン内部のthread_start変数がインクリメントされます。
その後別スレッドが立ち上がり、NonBlocking命令内部でclEnqueueReadBuffer,clEnqueueWriteBufferが実行され、その命令を通り過ぎた後にthread_start変数がデクリメントされます。
ここでclEnqueueReadBuffer,clEnqueueWriteBuffer自体は転送をキューに入れるだけの命令であることに注意が必要で、(ブロッキングモードoff)かつ(NVIDIAのGPUでない)場合に転送が終わる前にthread_startがデクリメントされていることもあることを考慮してください。

このHCLGet_NonBlocking_Status命令はthread_startの数値を取得する命令です。

NVIDIA GPUの場合、NonBlocking命令によるデータ転送完了判定に使うことができます。
またNonBlocking命令でevent idを指定した場合、プラグイン内部のclEnqueueReadBuffer,clEnqueueWriteBufferの行を通りすぎないとevent自体取得できないため(エラーになる)、event取得可能判定にも使うことができます。

%href
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
;--------

%index
HCLReadIndex_i32
VRAMからint型を1要素読み込み

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]

%inst
GPUのVRAMから直接1つの値をとりだし返します。
p1はCL mem obj id
p2は読み出しインデックスを指定して下さい。
ブロッキングモードはオン(転送完了まで待つ)です。

VRAMの内容がint型4つの配列変数　(100,400,500,700)
だった場合
HCLReadIndex_i32(memid,3)　は　700
を返します。

%href
HCLReadIndex_dp
HCLReadIndex_fp
HCLReadIndex_i64
;--------

%index
HCLReadIndex_i64
VRAMから64bit int型を1要素読み込み

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]

%inst
GPUのVRAMから直接1つの値をとりだし返します。
p1はCL mem obj id
p2は読み出しインデックスを指定して下さい。
ブロッキングモードはオン(転送完了まで待つ)です。

VRAMの内容が64bit int型4つの配列変数　(10000000000,40000000000,50000000000,70000000000)
だった場合
HCLReadIndex_i64(memid,3)　は　70000000000
を返します。

%href
HCLReadIndex_i32
HCLReadIndex_dp
HCLReadIndex_fp
;--------

%index
HCLReadIndex_dp
VRAMからdouble型を1要素読み込み

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]

%inst
GPUのVRAMから直接1つの値をとりだし返します。
p1はCL mem obj id
p2は読み出しインデックスを指定して下さい。
ブロッキングモードはオン(転送完了まで待つ)です。

VRAMの内容がdouble型4つの配列変数　(100.0,400.0,500.0,700.0)
だった場合
HCLReadIndex_d(memid,3)　は　700.0
を返します。

%href
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_fp
;--------

%index
HCLReadIndex_fp
VRAMからfloat型を1要素読み込み

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]

%inst
GPUのVRAMから直接1つの値をとりだし返します。
p1はCL mem obj id
p2は読み出しインデックスを指定して下さい。
ブロッキングモードはオン(転送完了まで待つ)です。

VRAMの内容がfloat型4つの配列変数　(100.0,400.0,500.0,700.0)
だった場合
HCLReadIndex_d(memid,3)　は　700.0
を返します。

%href
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
;--------

%index
HCLWriteIndex_i32
VRAMに1要素書き込み

%prm
int64 p1,int64 p2,int p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]
int p3 : 内容				[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMはint型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。

%href
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLWriteIndex_fp
;--------

%index
HCLWriteIndex_i64
VRAMに1要素書き込み

%prm
int64 p1,int64 p2,int64 p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]
int64 p3 : 内容				[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMは64bit int型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。

%href
HCLWriteIndex_i32
HCLWriteIndex_dp
HCLWriteIndex_fp
;--------

%index
HCLWriteIndex_dp
VRAMに1要素書き込み

%prm
int64 p1,int64 p2,double p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]
double p3: 内容				[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMはdouble型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。


%href
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_fp
;--------
%index
HCLWriteIndex_fp
VRAMに1要素書き込み

%prm
int64 p1,int64 p2,float p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : 配列の要素(index)		[in]
float p3: 内容				[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMはfloat型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。


%href
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
;--------
%index
HCLFillBuffer
VRAMを指定の型と数値で埋める

%prm
int64 p1,var p2,int64 p3,int64 p4,int p5

int64 p1 : CL_mem_object id		[in]
var p2 : pattern			[in]
int64 p3 : offset,省略可		[in]
int64 p4 : size,省略可			[in]
int p5 : event_id,省略可		[in]

%inst
p1で指定したVRAM(CL mem obj id)にp2の値を書き込みます。
p2の型がint型なら4byteおき、float型でも4byteおき、double型やint64型なら8byte置きに値が書き込まれます。
省略時p3=0,p4=メモリサイズ
となります。

この命令自体は実行が完了するまで待つ命令ではなく、OpenCLコマンドをキューに入れるだけであり、実際のカーネルの実行終了を待つにはeventを使うかHCLFinish等で待つことになります。

%href
HCLReadBuffer
HCLWriteBuffer
;--------

%index
HCLdim_i32FromBuffer
HSP配列変数確保しVRAMからコピー

%prm
array p1,int64 p2
array p1 : HSP側の配列変数			[out]
int64 p2 : コピー元CL_mem_object id		[in]

%inst
p1で指定した変数をint型配列変数として初期化し、内容をp2からコピーします。
サイズは自動で決定されます。
なおHSPの仕様上、確保できるサイズの上限は1GBまでです。


%href
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
;--------
%index
HCLdim_i64FromBuffer
HSP配列変数確保しVRAMからコピー

%prm
array p1,int64 p2
array p1 : HSP側の配列変数			[out]
int64 p2 : コピー元CL_mem_object id		[in]

%inst
p1で指定した変数を64bit int型配列変数として初期化し、内容をp2からコピーします。
サイズは自動で決定されます。
なおHSPの仕様上、確保できるサイズの上限は1GBまでです。


%href
HCLdim_i32FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
;--------
%index
HCLdim_dpFromBuffer
HSP配列変数確保しVRAMからコピー

%prm
array p1,int64 p2
array p1 : HSP側の配列変数			[out]
int64 p2 : コピー元CL_mem_object id		[in]

%inst
p1で指定した変数をdouble型配列変数として初期化し、内容をp2からコピーします。
サイズは自動で決定されます。
なおHSPの仕様上、確保できるサイズの上限は1GBまでです。


%href
HCLdim_i64FromBuffer
HCLdim_i32FromBuffer
HCLdim_fpFromBuffer
;--------
%index
HCLdim_fpFromBuffer
HSP配列変数確保しVRAMからコピー

%prm
array p1,int64 p2
array p1 : HSP側の配列変数			[out]
int64 p2 : コピー元CL_mem_object id		[in]

%inst
p1で指定した変数をfloat型配列変数として初期化し、内容をp2からコピーします。
サイズは自動で決定されます。
なおHSPの仕様上、確保できるサイズの上限は1GBまでです。


%href
HCLdim_i64FromBuffer
HCLdim_i32FromBuffer
HCLdim_dpFromBuffer

;----------------
%index
HCLGetAllBufferSize
VRAM総サイズ取得

%prm
()

%inst
HCLCreateBuffer等で作成したbufferの総サイズを取得します。
この命令はGPUやCPUでのメモリ使用量を取得する命令ではなく、あくまでHSPCL64のプラグインを使ったプロセス内のデバイスbuffer確保サイズであることに注意してください。


%href
HCLCreateBuffer
HCLCreateBufferFrom
HCLGetSize
;----------------
%index
HCLGetSize
メモリサイズ取得

%prm
(int64 p1)
int64 p1 : CL_mem_object id		[in]

%inst
HCLCreateBuffer等で作成したbufferのサイズをbyteで返します。


%href
HCLCreateBuffer
HCLCreateBufferFrom
HCLGetAllBufferSize

;----------------
%index
HCLGarbageCollectionNow
VRAM一括解放

%prm
int64 p1,int64 p2,int64 p3・・・・
int64 p1 : 除外CL_mem_object id,省略可	[in]
int64 p2 : 除外CL_mem_object id,省略可	[in]
int64 p3 : 除外CL_mem_object id,省略可	[in]
int64 p4 : ・・・・

%inst
HCLCreateBuffer等で作成したbufferを解放します。

HCLCreateBufferやHCLCreateBufferFromなどcl mem objectを生成すると
明示的にHCLReleaseBufferで解放しない限りプロセスを終了するまで残り続けます。
もしコード内でcl mem idをロストしてしまうと解放することもできなくなってしまいます。

そこでプラグイン側で全て作成したcl mem idを覚えておき、擬似的なGCを行なうことで、いらなくなったcl memを解放できるようにしたのがHCLGarbageCollectionNow命令です。
ただしメモリの参照カウンタ等実装できないので手動でカウンタを回して頂く必要があります。

HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId

命令で参照カウンタを増減できます。
デフォルトで参照カウンタは0です。
参照カウンタが1以上のものはこの命令で破棄されません。

また参照カウンタが0以下のものでも
p1,p2・・・にmem idを指定することで、この命令実行時にメモリを解放しないようにすることができます。

%href
HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId

;----------------
%index
HCLIncRefcntCLBufferId
VRAM参照カウンタインクリメント

%prm
int64 p1
int64 p1 : CL_mem_object id	[in]

%inst
メモリidの参照カウンタを1増やします。
これは基本的に
HCLGarbageCollectionNow
命令とセットで使います。
便宜上参照カウンタと読んでいますが、実際HSP側からどれだけ参照されていようが、このカウンタはただのカウンタとしてしか機能しておらず、
実際の参照状況を測れているものではありません。

%href
HCLGarbageCollectionNow
HCLDecRefcntCLBufferId

;----------------
%index
HCLDecRefcntCLBufferId
VRAM参照カウンタデクリメント

%prm
int64 p1
int64 p1 : CL_mem_object id	[in]

%inst
メモリidの参照カウンタを1減らします。
これは基本的に
HCLGarbageCollectionNow
命令とセットで使います。
便宜上参照カウンタと読んでいますが、実際HSP側からどれだけ参照されていようが、このカウンタはただのカウンタとしてしか機能しておらず、
実際の参照状況を測れているものではありません。

%href
HCLGarbageCollectionNow
HCLIncRefcntCLBufferId
