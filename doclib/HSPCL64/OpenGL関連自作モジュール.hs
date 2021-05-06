;------------------------
;   OpenGL関連自作モジュール
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
OpenGL関連自作モジュール

%port
Win



;-------- ref --------

%index
HGLSetView
画面初期化

%prm

%inst
OpenGLで描画を始める際に必要なperspective等を自動で設定します。
中身は以下のとおりです。

#deffunc HGLSetView
	win_x=ginfo(12)
	win_y=ginfo(13)
	glViewport 0,0,win_x,win_y
	glMatrixMode GL_PROJECTION
	glLoadIdentity
	gluPerspective 65.0,1.0*win_x/win_y, 0.01,10000.0; //視野の設定
	glPushMatrix
	glEnable GL_DEPTH_TEST
	view3D
	return

%href

;--------

;-------- ref --------

%index
HGLCreateBuffer
VRAM作成

%prm
var p1,var p2,int p3
var p1 : GL_mem_object idが代入される	[OUT]
var p2 : CL_mem_object idが代入される	[OUT]
int p3 : 確保するbyte数			[in]

%inst
グラフィックボードなどのデバイス上にメモリを確保します。
以下の図でいう②のバッファを作成できる命令です。この命令の内部でHCLCreateFromGLBufferを使用しています。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


ここで作成したバッファにOpenCLで計算した座標を格納して、OpenGLでglDrawArraysなどを使って点や三角形(プリミティブ)を描画したい時に使います。
そうすることで、毎フレームCPUが座標計算してGPUに転送せずに済むので、非常に高速に描画＆プリミティブの変形が可能になります。

ここで作成されたCL_mem_objectに対してHCLDoKernelを実行する際には必ずHCLEnqueueAcquireGLObjectsとHCLEnqueueReleaseGLObjectsを忘れないよう注意して下さい。

%href
HGLReleaseBuffer
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
;--------


;-------- ref --------

%index
HGLReleaseBuffer
VRAM破棄

%prm
int p1
int p1 : GL_mem_object id		[in]

%inst
以下の図でいう②のバッファを解放する命令です。
似た命令のHCLReleaseBufferでは解放できないので注意して下さい。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HGLCreateBuffer
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
;--------


;-------- ref --------

%index
HGLWriteBuffer
VRAMへ書き込み

%prm
int p1,array p2,int p3
int  p1 : GL_mem_object id		[in]
array p2: 配列変数			[in]
int  p3 : 書き込むbyte数		[in]

%inst
ホストからデバイスへデータを転送します。
p1にはHGLCreateBufferで作成したGL_mem_object id を、p2にはHSP側で作成した配列変数を使って下さい。


以下の図でいう②のバッファに対してデータを書き込みます。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

※HCLWriteBufferで代用できます。

%href
HGLReadBuffer
HGLCreateBuffer
HGLReleaseBuffer
;--------



;-------- ref --------

%index
HGLReadBuffer
VRAMから読み込み

%prm
int p1,array p2,int p3
int  p1 : GL_mem_object id		[in]
array p2: 配列変数			[in]
int  p3 : 書き込むbyte数		[in]

%inst
デバイスからホストへデータを転送します。
p1にはHGLCreateBufferで作成したGL_mem_object id を、p2にはHSP側で作成した配列変数を使って下さい。


以下の図でいう②のバッファからCPU側にデータを転送します。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

※HCLReadBufferで代用できます。

%href
HGLWriteBuffer
HGLCreateBuffer
HGLReleaseBuffer
;--------



;-------- ref --------

%index
HGLCreateTexture3
レンダリング可能テクスチャ作成

%prm
var p1,var p2,var p3,var p4,int p5,int p6,int p7,int p8

var p1 : texid			[OUT]
var p2 : CL_mem_object id	[OUT]
var p3 : fboid			[OUT]
var p4 : rboid			[OUT]
int p5 : size_x			[in]
int p6 : size_y			[in]
int p7 : fmt			[in]
int p8 : type			[in]


%inst
レンダリング可能テクスチャを作成します。
以下の図でいう⑤のテクスチャを作成します。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

