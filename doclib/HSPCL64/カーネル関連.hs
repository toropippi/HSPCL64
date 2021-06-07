;------------------------
;   カーネル関連
;------------------------

;-------- header --------
%dll
HSPCL64.dll

%ver
1.0

%date
2021/06/07

%author
toropippi

%note
hspcl64.as をインクルードしてください。

%type
GPGPU用プラグイン

%group
OpenCLカーネル関連

%port
Win

;-------- ref --------

%index
HCLBuildProgram
カーネルプログラムのビルド

%prm
str p1,var p2
str p1 : カーネルソースファイル名  [in]
var p2 : プログラムidが代入される[OUT]

%inst
p1にはソースのファイル名を入れて下さい。
p2はコンパイルされたプログラムidが代入されます。

コンパイルされたOpenCLカーネルプログラムは、そのデバイス上でしか使えません。
２つ以上のデバイス上で同じカーネルを実行したいとき、それぞれのデバイスidをHCLSetDevでセットしなおしてHCLBuildProgramを呼んで下さい。


%href
HCLCreateProgramWithSource
HCLSetDev
HCLCreateKernel
HCLReleaseProgram

;-------- ref --------

%index
HCLCreateProgramWithSource
カーネルプログラムのビルド

%prm
str p1,int p2,var p3
str p1 : カーネルソース文字列  [in]
int p2 : カーネルソース文字列サイズ  [in]
var p3 : プログラムidが代入される[OUT]

%inst
p1にはソースのデータを入れて下さい。
p2にはソースの大きさを入れてください。
p3にはコンパイルされたプログラムidが代入されます。

コンパイルされたOpenCLカーネルプログラムは、そのデバイス上でしか使えません。
２つ以上のデバイス上で同じカーネルを実行したいとき、それぞれのデバイスidをHCLSetDevでセットしなおしてHCLBuildProgramを呼んで下さい。


%href
HCLBuildProgram
HCLSetDev
HCLCreateKernel
HCLReleaseProgram

;--------

%index
HCLCreateKernel
カーネル作成

%prm
int p1,str p2,var p3
int p1 : プログラムid          [in]
str p2 : カーネル関数名        [in]
var p3 : カーネルidが代入される[OUT]

%inst
カーネルという、OpenCLの関数を実行する１単位を登録します。


