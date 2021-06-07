;------------------------
;   メモリ関連
;------------------------

;-------- header --------
%dll
HSPCL32.dll

%ver
4.00

%date
2014/09/04

%author
pippi

%note
hspcl32.as をインクルードしてください。

%type
GPGPU用プラグイン

%group
OpenCLメモリ制御

%port
Win

;-------- ref --------

%index
HCLCreateBuffer
VRAM作成

%prm
var p1,int p2
var p1 : CL_mem_object idが代入される	[OUT]
int p2 : 確保するbyte数			[in]

%inst
HCLSetDevで指定されたグラフィックボードなどのデバイス上にメモリを確保します。
主にGDDR5などのメモリのあるグラボ上に、指定したサイズのメモリが確保されることになります。
反対はHCLReleaseMemObjectで解放です


以下の図でいう①のバッファを作成できる命令です
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLSetDev
HCLReleaseMemObject

;--------

%index
HCLWriteBuffer
HSP配列情報をVRAMに書込

%prm
int p1,array p2,int p3,int p4,int p5,int p6
int p1 : コピー先CL_mem_object id		[in]
array p2:コピー元配列変数		[in]
int p3 : コピーサイズbyte		[in]
int p4 : コピー先のオフセット		[in]
int p5 : コピー元のオフセット		[in]
int p6 : ブロッキングモードoff		[in]

%inst
ホスト(CPU)からHCLSetDevで指定したデバイス(GPU)側にデータを転送します。
p6のブロッキングモードは0を指定するとoffになり、転送が完了しないうちに次の命令に移ります。
この場合転送完了まではHCLWaitTaskで待つことができます。
p6は省略時デフォルトで1です。

以下の図でいう①や②のバッファに対してデータを書込む命令です。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLCreateBuffer
HCLReadBuffer
HCLWaitTask

;--------

%index
HCLReadBuffer
VRAMからHSP配列情報に読込

%prm
int p1,array p2,int p3,int p4,int p5,int p6
int p1 : コピー元CL_mem_object id		[in]
array p2:コピー先配列変数			[OUT]
int p3 : コピーサイズbyte		[in]
int p4 : コピー元のオフセット		[in]
int p5 : コピー先のオフセット		[in]
int p6 : ブロッキングモードoff		[in]

%inst
HCLSetDevで指定したデバイス(GPU)からホスト(CPU)側にデータを転送します。
p6のブロッキングモードは0を指定するとoffになり、転送が完了しないうちに次の命令に移ります。
この場合転送完了まではHCLWaitTaskで待つことができます。
p6は省略時デフォルトで1です。

以下の図でいう①や②のバッファからデータを読み出す命令です。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html



※注意
HCLDoKernelでキューに送ったタスクがまだ計算中の時にHCLReadBuffer等でVRAMにアクセスするとHCLDoKernelで送ったタスクが完了する前にVRAM読み込みをしてしまう場合があります(機種による)。逆に、HCLReadBufferがHCLDoKernelのタスクを待ってくれている場合、この命令の処理時間がすごくかかっているようにみえる時がありますが、実際はタスク待ちがすごく長いだけです。一般的にCPUからVRAMへの読み込み、書き込み速度は通常片方向8GB/sec～16GB/secと高速です。

%href
HCLCreateBuffer
HCLWriteBuffer
HCLWaitTask


;--------

%index
HCLCopyBuffer
VRAM同士コピー

%prm
int p1,int p2,int p3,int p4,int p5,int p6]
int p1 : コピー先CL_mem_object id		[in]
int p2 : コピー元CL_mem_object id		[in]
int p3 : コピーサイズbyte		[in]
int p4 : コピー先のオフセット		[in]
int p5 : コピー元のオフセット		[in]
int p6 : ブロッキングモードoff		[in]

%inst
HCLSetDevで指定したデバイス上のメモリ間でコピーをします。
p6のブロッキングモードは0を指定するとoffになり、転送が完了しないうちに次の命令に移ります。
転送完了まではHCLWaitTaskで待つことができます。
p6はデフォルトで1です。


以下の図でいう①、②、④、⑤へ相互方向へデータコピーが可能な命令です。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer
HCLWaitTask

;--------

%index
HCLReleaseMemObject
VRAM破棄

%prm
int p1
int p1 : CL_mem_object id			[in]
%inst
デバイス上のメモリを解放します。


以下の図でいう①の解放です。②の解放はHGLReleaseBufferを使って下さい。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

%href
HCLCreateBuffer
;--------

%index
HCLCreateFromGLBuffer
VRAM作成(OpenGL連携)