これはOpenCLからも書き込み＆読み込みができ、またテクスチャとしてポリゴンに貼り付けることも可能で、かつレンダリング先としても使うことができます。
p1のtexidは、glBindTexture GL_TEXTURE_2D,texidというように使えば、ポリゴンにテクスチャを貼り付けることができます。(glBindTexture GL_TEXTURE_2D,0でバインド解除)
p2のCL_mem_object idはHCLDoKernelで使用できるclidで、OpenCLカーネルから読み書きできます。
p3のfboidはglBindFramebuffer GL_FRAMEBUFFER, fboidというように使えばレンダリング先として設定できglBindFramebuffer GL_FRAMEBUFFER,0でバインド解除できます。
p4のrboidは特に使うことはないかもしれませんが、HGLCreateTexture3で作成したテクスチャの破棄に使います。
p5にはテクスチャxサイズ(ピクセル)
p6にはテクスチャyサイズ(ピクセル)
p7にはGL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL が指定できます。
p8にはGL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV が指定できます。

p7にGL_RGBA、p8にGL_FLOATを指定すればHDR(ハイダイナミックレンジ)な描画も可能となります。


この命令で作成したテクスチャに対してはHGLReleaseTexture3で破棄してください。

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture3
;--------


;-------- ref --------

%index
HGLReleaseTexture
レンダリング可能テクスチャ解放

%prm
int p1,int p2,int p3

int p1 : texid			[in]
int p2 : fboid			[in]
int p3 : rboid			[in]


%inst
以下の図でいう③④のテクスチャを破棄します。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

%href
HGLCreateTexture3
;--------


;-------- ref --------

%index
HGLReleaseTexture3
レンダリング可能テクスチャ解放

%prm
int p1,int p2,int p3

int p1 : texid			[in]
int p2 : fboid			[in]
int p3 : rboid			[in]


%inst
以下の図でいう⑤のテクスチャを破棄します。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

%href
HGLCreateTexture
;--------


;-------- ref --------

%index
HGLCreateTexture2
テクスチャ作成

%prm
var p1,var p2,int p3,int p4,int p5,int p6


var p1 : texid			[OUT]
var p2 : CL_mem_object id	[OUT]
int p3 : size_x			[in]
int p4 : size_y			[in]
int p5 : fmt			[in]
int p6 : type			[in]


%inst
テクスチャを作成します。
以下の図でいう④のテクスチャを作成します。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

これはOpenCLから書き込み＆読み込みができ、またテクスチャとしてポリゴンに貼り付けることも可能なテクスチャです。
レンダリング先として使うにはHGLCreateTexture3を使用して下さい。
p1のtexidは、glBindTexture GL_TEXTURE_2D,texidというように使えば、ポリゴンにテクスチャを貼り付けることができます。(glBindTexture GL_TEXTURE_2D,0でバインド解除)
p2のCL_mem_object idはHCLDoKernelで使用できるclidで、OpenCLカーネルから読み書きできます。
p3にはテクスチャxサイズ(ピクセル)
p4にはテクスチャyサイズ(ピクセル)
p5にはGL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL が指定できます。
p6にはGL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV が指定できます。

破棄はHGLReleaseTexture

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture
;--------


;-------- ref --------

%index
HGLCreateTexture1
テクスチャ作成

%prm
var p1,int p2,int p3,int p4,int p5


var p1 : texid			[OUT]
int p2 : size_x			[in]
int p3 : size_y			[in]
int p4 : fmt			[in]
int p5 : type			[in]


%inst
テクスチャを作成します。
以下の図でいう③のテクスチャを作成します。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

テクスチャとしてポリゴンに貼り付けることが可能なテクスチャです。この命令で作ったテクスチャはまだ真っ白な状態なのでHGLWriteTextureで内容を書き換えて使います。

p1のtexidは、glBindTexture GL_TEXTURE_2D,texidというように使えば、ポリゴンにテクスチャを貼り付けることができます。(glBindTexture GL_TEXTURE_2D,0でバインド解除)
p2にはテクスチャxサイズ(ピクセル)
p3にはテクスチャyサイズ(ピクセル)
p4にはGL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL が指定できます。
p5にはGL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV が指定できます。

破棄はHGLReleaseTexture

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture
HGLCreateTexture1_texload
;--------


;-------- ref --------

%index
HGLCreateTexture1_texload
画像テクスチャ作成

%prm
var p1,str p2,int p3

var p1 : texid			[OUT]
str p2 : name			[in]
int p3 : flg			[in]

%inst
ファイルを読み込んでテクスチャを作成します。
以下の図でいう③のテクスチャを作成します。
p3に1を指定すると、現在colorで指定された色が透明色としてαに設定されます。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

※処理の内部でHSPの1039番目のバッファを使用しています。

破棄はHGLReleaseTexture

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture
HGLCreateTexture1
;--------



;-------- ref --------