p2はp1カーネルソース内にある「__kernel 」から始まる関数名を「__kernel 」より後の文字列で指定します。
例えばp1ソース内に「__kernel void vector_add(__global float *A) {」という行があればp2は "vector_add" を指定します。
p3にはカーネルidが出力されます。
以降、変数のセットや計算はこのカーネルidという形で管理、実行できます。



%href
HCLBuildProgram
HCLCreateProgramWithSource
HCLSetDev
HCLReleaseKernel

;--------

%index
HCLSetKernel
カーネルセット

%prm
int p1,int p2,p3,int p4
int p1 : カーネルid			[in]
int p2 : 引数の順番p(x)の指定		[in]
    p3 : 引数に渡す実体(定数やmem_object)[in]
int p4 : ローカルメモリフラグ		[in]
%inst
カーネルの引数一つ一つにデータを渡します。

HCLDoKernelで計算する前にこれでカーネルの引数を予めセットしておかなければいけません。


例えばカーネル側のソースが「__kernel void vector_add(__global float *hairetu,float teisu) {」というものなら
HCLSetKernel p1,0,mem_object_A	//(←HCLCreateBufferで作成したmem_object id)	;配列
HCLSetKernel p1,1,float(5.0)	//定数
と2回に渡り指定します。

p2は、vector_addの引数の一番左を0とした番号として考えます。

１回セットすれば次セットし直すまで同じ値が残ります。
p3には文字列型変数、int型変数、float型変数、double型変数が指定でき、またmem_object idも指定可能です。


p4を0以外にすると、その引数はローカルメモリ（共有メモリ）として登録されます。ローカルメモリはグローバルメモリより容量が少ない分高速にアクセスが可能な書込読取可能メモリです。
一つのワークグループ内でしか値を保持できません。初期値は設定不可で0または不定です。
並列計算中、他のスレッドと情報を共有したいときに使います。以下参照。
p4が0以外のとき、p4には確保したいローカルメモリサイズ(byte)をintで指定して下さい。p3は無視されます。


ローカルメモリの使い方は以下のとおりです

例
カーネルコード
__kernel void vector_add(__global double *A, __global double *B, __local double block[] , int bekii, int n) {
	block[0]=1;//共有メモリの0番目に1を代入
・・・・・

に対するHSPスクリプトでのHCLSetKernelは
HCLSetKernel p1,0,mem_object_dpA
HCLSetKernel p1,1,mem_object_dpB
HCLSetKernel p1,2,0,64 (←p3には0を指定、p4は64byteつまりdouble型*8個の共有メモリを作れという意味、OpenCLカーネルソース内ではblock[0]～block[7]が同じワークグループ内で共有して使える)
HCLSetKernel p1,3,10
HCLSetKernel p1,4,1024



%href
HCLSetDev
HCLCreateKernel
HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3

;--------

%index
HCLCall
カーネル文字列実行

%prm
str p1,int p2,array p3,array p4,array p5,array p6,array p7,array p8,array p9
str p1 : カーネル文字列			[in]
int p2 :グローバルワークサイズ(1次元並列処理数)[in]
array p3:カーネルに渡す引数		[in]
array p4:カーネルに渡す引数		[in]
array p5:カーネルに渡す引数		[in]
array p6:カーネルに渡す引数		[in]
array p7:カーネルに渡す引数		[in]
array p8:カーネルに渡す引数		[in]
array p9:カーネルに渡す引数		[in]
%inst

HCLBuildProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer等をせずカーネルを一気に実行してしまいます。
p2にはグローバルワークサイズ（実行したい並列処理数）
p3以降はカーネルに渡す引数を。HSP側で確保した配列変数を指定してください。
p3～p9は引数の省略ができないので、省略したいとこは「NULL」をセットしてください。

内部でHCLBuildProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer,HCLWriteBuffer,HCLReadBuffer,HCLReleaseKernel,HCLReleaseProgram,HCLReleaseMemObject,varsizeを使用しています。
この命令で確保したVRAM等は、この命令が終わるまでに必ず破棄されます。
HCLDoKernelと違い、タスクが完了するまで次の命令にうつりません。


■この命令を使う前に
この命令はOpenCLの入門用として、また簡易にOpenCLを利用できることを目的に作成した命令です。
（LV1_簡単に扱える）
「HSPで用意した配列変数をVRAM等に移す処理、セット処理」などを自動化し、より初心者が簡易に扱えるようにしております。

この命令を利用するためには

1.OpenCL用の命令ソースを別個用意する。（簡易なC言語にて表記）
2.処理対象のHSPの配列変数を用意する。
3.HCLCall実行後、HCLCallの引数として用意した変数がOpenCLによって処理された形で値が返る。

OpenCLのカーネル関数はretrunという形でHSPに値を帰す事はしません。
直接変数を介して値を返します。その点に注意して下さい。

慣れてきたらHCLDoKernel、HCLDoKrn1,2,3へとステップアップしてください。

■使用注意
この命令を使ってもある程度高速に計算を行うことができますが、同じソースで何度も繰り返し使うものではありません。思わぬエラーの原因になります。



%href
HCLDoKernel
;--------

%index
HCLDoKernel
カーネル実行

%prm
int p1,int p2,array p3,array p4
int p1 : カーネルid			[in]
int p2 : work_dim(1～3)			[in]
array p3:global_work_size		[in]
array p4:local_work_size		[in]
%inst

p1には実行したいカーネルid
p2には1～3 (work dimension＝グローバルワークサイズとローカルワークサイズの次元)
p3にはグローバルワークサイズ(並列処理数)を記憶する変数
p4にはローカルワークサイズを記憶する変数
を指定してください。
p4の変数の内容が0の場合、グローバルワークアイテムをどのようにワークグループに分割するかは OpenCL 実装が決定します。



■この命令を使う前に
本プラグインの基本コンセプトは世界一OpenCLを簡単に扱えるプラグインを目指して開発しております。
そのため独特な処理が多いOpenCL（GPGPU）の初期理解を補助するために
処理のレベルを３段階に分けております。

LV1	HCLCall		を利用したOpenCL（簡単！）
LV2	HCLDoKernel	を利用したOpenCL（中くらい！）
LV3	HCLDoKrn1～3を利用したOpenCL（普通！）

自分の学習の理解度に併せて上位の命令を利用して頂ければ幸いです。
（当然処理速度はLV3の方が当然速いです。しかしそのためのより高度なメモリ管理、スレッド管理の知識等が必要となります）

OpenCL（GPGPU）の主な役割はホスト側（CPU側）とデバイス側（グラボ側）の処理の橋渡しになります。
しかしそれにはメモリの管理、スレッド管理などが必要となり処理が煩雑になりまた初心者には理解し辛いと考えております。

そのためOpenCLをこれから利用しよう、学習しようとする方は
使用者の処理を簡素化できるHCLCallからの利用をオススメいたします。


■HCLDoKernelについて
この命令はOpenCLの入門用として、また簡易にOpenCLを利用できることを目的に作成した命令です。
（LV２中くらい簡単に扱える）
HCLCallでは自動的に処理していた「HSPで用意した配列変数をVRAM等に移す処理」「スレッドの次元」を
自ら設定しなければなりません。
しかし設定できる部分が少ないHCLCallと比較して処理の高速化を行う事が可能になります。



HSPユーザーとしてHCLDoKernel（OpneCLプラグイン）を利用する時、理解の上で躓きやすい点をリストアップしました。
そのためにOpenCLを利用する上での独特な処理を説明します。

	1.OpenCL用の命令ソースを別個用意する必要がある。（簡易なC言語にて表記）
	そしてそのソースをHSP上で固有の命令（HCLBuildProgram）で読み込み。

	2.そのソースの関数を「カーネル」と言われる命令単位をHSP上で固有の命令（HCLCreateKernel）で作成する。


	3.カーネル関数への引数をセットする際、その引数は　CL_mem_object idという固有のオブジェクト形式である必要がある。
	そのオブジェクトを用意するにはHSP上で固有の命令HCLCreateBufferにて作成する。
	またそのオブジェクトにHSP上で用意した変数を入れ込みたい時はHSP上で固有の命令HCLWriteBufferにて入れ込む。
　
	4.先ほどカーネル関数に入れ込むための引数を固有のオブジェクト形式にて用意した。
	その引数をカーネル関数に引数をセットするとき固有の命令（HCLSetKernel）を使用しなければならない。 
	（またその引数はカーネルの関数の引数が３つあったとしても一つづつしかセットできない。）

	5.そして引数をセットしたカーネルを固有の命令（HCLDoKernel）で実行。

	6.そしてその結果を参照する時はHSP上の固有の命令（HCLReadBuffer）で引数を参照する。

このような処理が必要となるのはホスト側（CPU側）とデバイス側（グラボ側）の処理/メモリ管理が別個となっているからです。
その間の橋渡しを行うのがOpneCLであり、そのために独特な処理が必要なっております。




■インデクス空間について
GPGPUプログラミングにおいて、グローバルワークサイズやローカルワークサイズはとても重要な概念になってきます。
OpenCLだけでなくCUDAでも考え方をします。


html{
<img src="./doclib/HSPCL32/thumbs/d22.png">
}html


この図全体がNDRange

NDRange サイズ Gx＝global_work_size[0]＝グローバルワークアイテムxのサイズ＝この図だと4
NDRange サイズ Gy＝global_work_size[1]＝グローバルワークアイテムyのサイズ＝この図だと6

ワークグループサイズSx＝local_work_size[0]＝ローカルワークアイテムxのサイズ＝この図だと2
ワークグループサイズSy＝local_work_size[1]＝ローカルワークアイテムyのサイズ＝この図だと3

ワークアイテム＝スレッド＝この図で言うと24個ある水色の箱。

赤枠内の黄色いところ(グループ内)で共有メモリが使えます。
「VRAM」と「共有メモリ」は違います。

VRAM＝ビデオメモリー＝デバイスメモリー＝グローバルメモリー＝GDDR5（アクセス一番遅い）＝カーネルソースで__globalで指定した変数
共有メモリー＝１次キャッシュ＝ローカルメモリー（少し早い）＝カーネルソースで__localで指定した変数
プライベートメモリー＝レジスタ（一番早い）＝カーネルソースで何も指定しなかった時の変数(uint ic　とかはこれをさしている)

プログラマはOpenCLでデータ並列処理を行うためにインデクス空間の次元数、ワークアイテムの総数、ワークグループサイズを指定することでインデクス空間を定義しなければなりません。


■インデクス空間における計算とローカルワークサイズについて
まずはじめに、カーネルは一つの計算の流れを記したものです。
一つのスレッドで一つのカーネルを実行します。
何個のスレッドを処理したいかをグローバルワークサイズつまりp3で指定します。
ここでグローバルワークサイズを10000とします。
グローバルワークサイズは大きな箱で、それを区切る仕切りがあるとします。
仕切りで区切られた部屋の、その大きさをローカルワークサイズと呼びましょう。
今はローカルワークサイズは「適切な値」だとします。

さてまず4コアのCPUをイメージしてみましょう。
今仮に1コアが同時に4スレッド実行できたとするとこのCPUは1回に16スレッド実行できることになります。
そして最初の16スレッドが並列処理され残りの9984スレッドが待っている状態になります。（簡単にしているだけで実際はちょっと違いますが・・）
スレッドがカーネル処理を完了すれば、また次のスレッドへとうつっていきます。
これが625(=16/10000)回繰り返され、このタスクが終了となります。
このため、各スレッドはそれぞれバラバラのタイミングで計算され始め、終わりのタイミングも違うので、スレッド同士でデータ通信することはできないはずです。
100番目のスレッドの計算結果を1番目のスレッドで使いたいと言っても無理なのです。
逆に1番目のスレッドの計算結果を100番目が使いたいというのも無理です。なぜなら必ず1番目のスレッドから順番に計算を始めてくれるというものではないからです。
ところがp4のローカルワークサイズをうまく設定することで、スレッド同士の通信が可能になる場合があります。
ここでローカルワークサイズを100とします。
今ここに10000のワークサイズのとても大きな箱があったのですが、そこを100個の部屋に分割しました。
もちろん一つの部屋の中にはカーネルというアイテムが100個存在します。
CPUは、この部屋単位で処理することもできます。というか実は１コアは１部屋単位で処理します。
１コアが一部屋分のカーネルを実行しようとするとき、CPUは１コアの中に100スレッド立てます。
もちろん計算速度は上の4スレッドの時より25分の1に落ちるかもしれません。
そしてこのとき100個のスレッドは必ず足並みをそろえます。そういうものなのです。
ここに利点があります。
部屋の中は必ず同時に処理されているので、1番目のスレッドと100番目のスレッドが共有メモリを介してデータを通信することができるのです。
必ず同時にというのは、100スレッドすべてがソースコードの同じ行を実行していると言ったような感じです。
ここまで同期していれば、部屋の中にある100個のスレッド全てが同じあるデータを共有することができるのも納得です。

さてここで、ある処理により100個中1個だけがすごい処理に時間がかかってしまったとします。
すると100スレッドは必ず足並みをそろえているので残り99個のスレッドは待ちぼうけを喰らいます。
本来１コア4スレッドまで実行できるのに1スレッドしか計算できていないことになります。
これは１コアの機能の3/4が空回りしている状態なのでかなり無駄であると言えます。
これが欠点です。
この1スレッドの処理が終われば、残りの99スレッドも終了して、CPUコアは次の部屋を処理し始めます。

ローカルワークサイズを大きくしすぎた場合の欠点は、一つのスレッドが足を引っ張ると残りのスレッドが待たないといけなくなることです。
しかし共有メモリを使わないからと言ってローカルワークサイズを1にすると、１コアが同時に処理できるのが一部屋だけなので
一部屋処理するのに１スレッド立てて、やっぱり3/4が無駄となってしまいます。
この場合一番いいローカルワークサイズの「適切な値」は4となります。

GPUの場合はどうでしょう。
AMD HD7970 の場合、GCNという演算器(コア)が32個あります。
一つのGCNは64スレッドまで同時に処理できるのでこの場合一番いいローカルワークサイズは64となります。
ローカルワークサイズは64を指定した時、32個のコアが各々の64個のスレッドを処理し始めるので、同時に2048個の並列処理が可能ということになります。
ちなみに一部のnVidiaのグラボは1つのコアあたり192スレッド同時処理できるものもあるようです。

つまりローカルワークサイズには、演算コアを空回りさせないための適切なスレッド数を指定しないと、高速処理ができないよということです。




■引数詳細説明

p2はwork_dimと言い、global_work_sizeやlocal_work_sizeの次元を設定します。1～3を指定できます。
1ならカーネルソースでget_global_id(0)が使えます。
2ならカーネルソースでget_global_id(0),get_global_id(1)が使えます。
3ならカーネルソースでget_global_id(0),get_global_id(1),get_global_id(2)が使えます。
get_global_idはスレッド番号を戻します。２次元スレッドならget_global_id(0)はx方向のスレッド番号、get_global_id(1)はy方向のスレッド番号を戻します。

p3には、カーネルを何個実行したいか数を指定します。実行時にこの数の分だけワークアイテムが生成されます。
これはp2のwork_dimで指定した値が2以上の場合、p3は配列変数で指定しなければいけません(要素数work_dim個の)
p4はローカルワークサイズと言い、1～256(デバイスによる)を指定できます。ここもp2のwork_dimで指定した値が2以上の場合、配列変数で指定しなければいけません(要素数work_dim個の)
そしてp3の各要素はp4の各要素で割り切れなければいけません。
またp4の各要素の全部の積がHCLGetDeviceInfo_i(CL_DEVICE_MAX_WORK_GROUP_SIZE,0)で得られた数を超える場合エラーになります。たいてい256か1024くらいです。

さきほどの説明通り、p4は1を指定すると非効率になってしまうことが多いです。とくにGPUでは顕著です。
CPUでは、SIMDをフルに使いこなすためにp4の値を1より4や8にしたほうが良い場合もありますが多分あまり関係なく、カーネルソース内に「float4」や「float32」を使った計算を入れたほうがSIMDをフルに使えるでしょう。
p4に大きい値を設定しても速度的に不利になることは基本的にはありませんが、各々の環境で確かめながら調節して下さい。




以下にワークグループやグローバルidなどの用語や使い方の解説を載せます。

例
work_dim=2
global_work_size=4,6
local_work_size=2,3
を指定したとします。

html{
<img src="./doclib/HSPCL32/thumbs/d22.png">
}html

並列実行されるスレッド数は4*6の24個となります。

今度はカーネル側のサンプルです。
カーネルソースでは
__kernel void vector_add(__global double *A, __global double *B, __local double block[] , int bekii, int n) {
	int i0 = get_global_id(0);
	int i1 = get_global_id(1);
・・・・・・・・・計算処理部分・・・・・・・・
}

となっているとします。
カーネルは24個並列作動しますがそれぞれを見分けるidがあり、それがget_global_idで取得できます。

get_global_id(0)は0～3を
get_global_id(1)は0～5をそれぞれのワークアイテムに戻します。（以下の図参照）

get_local_id はワークグループ内の識別idを戻します。
get_local_id(0)は0～1を
get_local_id(1)は0～2をそれぞれのワークアイテムに戻します。（以下の図参照）

get_group_idはワークグループのグループ識別番号を戻します。
get_group_id(0)は0～1
get_group_id(1)は0～1をそれぞれのワークアイテムに戻します。（以下の図参照）

get_global_sizeはグローバルサイズで、どのワークアイテムでも戻す値は同じ値で
get_global_size(0)は6
get_global_size(1)は3
となります。

get_local_sizeはローカルサイズで、どのワークアイテムでも戻す値は同じ値で
get_local_size(0)は2
get_local_size(1)は3
となります

get_num_groupsはグループ数で、どのワークアイテムでも戻す値は同じ値で
get_num_groups(0)は3
get_num_groups(1)は1
となります


以下、24スレッドの各値の図

html{
<img src="./doclib/HSPCL32/thumbs/d2.png">
}html


■使用注意
（１）
HCLCreateBufferで作成したVRAMの範囲外にカーネルソース側でアクセスしようとした時、フリーズまたはブルースクリーンになる現象が確認されています。

（２）
一部のNVidiaのグラボでは、グローバルワークサイズはローカルワークサイズで整除できなければいけません。
dim globalsize,3
dim localsize,3
globalsize=2048,2048,7
localsize=8,8,4
であった場合、globalsize.2はlocalsize.2で割り切れないためにエラーとなります。ただしAMDのグラボや最新のNVidiaのグラボ、一部のCPUではエラーにならないこともあります。エラーの場合
「global_work_sizeがlocal_work_size で整除できない、またはlocal_work_size[0]*local_work_size[1]*local_work_size[2]が、一つのワークグループ内のワークアイテム数の最大値を超えた」
というメッセージが出ます。

（３）
高速化について
「HCLDoKernel」はエラーチェック処理機能や内部でwork_dim分岐処理がついているため、オーバーヘッドが気になる方は「HCLDoKrn1」「HCLDoKrn2」「HCLDoKrn3」で
エラーチェックなしの同処理が行なえます。これでできる高速化といっても非常に軽微なものです。毎秒カーネル実行命令を1000回呼び出すレベルで差が見えてきます。
(2014/10/8 一部のエラーチェックを「HCLDoKrn1」「HCLDoKrn2」「HCLDoKrn3」に追加したので少し安全性が高まりました。)

（４）
この命令はカーネルを実行するわけではなくカーネルをキューに入れるだけなので、この命令を実行したあとに計算が終了しているわけではありません。タスクの確実な終了にはHCLWaitTaskを使ってください。ただしHCLWaitTaskを使わなくても、HCLDoKernelの後HCLReadBufferで計算結果のデータを読み出そうとした場合、HCLReadBufferを実行した時点で必ずHCLDoKernelで送ったカーネルの処理が終了するような仕様になっている場合もあります(機種による)。この場合HCLWaitTaskを使わなくても必ず計算結果がHCLReadBufferで読み出せるということです。
少々面倒な仕様ですが、カーネルをキューに入れた後はすぐに次の命令に移りますので、CPUが無駄な時間を待つことはないというメリットがあります。

■カーネルソースについて
（１）
定数は「const」より「define」を使ったほうがいいです。

（２）
「clamp」関数は古いグラボではコンパイルエラーになります。

（３）
「mad24」や「mul24」関数では、引数の型を必ず揃えて下さい。デバイスによってはコンパイルが通ったり通らなかったりしてバグの原因となります。

（４）
for()文を使うとき、コンパイラがループ展開する場合があります。ループ回数があまりに多い場合、命令コードでキャッシュが圧迫され正しい計算ができないことがあります。

（５）
使用注意でも説明しましたがメモリアクセス違反に十分注意して下さい。ブルースクリーンになります。

（６）
使える代表的な演算子
=	代入
!=	条件文
==	条件文
>	条件文
<	条件文
>=	条件文
<=	条件文
>>	右シフト
<<	左シフト
％	a％b　でaをbで割った余りを返す（事情により全角）
/	割り算
*	掛け算
+	足し算
-	引き算
--	-=1と同意味
++	+=1と同意味
&var	変数varのポインタ。使いドコロとしては自作関数の出力値に変数をセットしたいとき（むしろそれだけ）
*var	varがポインタであることが前提。「*var」はvarの指すポインタ位置の変数。使いドコロとしては関数の出力値の宣言など
->	間接メンバ参照演算子

（７）
使える代表的な変数型
uはunsignedの意味
1bit変数
・bool 0～1
1byte変数
・uchar 0～255
・char -128～127
2byte変数
・ushort 0～65536
・short -32768～32767
4byte変数
・float -∞～+∞
・uint 0～約40億
・int -約20億～+約20億
8byte変数
・double -∞～+∞
・ulong 0～約1800京
・long -約900京～+約900京

（８）
型変換
uint a;
uchar b=1;
a=b;//これでもいいが
a=(uint)b;//このほうがエラーを防げる

同じく
float ftmp;
int i0=123;
ftmp=(float)i0;//ftmpには123.0000が代入される

（９）
関数
「__global 」はVRAM上の変数を使うという意味
「__local」はローカルメモリ上の変数を使うという意味

（１０）
使える関数、命令、演算子など詳細に知りたい方は
https://www.khronos.org/files/opencl-quick-reference-card.pdf
へ

（１１）
double型は標準でサポートしていません。
使いたい場合はカーネルソースの先頭に

#ifdef cl_khr_fp64
  #pragma OPENCL EXTENSION cl_khr_fp64 : enable
#elif defined(cl_amd_fp64)
  #pragma OPENCL EXTENSION cl_amd_fp64 : enable
#else
  #error Double precision floating point not supported by OpenCL implementation.
#endif

をいれてください。


■最後に
これだけではまだ説明不足で、理解が難しいと思いますが、本プラグイン付属のサンプルのコメントや、ドキュメントも読んでいただけたらなと思います。
そしてOpenCLの全貌を理解するのに少しでも役に立てばいいと思い参考となるリンクを載せておきます。

http://seesaawiki.jp/w/mikk_ni3_92/d/OpenCL
http://neareal.net/index.php?Programming%2FOpenCL%2FOpenCLSharp%2FTutorial%2F4_SimpleOpenCLTask-1
http://www.02.246.ne.jp/~torutk/cxx/opencl/
http://www.matlab.nitech.ac.jp/papers/pdf/degree/2011_bachelor_sawada.pdf
http://www.cc.u-tokyo.ac.jp/support/press/news/VOL12/No6/201011_gpgpu.pdf
http://www.cc.u-tokyo.ac.jp/support/press/news/VOL12/No1/201001gpgpu.pdf
http://ameblo.jp/xcc/entry-10799610964.html
http://www.bohyoh.com/CandCPP/FAQ/FAQ00046.html
http://kmotk.jugem.jp/?eid=89
http://d.hatena.ne.jp/oho_sugu/20100928/1285685048
http://sssiii.seesaa.net/category/15158044-1.html
http://sssiii.seesaa.net/article/309874057.html


%href
HCLSetKernel
;--------

%index
HCLDoKrn1
一次元でカーネル実行

%prm
int p1,int p2,int p3
int p1 : カーネルid			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]

%inst
work_dimが1の場合のHCLDoKernelと同じです。

p3が0の場合、グローバルワークアイテムをどのようにワークグループに分割するかは OpenCL 実装が決定します。

■この命令を使う前に
LV3	HCLDoKrn1～3を利用したOpenCL
OpenCL（GPGPU）の初期理解を補助するためにレベルを３段階に分けておりましたが
HCLDoKrn1～3はLV3となっております。

この段階で通常のOpenCLと同じレベルの処理を行います。
この段階までこられた場合は通常のサイトなどご参考なられるようお願い致します。



%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3

;--------


;--------

%index
HCLDoKrn1_sub
一次元でカーネル実行

%prm
int p1,int p2,int p3
int p1 : カーネルid			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]

%inst

この命令ではglobal_work_sizeがlocal_work_sizeで割り切れない場合、エラーを出さずにカーネルを2回に渡り実行するものです。

HCLDoKrn1ではglobal_work_sizeがlocal_work_sizeで割り切れなければいけませんでした。
もしlocal_work_sizeに0を指定してOpenCL実装にまかせても、global_work_sizeが素数の場合local_work_sizeが1にされてしまうことがあり、この場合計算が非効率になってしまいます。

この命令では1回目にlocal_work_sizeで割り切れる分だけのglobal_work_sizeを実行し、2回目にあまりの端数＝local_work_size＝global_work_sizeとして実行します。このとき「get_global_id(0)」が続きから始まるようになっています。
ただし「get_group_id(0)」の値は0になってしまいます。

p3に0は指定できません。

%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3

;--------




%index
HCLDoKrn2
ニ次元でカーネル実行

%prm
int p1,int p2,int p3,int p4,int p5
int p1 : カーネルid			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : local_work_size.0		[in]
int p5 : local_work_size.1		[in]
%inst
work_dimが2の場合のHCLDoKernelと同じです。

p4が0の場合、グローバルワークアイテムをどのようにワークグループに分割するかは OpenCL 実装が決定します。

%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn3

;--------

%index
HCLDoKrn3
三次元でカーネル実行

%prm
int p1,int p2,int p3,int p4,int p5,int p6,int p7
int p1 : カーネルid			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : global_work_size.2		[in]
int p5 : local_work_size.0		[in]
int p6 : local_work_size.1		[in]
int p7 : local_work_size.2		[in]

%inst
work_dimが3の場合のHCLDoKernelと同じです。

p5が0の場合、グローバルワークアイテムをどのようにワークグループに分割するかは OpenCL 実装が決定します。

%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2

;--------

%index
HCLWaitTask
タスク待ち

%prm

%inst

HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer(ブロッキングモードoffの場合)
HCLReadBuffer(ブロッキングモードoffの場合)
の命令にてキューにたまったタスクが全て終わるまで、CPUは次の命令に移りません。


%href
HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
;--------

%index
HCLReleaseKernel
カーネル破棄

%prm
int p1
int p1 : カーネルid			[in]

%inst

登録カーネルを破棄します。

%href
HCLCreateKernel
;--------

%index
HCLReleaseProgram
プログラム破棄

%prm
int p1
int p1 : プログラムid			[in]
%inst

登録コンパイル済みプログラムを破棄します。

%href
HCLBuildProgram
;--------