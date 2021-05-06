;------------------------
;  デバイス情報関連
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
OpenCLデバイス情報管理

%port
Win

;-------- ref --------

%index
HCLini
HSPCLを初期化

%prm
int p1,int p2
int p1：スクリーンフラグ	[in]
int p2：デバッグモード		[in]

%inst
HSPCLを初期化します。
hspcl32.asをインクルードしたあとに実行して下さい。
これを実行した後、HCLDevCountにOpenCL実行可能デバイス数が代入されます。
以降デバイスidはHCLSetDevで  0～(HCLDevCount-1)  まで指定出来ます。

デバイスにより、HCLiniの初期化で画面が黒くなり、mes や boxf などのredraw 1で表示される画面が更新されなくなる現象が起こります。
このときp1に1を指定すればHCLiniの初期化時に画面が一瞬ちらつきますが、その後画面が黒くなる現象は直ります。画面の黒くなる現象はOpenGLの初期化によるものなのでOpenGLで画面描画を行う場合はp1は0のままで大丈夫です。
p2を1にするとHCLiniでの初期化時に、もしOpenGL連携が無理なデバイスであったり、OpenCLがアウトオブオーダー実行ではなくインオーダー実行しかできないデバイスである場合、ダイアログを出力するようにします。
OpenGL連携が無理かどうかはHCLiniの後でもHCLGetDevGLflgから取得できます。

%href
HCLbye

;--------

%index
HCLbye
HSPCLを解放


%inst
HSPCLを解放します。
HCLiniを実行している場合最後にこれでメモリを解放してください。
HCLbyeを実行せずともダイアログの「閉じる」をクリックした時に
自動的にHCLbyeが実行されるようにhspcl32.asにて設定しております。
また、これを二重に呼び出した場合思わぬエラーになることがあります。

%href
HCLini
;--------

%index
HCLGetDeviceInfo_s
デバイス情報取得

%prm
(int p1)
int p1：param_name [in]

%inst
HCLSetDev でセットしたデバイスの情報を文字列で取得します。
p1にparam_nameを指定して下さい。戻り値は文字列になります。
数値で取得したい場合はHCLGetDeviceInfo_iを使って下さい。

p1は下記のURLの表にある値からひとつ選んで指定できます。
日本語サイト：http://wiki.tommy6.net/wiki/clGetDeviceInfo
英語サイト：https://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i
HCLGetDevCLflg
HCLGetDevfp64flg
HCLGetDevGLflg
;--------

%index
HCLGetDeviceInfo_i
デバイス情報取得

%prm
(int p1,int p2)
int p1：param_name [in]
int p2：index [in]

%inst
HCLSetDev でセットしたデバイスの情報を文字列で取得します。
p1にparam_nameを指定して下さい。戻り値はint型の整数になります。
戻り値の数値が配列の場合は、p2にindexを指定することで、p2番目の要素の情報を得ることができます。
文字列で取得したい場合はHCLGetDeviceInfo_sを使って下さい。

p1は下記のURLの表にある値からひとつ選んで指定できます。
日本語サイト：http://wiki.tommy6.net/wiki/clGetDeviceInfo
英語サイト：https://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_s
HCLGetDevCLflg
HCLGetDevfp64flg
HCLGetDevGLflg
;--------


%index
HCLGetDevGLflg
デバイス情報取得

%prm
()

%inst
HCLSetDev でセットしたデバイスで、OpenGLとOpenCLの連携が可能かどうかint型で返します。
「0」なら使えない、「1」なら使えるということがわかります。
連携というのは具体的にいうと、OpenCLでとある座標を計算し、その座標データをVRAMに残したまま、OpenGLで読み込みその座標に点を打たせたい場合などです。
これは、CPU側のメモリいわゆるメインメモリに座標データを戻してこなくていいのでデータ転送の時間が0になり描画までを非常に高速に行うことができるというものです。

もし連携ができない場合、一旦メインメモリに座標データを戻してきた後OpenGLの命令でその座標に点を打つことはできます。
ただHCLCreateFromGLBuffer,HCLEnqueueAcquireGLObjects,HCLEnqueueReleaseGLObjectsを使えないだけです。

%href
HCLCreateFromGLBuffer
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
HCLGetDevCLflg
HCLGetDevfp64flg
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s

;--------

%index
HCLGetDevCLflg
デバイス情報取得

%prm
()

%inst
HCLSetDev でセットしたデバイスで、OpenCLが使えるかどうかをint型で返します。
「0」なら使えない、「1」なら使えるということがわかります。

%href
HCLGetDevfp64flg
HCLGetDevGLflg
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s
;--------

%index
HCLGetDevfp64flg
デバイス情報取得

%prm
()

%inst
HCLSetDev でセットしたデバイスで、OpenCLがdouble型を使えるかどうかをint型で返します。
「0」なら使えない、「1」なら使えるということがわかります。

%href
HCLGetDevCLflg
HCLGetDevGLflg
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s

;--------


%index
HCLSetDev
デバイスセット

%prm
int p1
int p1	デバイスid [in]

%inst

カーネル命令やカーネル登録、メモリ確保を実行するデバイスを指定します。
以下の命令を実行するデバイスをこの命令で最初に指定します。

HCLBuildProgram
HCLCreateKernel
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer
HCLCopyBuffer
HCLDoKernel
HCLWaitTask

HCLSetDevを読んでいない場合は、カレントデバイスはデバイス0です。
p1には0～(HCLDevCount-1)を指定して下さい。

%href
HCLBuildProgram
HCLCreateKernel
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer
HCLCopyBuffer
HCLDoKernel
HCLWaitTask

;--------

%index
fdim
配列変数を作成

%prm
p1,int p2
p1     : 変数			[in]
int p2 : 配列数			[in]

%inst
p1をfloat配列変数にします

;--------

%index
varsize
変数のサイズ取得

%prm
(var p1)
var p1 : 変数[in]

%inst
p1で指定された任意の型の配列変数の確保済みサイズ(byte)を返します。
（この関数はKerupani129 Project のブログのhttp://blogs.yahoo.co.jp/kerupani/13754300.htmlから拝借いたしました）

;--------