%index
HGLWriteTexture
テクスチャ書き込み

%prm
int p1,array p2,int p3,int p4,int p5,int p6,int p7,int p8

int p1 : texid			[in]
array p2:data			[in]
int p3 : xoffset		[in]
int p4 : yoffset		[in]
int p5 : size_x			[in]
int p6 : size_y			[in]
int p7 : fmt			[in]
int p8 : type			[in]


%inst
CPU側からGPUのテクスチャにデータを書き込みます。
以下の図でいう③④⑤のテクスチャに書き込みを行えます。
p1にはテクスチャid
p2にはHSP側で確保した配列変数
p3には書き込み先のxオフセット
p4には書き込み先のxオフセット
p5には書き込むxサイズ
p6には書き込むyサイズ
を指定して下さい。
p7にはGL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL が指定できます。
p8にはGL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV
が指定できます。

html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html




%href
HGLReadTexture
HGLReleaseTexture
;--------



;-------- ref --------

%index
HGLReadTexture
テクスチャ読み込み

%prm
int p1,array p2,int p3,int p4

int p1 : texid			[in]
array p2:data			[OUT]
int p3 : fmt			[in]
int p4 : type			[in]


%inst
GPU側のテクスチャからCPU側へデータを転送します。
以下の図でいう③④⑤のテクスチャからデータを読み込みます。
p1にはテクスチャid
p2にはHSP側で確保した配列変数
を指定して下さい。

p3にはGL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL が指定できます。
p4にはGL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV
が指定できます。
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html




%href
HGLReadTexture
HGLWriteTexture
HGLReleaseTexture
;--------




;-------- ref --------

%index
convRGBtoBGR
フォーマット変換

%prm
array p1,array p2

array p1 : data				[in]
array p2 : data				[OUT]


%inst

1byteずつRGBRGBRGB・・と情報が入っていた場合、BGRBGRBGR・・というようにRとBを入れ替えて出力します。
p1は入力、p2は出力です。


%href
convRGBAtoRGB
convRGBtoRGBA
;--------


;-------- ref --------

%index
convRGBAtoRGB
フォーマット変換

%prm
array p1,array p2

array p1 : data				[in]
array p2 : data				[OUT]


%inst

1byteずつRGBARGBARGBA・・と情報が入っていた場合、RGBRGBRGB・・というようにAを取り除いて出力します。
p1は入力、p2は出力です。


%href

convRGBtoRGBA
convRGBtoBGR
;--------


;-------- ref --------

%index
convRGBtoRGBA
フォーマット変換

%prm
array p1,array p2,int p3

array p1 : data				[in]
array p2 : data				[OUT]
int   p3 : flg				[in]


%inst

1byteずつRGBRGBRGB・・と情報が入っていた場合、RGBARGBARGBA・・というようにAを付け加えて出力します。
p1は入力、p2は出力です。
p3に1を指定すると、現在colorで指定された色が透明色としてαに設定されます。


%href
convRGBAtoRGB
convRGBtoBGR
;--------



;-------- ref --------

%index
HGLgcopy
2D画像描画

%prm
int p1,int p2,int p3,int p4,int p5
p1=0～(0) : texid				[in]
p2=0～(0) : コピー元の左上X座標			[in]
p3=0～(0) : コピー元の左上Y座標			[in]
p4=0～    : コピーする大きさX（ドット単位）	[in]
p5=0～    : コピーする大きさY（ドット単位）	[in]

%inst
HGLCreateTexture等で作成されたtexidを2Dで描画します。
posで指定したポジションを左上としてgcopy同様にコピーします。
gmode にての半透明、アルファブレンドには対応してません。
アルファブレンドは

	glEnable GL_BLEND ;//ブレンドの有効化
	glBlendFunc GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA

でブレンドを有効化すればできます。

%href
HGLgrotate
;--------

;-------- ref --------

%index
HGLgrotate
2D画像回転描画

%prm
int p1,int p2,int p3,int p4,int p5,double p6,int p7,int p8
p1=0～(0)   : texid						[in]
p2=0～(0)   : コピー元の左上X座標				[in]
p3=0～(0)   : コピー元の左上Y座標				[in]
p4=0～      : コピー元のコピーする大きさX（ドット単位）		[in]
p5=0～      : コピー元のコピーする大きさY（ドット単位）		[in]
p6=0～(0.0) : 回転角度(単位はラジアン)				[in]
p7=0～(?)   : Xサイズ						[in]
p8=0～(?)   : Yサイズ						[in]