%prm
var p1,int p2
var p1 : CL_mem_object idが代入される	[OUT]
int p2 : GL_mem_object vbo		[in]

%inst
vboは「glGenBuffers」命令で作成したvboなどを指定してください。
OpenCLで計算した座標にOpenGLで点(プリミティブ)を描画したい時などに使います。

この命令は以下の図でいう②の生成HGLCreateBufferの中で使用されています。
なのでHGLCreateBufferを使う場合は、HCLCreateFromGLBufferは必要ありません。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
;--------

%index
HCLEnqueueAcquireGLObjects
vboバッファをロック

%prm
int p1
int p1 : vboと関連付けたCL_mem_object	[in]

%inst
vboをopenclで扱うためにvboバッファをロックします。
vboを扱うカーネルの前にはかならず実行してください。
またこれを呼んだ後HCLEnqueueReleaseGLObjectsを必ず実行してロックを解除してください

%href
HCLEnqueueReleaseGLObjects


;--------

%index
HCLEnqueueReleaseGLObjects
vboバッファをロック解除

%prm
int p1
int p1 : vboと関連付けたCL_mem_object	[in]

%inst
HCLEnqueueAcquireGLObjectsと対です
%href
HCLEnqueueAcquireGLObjects
;--------























;--------

%index
HCLReadIndex_i
VRAMから1要素読み込み

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]

%inst
GPUのVRAMから直接1つの値をとりだし返します。
p1はCL mem obj id
p2は読み出しインデックスを指定して下さい。
ブロッキングモードはオン(転送完了まで待つ)です。

VRAMの内容がint型4つの配列変数　(100,400,500,700)
だった場合
HCLReadIndex_i(memid,3)　は　700
を返します。

%href
HCLReadIndex_d
HCLReadIndex_f
HCLReadIndex_s

;--------



;--------

%index
HCLReadIndex_d
VRAMから1要素読み込み

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]

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
HCLReadIndex_i
HCLReadIndex_f
HCLReadIndex_s

;--------



;--------

%index
HCLReadIndex_f
VRAMから1要素読み込み

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]

%inst
GPUのVRAMから直接1つの値をとりだし返します。
p1はCL mem obj id
p2は読み出しインデックスを指定して下さい。
ブロッキングモードはオン(転送完了まで待つ)です。

VRAMの内容がfloat型4つの配列変数　(100.0,400.0,500.0,700.0)
だった場合
HCLReadIndex_f(memid,3)　は　700.0
を返します。

%href
HCLReadIndex_d
HCLReadIndex_i
HCLReadIndex_s

;--------



;--------

%index
HCLReadIndex_s
VRAMから1要素読み込み

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]

%inst
GPUのVRAMから直接1つの値をとりだし返します。
p1はCL mem obj id
p2は読み出しインデックスを指定して下さい。
ブロッキングモードはオン(転送完了まで待つ)です。

VRAMの内容がchar型4つの配列変数　(10,40,50,7)
だった場合
HCLReadIndex_s(memid,3)　は　7
を返します。
char型なので範囲は0～255の範囲です。

%href
HCLReadIndex_d
HCLReadIndex_f
HCLReadIndex_i

;--------



















;--------

%index
HCLWriteIndex_i
VRAMに1要素書き込み

%prm
int p1,int p2,int p3

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]
int p3 : 内容				[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMはint型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。


%href
HCLWriteIndex_d
HCLWriteIndex_f
HCLWriteIndex_s

;--------


;--------

%index
HCLWriteIndex_d
VRAMに1要素書き込み

%prm
int p1,int p2,double p3

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]
double p3:内容				[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMはdouble型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。


%href
HCLWriteIndex_i
HCLWriteIndex_f
HCLWriteIndex_s

;--------

;--------

%index
HCLWriteIndex_f
VRAMに1要素書き込み

%prm
int p1,int p2,float p3

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]
float p3:内容				[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMはfloat型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。


%href
HCLWriteIndex_d
HCLWriteIndex_i
HCLWriteIndex_s

;--------

;--------

%index
HCLWriteIndex_s
VRAMに1要素書き込み

%prm
int p1,int p2,int p3

int p1 : CL_mem_object id		[in]
int p2 : 配列の要素(index)		[in]
int p3 : 内容(0～255)			[in]

%inst
p1で指定したVRAM(CL mem obj id)の内容にp3値を書き込みます。
書き込みインデックスはp2で指定します。
このときVRAMはchar型の配列変数として考えます。

ブロッキングモードはオン(転送完了まで待つ)です。


%href
HCLWriteIndex_d
HCLWriteIndex_f
HCLWriteIndex_i

;--------