%inst
HGLCreateTexture等で作成されたtexidを2Dで回転描画します。
posで指定したポジションを中心としてgrotate同様にコピーします。
gmode にての半透明、アルファブレンドには対応してません。
アルファブレンドは

	glEnable GL_BLEND ;//ブレンドの有効化
	glBlendFunc GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA

でブレンドを有効化すればできます。

%href
HGLgcopy
;--------














;-------- ref --------

%index
HGLmqoload
mqoデータロード

%prm
str p1,var p2
str p1 : name				[in]
var p2 : mqoid				[OUT]

%inst
p1にはmqoファイル名、p2にはmqoidが代入されます。
このmqoidは描画やモデルの回転処理等に使います。


%href
HGLMqoDraw
HGLMqoSetPos
HGLMqoSetAng
HGLMqoSetScale
;--------

;-------- ref --------

%index
HGLMqoDraw
mqo描画

%prm
int p1
int p1 : mqoid				[in]

%inst
p1にmqoidを指定して下さい。

%href
HGLMqoSetPos
HGLMqoSetAng
HGLMqoSetScale
HGLmqoload
;--------




;-------- ref --------

%index
HGLMqoSetScale
mqo倍率変更

%prm
int p1,double p2,double p3,double p4
int p1    : mqoid				[in]
double p2 : scalex				[in]
double p3 : scaley				[in]
double p4 : scalez				[in]

%inst
p1にmqoidを指定して下さい。
p2～p4にx,y,z方向の倍率を指定して下さい。
内部でOpenCLの計算処理が入ります。必ずglClear～glFinishの間に入れないようにして下さい。

%href
HGLMqoDraw
HGLMqoSetPos
HGLMqoSetAng
HGLmqoload
;--------



;-------- ref --------

%index
HGLMqoSetPos
mqo位置セット

%prm
int p1,double p2,double p3,double p4
int p1    : mqoid				[in]
double p2 : posx				[in]
double p3 : posy				[in]
double p4 : posz				[in]

%inst
p1にmqoidを指定して下さい。
p2～p4にx,y,z方向の位置を指定して下さい。
内部でOpenCLの計算処理が入ります。必ずglClear～glFinishの間に入れないようにして下さい。

%href
HGLMqoDraw
HGLMqoSetAng
HGLMqoSetScale
HGLmqoload
;--------


;-------- ref --------

%index
HGLMqoSetAng
mqo回転

%prm
int p1,double p2,double p3,double p4,double p5
int p1    : mqoid				[in]
double p2 : Quaternion.0			[in]
double p3 : Quaternion.1			[in]
double p4 : Quaternion.2			[in]
double p5 : Quaternion.3			[in]

%inst
p1にmqoidを指定して下さい。
p2には回転させたい角度
p3～p5には回転軸となるベクトル(x,y,z)を単位ベクトルでセットして下さい。
内部でOpenCLの計算処理が入ります。必ずglClear～glFinishの間に入れないようにして下さい。

%href
HGLMqoDraw
HGLMqoSetPos
HGLMqoSetScale
HGLmqoload
HGLmulQuaternion
;--------



;-------- ref --------

%index
HGLmulQuaternion
クオータニオン掛けあわせ

%prm
array p1,array p2
array p1  : Quaternion			[OUT]
array p2  : Quaternion			[in]

%inst
Quaternionは4つの要素を持つdouble型の配列変数です。
p1に回転させられる側のQuaternionを指定して下さい。回転後の数値がp1に代入されます。
p2に回転させる側のQuaternionを指定して下さい。
Quaternionの形式ですが
Q = rad, x, y, z
の形式にして下さい。radは回転角度ラジアン、x,y,zは回転軸となる軸の単位ベクトルです。すべて浮動小数点とします。

Q = (cos(θ/2); xv・sin(θ/2), yv・sin(θ/2), zv・sin(θ/2))
の形式ではないことに注意して下さい。


%href
HGLMqoSetAng
HGLRotate3dbyQuaternion
;--------


;-------- ref --------

%index
HGLRotate3dbyQuaternion
座標回転

%prm
array p1,array p2,array p3
array p1  : Vertex (x,y,z)			[in]
array p2  : Vertex (x,y,z)			[OUT]
array p3  : Quaternion				[in]

%inst
Quaternionを使って3次元座標を回転させます。
p1には回転前の3つのx,y,z座標を持つ配列変数
p2には回転後の3つのx,y,z座標を格納する配列変数
p3にクオータニオンを指定して下さい。

%href
HGLmulQuaternion

;--------

























































