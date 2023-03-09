;------------------------
;   カーネル関連
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
OpenCLカーネル関連

%port
Win

;-------- ref --------

%index
HCLCreateProgram
カーネルプログラムのビルド

%prm
(str p1,str p2)
str p1 : カーネルソースファイル名 	[in]
str p2 : ビルドオプション,省略可	[in]

%inst
プログラムidが64bit int型で返ります。
p1にはソースのファイル名を入れて下さい。
p2にはビルドオプションを入れてください。
例："-D SCALE=111"

コンパイルされたOpenCLカーネルプログラムは、そのデバイス上でしか使えません。
２つ以上のデバイス上で同じカーネルを実行したいとき、それぞれのデバイスidをHCLSetDeviceでセットしなおしてHCLCreateProgramを実行して下さい。

%href
HCLCreateProgramWithSource
HCLSetDevice
HCLCreateKernel
HCLReleaseProgram

;-------- ref --------

%index
HCLCreateProgramWithSource
カーネルプログラムのビルド

%prm
(str p1,str p2)
str p1 : カーネルソース文字列		[in]
str p2 : ビルドオプション,省略可	[in]

%inst
プログラムidが64bit int型で返ります。
p1にはソースのデータを入れて下さい。
p2にはビルドオプションを入れてください。
例："-D SCALE=111"

コンパイルされたOpenCLカーネルプログラムは、そのデバイス上でしか使えません。
２つ以上のデバイス上で同じカーネルを実行したいとき、それぞれのデバイスidをHCLSetDeviceでセットしなおしてHCLCreateProgramWithSourceを実行して下さい。

%href
HCLCreateProgram
HCLSetDevice
HCLCreateKernel
HCLReleaseProgram

;--------
%index
HCLGetProgramBinary
プログラムバイナリ作成

%prm
(int64 p1)
int64 p1 : プログラムid		[in]

%inst
バイナリ文字列がstr型で返ります。

改行コードがCR LFではなく、LFのみの文字列になっている点に注意してください。

%href
HCLCreateProgramWithSource
HCLCreateProgramWithBinary
;--------
%index
HCLCreateProgramWithBinary
プログラムバイナリからプログラム作成

%prm
(str p1,str p2)
str p1 : プログラムバイナリ文字列	[in]
str p2 : ビルドオプション,省略可	[in]

%inst
プログラムidがint64型で返ります。
p1にはソースのデータを入れて下さい。
p2にはビルドオプションを入れてください。
例："-D SCALE=111"

コンパイルされたOpenCLカーネルプログラムは、そのデバイス上でしか使えません。
２つ以上のデバイス上で同じカーネルを実行したいとき、それぞれのデバイスidをHCLSetDeviceでセットしなおしてHCLCreateProgramWithBinaryを実行して下さい。

%href
HCLGetProgramBinary
HCLCreateProgramWithSource
;------------

%index
HCLCreateKernel
カーネル作成

%prm
(int64 p1,str p2)
int64 p1 : プログラムid		[in]
str p2 : カーネル関数名		[in]

%inst
カーネルidが64bit int型で返ります。

p2はp1カーネルソース内にある「__kernel 」から始まる関数名を「__kernel 」より後の文字列で指定します。
例えばp1ソース内に「__kernel void vector_add(__global float *A) {}」という行があればp2は "vector_add" を指定します。
以降、変数のセットや計算はこのカーネルidという形で管理、実行できます。

%href
HCLSetDevice
HCLReleaseKernel
HCLSetKernel
HCLSetKrns

;--------

%index
HCLSetKernel
カーネルセット

%prm
int64 p1,int p2,p3,int p4
int64 p1 : カーネルid			[in]
int p2 : 引数の順番p(x)の指定		[in]
    p3 : 引数に渡す実体(定数やcl_mem_id)[in]
int p4 : ローカルメモリフラグ,省略可	[in]
%inst
カーネルの引数一つ一つにデータを渡します。

HCLDoKernelで計算する前にこれでカーネルの引数を予めセットしておかなければいけません。


例えばカーネル側のソースが

__kernel void vector_add(__global int *array1,int arg2) {}

というものなら
HCLSetKernel p1,0,cl_mem_id_A	//(←HCLCreateBufferで作成したcl_mem_id)	;配列
HCLSetKernel p1,1,5	//引数2
と2回に渡り指定します。

p2は、vector_addの引数の一番左を0番として考えます。

１回セットすれば次セットし直すまで適応され続けます。
p3には32bit int型、64bit int型、文字列型変数、double型、float型変数が指定できます。

p4を0以外にすると、その引数はローカルメモリ（共有メモリ）として登録されます。ローカルメモリはグローバルメモリより容量が少ない分高速にアクセスが可能な書込読取可能メモリです。
一つのワークグループ内でしか値を保持できません。初期値は設定不可で0または不定です。
並列計算中、他のスレッドと情報を共有したいときに使います。以下参照。
p4が0以外のとき、p4には確保したいローカルメモリサイズ(byte)をintで指定して下さい。p3は無視されます。


ローカルメモリの使い方は以下のとおりです

例
カーネルコード
__kernel void vector_add(__global double *A, __global double *B, __local double block[] , int b, int n) {
	block[0]=1;//共有メモリの0番目に1を代入
・・・・・

に対するHSPスクリプトでのHCLSetKernelは
HCLSetKernel p1,0,cl_mem_id_dpA
HCLSetKernel p1,1,cl_mem_id_dpB
HCLSetKernel p1,2,0,64 (←p3には0を指定、p4は64byteつまりdouble型*8個の共有メモリを作れという意味、OpenCLカーネルソース内ではblock[0]～block[7]が同じワークグループ内で共有して使える)
HCLSetKernel p1,3,10
HCLSetKernel p1,4,1024



%href
HCLSetDevice
HCLCreateKernel
HCLSetKrns
HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3

;--------

%index
HCLSetKrns
カーネルセット

%prm
int64 p1,p2,,,,,
int64 p1 : カーネルid				[in]
p2以降 : 引数に渡す実体(定数やcl_mem_id)	[in]

%inst
カーネルの引数をまとめて指定します。

HCLSetKernel p1,0,cl_mem_id_dpA
HCLSetKernel p1,1,cl_mem_id_dpB

なら

HCLSetkrns p1,cl_mem_id_dpA,cl_mem_id_dpB

となります。
なおローカルメモリのサイズ指定はできません。

%href
HCLSetDevice
HCLCreateKernel
HCLSetKernel
HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3

;--------

%index
HCLGetKernelName
カーネル名取得

%prm
(int64 p1)
int64 p1 : カーネルid			[in]

%inst
カーネルの名前を文字列で返します。

%href
HCLCreateKernel
;--------

%index
HCLCall
カーネル文字列実行

%prm
str p1,int p2,int p3,p4,p5,p6,,,,,
str p1:カーネル文字列				[in]
int p2:グローバルサイズ(1次元並列処理数)	[in]
int p3:ローカルサイズ(1次元並列処理数)		[in]
p4以降:引数に渡す実体(arrayやvar intなどの数値)	[in,out]
%inst

HCLCreateProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBufferをせずカーネルを実行して結果を得ます。
例えば以下のカーネルコードで
__kernel void sample(__global int* A)
{
    uint gid = get_global_id(0);
    A[gid]=12345;
}

A[]に値を書き込む処理を書いて実行すると、p4に指定したHSP配列変数に12345が書き込まれます。

p1にはソースコードの文字列
p2にはグローバルサイズ（実行したい並列処理数）
p3にはローカルサイズ
p4以降にはカーネルに渡す引数を指定して下さい。

p4以降の引数の数とOpenCLカーネル内の引数の数が合わないとエラーになります。


この命令はプラグイン内部でHCLCreateProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer,HCLWriteBuffer,HCLReadBuffer,HCLReleaseKernel,HCLReleaseProgram,HCLReleaseBufferを使用しています。
この命令で確保したVRAM等は、この命令が終わるまでに必ず破棄されます。
HCLDoKernelと違い、タスクが完了するまで次の命令にうつりません。

HCLCallやHCLCall2では第一引数の入力文字列がプラグイン内部でハッシュ化され保存されており、全く同じ文字列の場合、前回のビルドを自動で使いまわすことができるようになっています。
つまり毎回カーネルソースをコンパイルしているわけではないので高速です。

しかしHCLCallでは他の部分の命令のオーバーヘッドも大きいので、速度が求められる場合には向きません。

OpenCL全体のより詳細な解説はHCLDoKernelを参照下さい。

%href
HCLDoKernel
HCLCall2
HCLDokrn1
HCLDokrn2
HCLDokrn3
;--------

%index
HCLCall2
カーネル文字列実行

%prm
str p1,int p2,int p3,p4,p5,p6,,,,,
str p1:カーネル文字列				[in]
int p2:グローバルサイズ(1次元並列処理数)	[in]
int p3:ローカルサイズ(1次元並列処理数)		[in]
p4以降:引数に渡す実体(arrayやvar intなどの数値)	[in,out]
%inst

HCLCreateProgram,HCLCreateKernel,HCLSetKernelをせずカーネルを実行して結果を得ます。
HCLCall2では、今までHCLCallでHSP配列変数を指定していたところにCL_mem_idを指定します。

p1にはソースコードの文字列
p2にはグローバルサイズ（実行したい並列処理数）
p3にはローカルサイズ
p4以降にはカーネルに渡す引数を指定して下さい。

p4以降の引数の数とOpenCLカーネル内の引数の数が合わないとエラーになります。

この命令はプラグイン内部で内部でHCLCreateProgram,HCLCreateKernel,HCLSetKernelを使用しています。
HCLCallと違いタスクが完了する前に次の命令にうつります(ブロッキングモードoff)。

HCLCallやHCLCall2では第一引数の入力文字列がプラグイン内部でハッシュ化され保存されており、全く同じ文字列の場合、前回のビルドを自動で使いまわすことができるようになっています。
つまり毎回カーネルソースをコンパイルしているわけではないので高速です。
ただHCLDokrn1,2,3命令のように引数指定と分離できてるわけではないので、細かいことを言えば引数指定の分オーバーヘッドはどうしてもあります。

OpenCL全体のより詳細な解説はHCLDoKernelを参照下さい。

%href
HCLDoKernel
HCLCall
HCLDokrn1
HCLDokrn2
HCLDokrn3

;--------

%index
HCLDoKernel
カーネル実行

%prm
int64 p1,int p2,array p3,array p4,int p5
int64 p1 : カーネルid			[in]
int p2 : work_dim(1～3)			[in]
array p3 : global_work_size		[in]
array p4 : local_work_size		[in]
int p5 : event_id,省略可		[in]
%inst

p1には実行したいカーネルid
p2には1～3 (work_dim＝グローバルワークサイズとローカルワークサイズの次元)
p3には次元数に応じたグローバルワークサイズ(並列処理数)を格納した変数
p4には次元数に応じたローカルワークサイズを格納した変数
を指定してください。

p4の変数の内容が0の場合、ローカルワークサイズは自動的に決定されます。

p5はevent_idで-1～65535の値を指定できます。省略時デフォルトでは-1です。
カーネルの実行状態を取得するにはeventを記録する必要があり、0～65535のときそのevent番号とカーネルが紐付けされます。
以降、その番号でevent内容の取得(実行状況、実行開始時間、実行終了時間など)が行えます。
番号の上書きもできますが、上書きされる前のevent情報は破棄されます。

この命令自体は実行が完了するまで待つ命令ではなく、OpenCLコマンドをキューに入れるだけであり、実際のカーネルの実行終了を待つにはeventを使うかHCLFinish等で待つことになります。
これは一見複雑なように思えますが、GPUが計算している最中にCPUが別のタスクに処理を回せるという利点があります。

■HCLDoKernelについて
この命令はOpenCLの入門用として、また簡易にOpenCLを利用できることを目的に作成した命令です。
HCLCallでは自動的に処理していた「HSPで用意した配列変数をVRAM等に移す処理」「スレッドの次元設定」を
自ら設定しなければなりません。
しかし設定できる部分が少ないHCLCallと比較して処理の高速化や自由度の高いことが可能になります。


HSPユーザーとしてHCLDoKernel（OpneCLプラグイン）を利用する時、理解の上で躓きやすい点をリストアップしました。
そのためにOpenCLを利用する上での独特な処理を説明します。

	1.OpenCL用の命令ソースを別途用意する必要がある。（「OpenCL C」という。VecAdd.clなど）
	そしてそのファイルをHSP上で固有の命令（HCLCreateProgram）で読み込み。
	これによりProgramオブジェクトが生成される。これは64bitプラグインではint64型、32bitプラグインではint型の数値で表される。

	2.そのProgramオブジェクトから「カーネル」と言われる命令単位を抽出する。HSP上で固有の命令（HCLCreateKernel）で作成する。
	これによりKernelオブジェクトが生成される。これは64bitプラグインではint64型、32bitプラグインではint型の数値で表される。

	3.GPU上のメモリの配列を確保する。HSP上で固有の命令HCLCreateBufferにて作成する。
	これによりCL_memオブジェクトが生成される。これは64bitプラグインではint64型、32bitプラグインではint型の数値で表される。
	
	4.CPU→GPUにデータ転送する。
	HCLWriteBufferを使いHSP配列をCL_mem idのさすGPUメモリへ転送する。
	
	5.カーネル関数へ引数をセットする。
	Kernelオブジェクトと、CL_memオブジェクトのidを使って、HCLSetKernel命令で引数セットをおこなう。

	6.カーネルを固有の命令（HCLDoKernel）で実行。

	7.そして計算結果が入ったCL_memオブジェクトを参照する時はHSP上の固有の命令（HCLReadBuffer）でデータをHSP配列に戻す。
	続けてGPUで計算する場合は必要ない。
	
	
このような処理が必要となるのはホスト側（CPU側）とデバイス側（GPU側）の処理/メモリ管理が別個となっているからです。
なお便宜上GPU側と書いていますが、OpenCLデバイスがIntel CPUやAMD CPUの場合もありえます。その場合でもメモリ管理が別個であることは変わりないです。


■NDRange(インデクス空間について)
GPGPUプログラミングにおいて、グローバルワークサイズやローカルワークサイズはとても重要な概念になってきます。
OpenCLだけでなくCUDAやComputeShaderでも同じ考え方をします。


html{
<img src="./doclib/HSPCL64/thumbs/d22.png">
}html


この図全体がNDRange
(HCLDoKernel kernel_id,2,[4,6],[2,3] で実行したときを想定)

NDRange サイズ Gx＝global_work_size[0]＝グローバルワークアイテムxのサイズ＝この図だと4
NDRange サイズ Gy＝global_work_size[1]＝グローバルワークアイテムyのサイズ＝この図だと6

ワークグループサイズSx＝local_work_size[0]＝ローカルワークアイテムxのサイズ＝この図だと2
ワークグループサイズSy＝local_work_size[1]＝ローカルワークアイテムyのサイズ＝この図だと3

ワークアイテム＝スレッド＝この図で言うと24個ある水色の箱。

赤枠内の黄色いところ(ワークグループ内)で共有メモリが使えます。
「VRAM」と「共有メモリ」は違います。

VRAM＝ビデオメモリー＝デバイスメモリー＝グローバルメモリー＝GDDR6（アクセス一番遅い）＝カーネルソースで__globalで指定した変数
共有メモリー＝１次キャッシュ＝ローカルメモリー（少し早い）＝カーネルソースで__localで指定した変数
プライベートメモリー＝レジスタ（一番早い）＝カーネルソースで何も指定しなかった時の変数(uint ic とかはこれをさしている)

プログラマはOpenCLでデータ並列処理を行うためにインデクス空間の次元数、ワークサイズの総数、ローカルサイズを指定することでインデクス空間を定義しなければなりません。(後述)

以下にOpenCL Cでのグローバルidなどの使い方について記載します。

例
work_dim=2
global_work_size=4,6
local_work_size=2,3
を指定したとします。

html{
<img src="./doclib/HSPCL64/thumbs/d22.png">
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
スレッドは24個並列作動しますがそれぞれを見分けるidがあり、それがget_global_idで取得できます。

get_global_id(0)は0～3を
get_global_id(1)は0～5をそれぞれのワークアイテムに返します。（以下の図参照）

get_local_id はワークグループ内の識別idを返します。
get_local_id(0)は0～1を
get_local_id(1)は0～2をそれぞれのワークアイテムに返します。（以下の図参照）

get_group_idはワークグループのグループ識別番号を返します。
get_group_id(0)は0～1
get_group_id(1)は0～1をそれぞれのワークアイテムに返します。（以下の図参照）

get_global_sizeはグローバルサイズで、どのワークアイテムでも返す値は同じ値で
get_global_size(0)は6
get_global_size(1)は3
となります。

get_local_sizeはローカルサイズで、どのワークアイテムでも返す値は同じ値で
get_local_size(0)は2
get_local_size(1)は3
となります

get_num_groupsはグループ数で、どのワークアイテムでも返す値は同じ値で
get_num_groups(0)は3
get_num_groups(1)は1
となります


以下、24スレッドの各値の図

html{
<img src="./doclib/HSPCL64/thumbs/d2.png">
}html

-----------------------------------------
おさらい
・global_work_size
・local_work_size
・ワークグループ
・ワークアイテム
の定義を覚えましょう。
それぞれwork_dim=1,2,3によって次元が1,2,3と変わります。

work_dim=1とすると
ワークアイテム数=global_work_size[0]
ワークグループ数=global_work_size[0]/local_work_size[0]
です。

OpenCL Cで使える関数で、自スレッドを識別するための関数があります。
get_global_id()
get_local_id()
get_group_id()
get_global_size()
get_local_size()
get_num_groups()
-----------------------------------------


■global_work_sizeの指定
並列数を指定するものだと思ってください。
100要素の配列があって1スレッドが1つの要素にアクセスするような処理の場合、1次元100並列で動かすので、global_work_size[0]は100となります。

画像のようなデータに処理を施す場合は、2次元で256*256並列などということもできます。

■local_work_sizeの指定
先ほどのglobal_work_sizeをどのように分割するか、というのが直観的な説明かと思います。
つまり割り切れれば何でもいいわけですが、計算速度に直結するので重要な項目です。

結論から言うと64,128,256のどれかを指定すれば大丈夫でしょう。
global_work_sizeが半端な数で上記の数で割り切れない場合は、global_work_sizeを増やしてでも割り切れる数字にしたほうが良いです。


■詳細説明(難易度:高)
local_work_sizeの指定についてはいろんな前提知識からパズルのように組み合わせて決定している、といえます。
ちゃんと指定できるようになるにはNVIDIA、AMDの複数GPUのアーキテクチャの細かいところを暗記しなくてはいけません・・。
しかしこのlocal_work_sizeやwork_dimの次元の指定にいたるまで、OpenCLのみならずCUDAやComputeShaderでもほぼ同様の概念が採用されております。
ここを乗り越えられればCUDAやComputeShaderも初心者は超えているといえるでしょう。


●work_dimについて
上図で、work_dim=2,global_work_size=[4,6]の24並列について説明しました。
同じ24並列ならwork_dimを1にしてglobal_work_sizeを24にしてはダメなのかというと、実は全く問題ないです。
work_dimは1でも2でも3でも性能に全く影響しません。プログラマーの考えやすいように次元が3まで設定されているに過ぎなく、個人的なことを言えば私はメモリ配置が1次元に見えているのでwork_dimは常に1でコードを書いてます。

ようはプログラマーの好き嫌いで決定できる要素です。テクスチャなど二次元を考えるとき、work_dimが2の方が良いという人もいます。


●ワークグループとlocal_work_size、カーネルコード側の__globalと__localについて
続いてlocal_work_sizeですが、普通に並列処理をするだけならいらない要素です。しかしこれを指定しないといけない理由があります。
それは主に一つだと思っています。

・1つのワークグループは必ず内部で共有メモリを共有できるようになっている

困ったことに、共有メモリを使わなくてもこのlocal_work_sizeの指定が必須となっています。

共有メモリについては少し後で説明しますが、例えば上図のようlocal_work_sizeを[2,3]と指定すると、4つのワークグループ(赤枠の四角)が生成され、1つのワークグループあたり6スレッドです。6スレッドで共有メモリを共有できることになります。
またlocal_work_sizeを[4,6]と指定することもできます。その場合ワークグループのサイズも4*6になり24スレッドすべてで共有メモリを共有することができます。

HSPCL64で共有メモリを扱っているサンプルに「3_13奇数偶数分けその2共有メモリサンプル.hsp」があります。
これはglobal_work_sizeが65536でlocal_work_sizeが256です。この.clを見てみると

	kisublock[lid]=kisu;
	gusublock[lid]=gusu;

と書いてあり、lidはワークグループ内の自分スレッドのidをあらわしています。
kisublockとgusublockという共有メモリにアクセスしていることがわかります。
そしてこの共有メモリは各ワークグループごとに中身が違うと思って下さい！(重要)

__kernel void wake(__global int *mema,__local int kisublock[],__local int gusublock[],__global int *memb,__global int *memc) {
	int ic = get_global_id(0)*64;
	int lid= get_local_id(0);//ローカルid取得=0～255のどれか
	int gid= get_group_id(0);//グループid取得=0～255のどれか

最初の部分ですが、lidが同じでもそれぞれのワークグループが見ている共有メモリは違うのです。
例えばgid=0のワークグループにlidが0～255までのスレッドが存在します。gid=1のワークグループにもlidが0～255までのスレッドが存在します。同じlidで異なるgidのスレッドではgusublock[lid]に書き込んでいる値が異なります。

一方__global int *memaのほうはグローバルメモリですので、どのワークグループからみても同じデータが入っています。
これが__localと__globalの違いです。


そして「共有メモリを各ワークグループごとに個別に共有できている状況」を作り出すのにlocal_work_sizeの指定が必要なのです。この例ではlocal_work_size=256とすることで1つのワークグループが256個のスレッドを持ち、それが同じ共有メモリを共有できています。


一旦、ここまではわかりますか？
とりあえず、local_work_sizeを何の目的のために指定するかは少しわかったかと思います。

しかしlocal_work_sizeは何でも指定していいわけではなくかなりきつい制約があります。


●CUDA Core,PEの概念とWarp,WaveFrontの概念とSM,CUの概念
ここからはいっそう難しいハードウェアの話になります。
大変ですがlocal_work_sizeの指定によっては性能がクリティカルに変わってくることもあり、理論を押さえておきたいところでもあります。

まず用語について整理すると


・CUDA CoreはNVIDIA用語
・PEはAMD用語
概念は両者一緒

・WarpはNVIDIA用語
・WaveFrontはAMD用語
概念は両者一緒

・SMはNVIDIA用語
・CUはAMD用語
概念は両者一緒


です（これでも大雑把ですが・・・）
今はCUDA Coreの集まったものがSM、SMの集まったものがGPUという認識で良いです。

続いて重要なことなので先に書いておくと
1つのワークグループは1つのSMで実行されますが、1つのSMは同時に1つのワークグループしか実行しないわけではありません。
つまり、SMに搭載されているレジスタや共有メモリの量的に、同時に2つのワークグループを実行可能な場合は2つ実行します（正確には「する可能性があります」）。
https://x.momo86.net/article/149より抜粋改変

また大前提の知識となりますが、

	GPUはたくさん計算コア=CUDA Coreを持っているが、すべてが同期しながら動いているわけではない

ということがあります。CPUも各コアで周波数が違うことがあるのと同じです。
かといって全ての計算コアがばらばらに動いているかというと、そうでもありません。（この解答はWarp、WaveFrontの項目に書いてあります）

●GPUハードウェア構造
NVIDIAのGPUを例にだします。GPUはSM(streaming multiprocessor)という単位の回路を大量に持ちます。
画像だと16基持ちます。(Fermi Overview画像)
(https://pc.watch.impress.co.jp/docs/column/kaigai/318463.htmlより転載)

html{
<img src="./doclib/HSPCL64/fermioverview.jpg">
}html


次にSMの中身を見てみます。
共有メモリはSM内に実装されているものです。(画像 共有メモリは下の青い部分 64KB)

(https://en.wikipedia.org/wiki/Fermi_%28microarchitecture%29より転載)
html{
<img src="./doclib/HSPCL64/fermistreamingmultiprocessor.png">
}html


読み取ると、1つのSMに64KBのサイズの共有メモリ領域が用意されており、1つのSMにCUDA Coreが32個あるようです。CUDA Coreは1つで1clockに1つの積和演算が行えるものです。

HCLDoKernel命令でwork_dim=1、global_work_size=32、local_work_size=32として実行した場合、1つのワークグループが生成され、そのワークグループは必ず1つのSM内で実行されます。
32スレッドはこのshared memoryに物理的にアクセスすることができると見た目からも想像できます。

逆に別のところにあるSMのshared memoryは仕切りがあるため物理的に遠く、アクセスするのが大変であることが想像できます(事実上できません)。

local_work_sizeの指定は、任意のスレッド数からなる1つのワークグループが、1SM内で実行されるように仕向けるための操作だと思って下さい。

今度は並列数をもっと増やしたときのことを考えます。(話を簡単にするために今はWarpの概念はないとします。)
カーネルコードに

d=a*b+c;

という積和演算を1行書いていたとして、

global_work_size=512、local_work_size=512

で実行すると積和演算を1SMで512回おこなう必要がありますが32個しかCUDA Coreがないので16clockに分けて実行されます。
つまりglobal_work_size=32、local_work_size=32のときと比べ単純に16倍時間がかかることになります。(*1)

ここでGPUにSMが16基あることを思い出すと、まだ1SMしか使っていないのでこれは非効率です。
global_work_size=512、local_work_size=32とすると、16個のSMでそれぞれワークグループが立ち上がりGPU全体で1clockで512個の積和演算が並列に行われると期待できます。

local_work_sizeの指定のしかたのコツはこういったところにあります。

実際どのSMにどのワークグループを割り当てるかはプログラマーが指定できないので、ちゃんと16SMに均等に割り当てられるかは運になりますが、今までの経験からけっこう均等に采配されている印象です。

local_work_sizeの最大値が決まっているのはGPUによって、この1SMあたりに扱えるスレッド数に限界があるからです。

ややこしいのは「1SMあたり扱えるスレッド数」というハードウェアの限界と、「local_work_sizeの設定できる最大値」はまた違うということがありますが、まぁ同じようなものと考えてよく、概ねlocal_work_sizeのほうは1024くらいの値になります。


ここまでの説明でどこまで理解できましたでしょうか？(絶対難しいですよね・・)

まだWarp、WaveFrontについて説明してませんね・・・。
その前に一旦おさらいします。

-----------------------------------------
おさらい

1SMあたり32CUDA Coreあり、16SMを備えるGPUでコードを動かすことを考えます(まだWarpの概念はないとします)

global_work_size=512と決定したとき、並列処理で一番効率がいいのは1SMあたり32個のスレッドを起動したときです。
したがってlocal_work_size=32とするのが最適です。

global_work_size=1024と決定したとき、並列処理で一番効率がいいのは1SMあたり32個or64個のスレッドを起動したときです。
したがってlocal_work_size=32 or 64とするのが最適です。
どちらを選択しても、トータルで1CUDA Coreあたり2つのスレッドの処理を担当することになります。
なぜならlocal_work_size=32のとき
16SMに32個のワークグループが割り当てられるので1SMあたり2ワークグループ処理するためです。

global_work_size=65536と決定したとき、並列処理で一番効率がいいのは1SMあたり32個or64個or128個or256個or512個or1024個のスレッドを起動したときです。それぞれのパターンで2048,1024,512,256,128,64個のワークグループが生成され、それが16SMで均等に割りきれるためです。
-----------------------------------------
*1:話を簡単にするために16倍と言いましたが、積和演算の命令レイテンシを考慮しない場合の話です。


●Warp、WaveFront
これについては、私のブログでUnityユーザーに向けた記事でかかれているのでこれが参考になるかもしれません。
https://toropippi.livedoor.blog/archives/52915698.html
「グループスレッド数」を「local_work_size」に読みかえてください。

一応抜粋すると


Warp
・NVIDIAのGPUでは32スレッド分を1まとまりの単位として実行する。その単位がWarp
・Maxwell,Pascalアーキテクチャでは32スレッドを32CUDA Coreが1cycleで実行する
・Fermi,Kepler,Volta,Turingアーキテクチャでは32スレッドを16CUDA Coreが2cycleで実行する
・16 or 32のスレッドが同じタイミングで同じ行のプログラムを実行する


Wavefront
・AMDのGPUでは64スレッド分を1まとまりの単位として実行する。その単位がWavefront
・64スレッドを16PEが4cycleで実行する(PE=CUDA coreみたいなもん)
・16スレッドが同じタイミングで同じ行のプログラムを実行する


です。
アーキテクチャ名でわかりにくいでしょうけど、これで主要GPUはほぼ網羅しています(2020年現在)。

まだ意味不明だと思いますのでWarpの説明に追加します。
local_work_sizeとWarpの関係は

Warp数=local_work_size/32 (端数は切り上げ)

となっています。これは1つのワークグループ内で動くWarp数をかぞえています。
同じく

WaveFront数=local_work_size/64 (端数は切り上げ)

です。

local_work_sizeに1を指定しても32を指定してもWarpは1つ立ち上がります。
local_work_sizeに256を指定すると8Warp立ち上がります。
local_work_sizeに255でも8Warp立ち上がります。(1スレッド分は無効化されます)
local_work_sizeが[2,3]の二次元だった場合1Warp立ち上がり32-2*3=26スレッド分は無効化されます。

そしてこの1Warpは1SM内のCUDA Core 16 or 32個を使って2 or 1cycle単位で動きますよ、ということです。
ということはglobal_work_size=10、local_work_size=1とするとまずワークグループが10個生成され、1ワークグループあたり1スレッドですがこの1スレッドに対し1Warp立ち上がります(31スレッド分は無効化)。各ワークグループは別SMで実行される可能性があるので10ワークグループのをまとめて1Warpとはできないのです。
10Warp×31スレッド分無効化なのでとんでもない無駄が生じることがわかるかと思います。


他にも例をあげるので考えてみて下さい。

例えばFermiアーキテクチャのGPU(上の図と同じもの)、NVIDIA GTX580などになりますが、1SMに32CUDA Coreがあって、その32が16+16という具合に分かれています。
この1つの16が2cycleかけて1つのWarpを処理します。
global_work_size=32でlocal_work_size=32としたとき、SM内で何が起こるかというと、まずこのlocal_work_sizeの32が1Warpに相当します。この1Warpが16個のCUDA Coreで2cycleかけて実行されます。残りの16CUDA Coreでは何も計算しません。

なのでどうあがいても1cycleで計算を終わらすことができないし、SMの性能を使い切ることもできないです。

もしglobal_work_size=64でlocal_work_size=64としたとき、SM内で何が起こるかというと、まずこのlocal_work_sizeの64が2Warpに相当します。
16のCUDA Coreが1つのWarpを担当し、残りの16のCUDA Coreがもう1つのWarpを担当することで、トータル2cycleで32CUDA Coreを使い64回の演算が実行されます。
これではじめてSMの性能を使い切ることができました。

global_work_size=64でlocal_work_size=32としたときは、同じSMか別々のSMで2つのWarpが2cycleで実行されます。同じSMで2Warpなら、先程と同じよう1つのSM内で稼働率100%です。そうでない場合は、2つのSMで稼働率50%という状況になります。


このように考えます。


つまりFermiでは1SM=32Coreで16SMを持つGPUの全性能を使い切るには最低でもglobal_work_sizeが1024必要です。
実際には(*1)の話やもっと複雑な理由(*2)などがあり、この5-30倍くらいのglobal_work_sizeがないとGPUの全性能を出せないのですが。
また、GPUによってSM数は変わります。世代やアーキテクチャによって1SMあたりのCUDA Core数も変わります。

HSPCL32N,64を使ってexeファイルを作って配布することなどを考えると、非常に多くの種類のGPUで実行されることが考えられます。すべてのパターンで完璧に性能を使い切るのはできないですが、パズルのように組み合わせて考えるとlocal_work_sizeは64,128,256あたりかなというのが私の個人的な結論です。


逆説的にglobal_work_sizeを64,128,256の倍数にできないときは、よく考えたほうがいいです。
global_work_size=10000だからlocal_work_size=100だとすると、100=32+32+32+4となり4Warpのうち1つのWarp実行が非常に非効率になります。
だったらglobal_work_sizeを64の倍数である10048にかさ増しして、48個を無効化したほうがまだマシです。


*2:メモリアクセスに伴うレイテンシがあります。計算よりもメモリにアクセスするほうがよっぽど時間がかかることが多いです。300cycleとか。そのメモリアクセスレイテンシを隠蔽するために、1SM内で20個～などの多くのWarpを立ち上げて、あるWarpがメモリアクセスによりとまっている最中、別のWarpを稼働させてCUDA Core等の演算稼働率を100%に近づけることが重要になります。そのためになるべく多くのWarpを立ち上げておいたほうがよいです。最大で1SMあたりどのくらいWarpを稼働できるかはGPUごとに上限が決まっており、そのうち実際どのくらい稼働しているかをCUDA用語でOccupancy(占有率)とよびます。


●アーキテクチャまとめ
最後に、アーキテクチャの名前では実感がわかないかもしれませんので一応、

NVIDIAでは
GTX 580:Fermi
GTX 680:Kepler
GTX 980:Maxwell
GTX1080:Pascal
RTX2080:Turing
RTX3080:Ampare

の関係であり、概ね1000番台はPascal、2000番台はTuringという感じの理解でよいです。(例外もある)

各アーキテクチャが1Warpを何サイクルで実行できるかは私のブログにまとめています。
https://toropippi.livedoor.blog/archives/52485283.html

NVIDIA GPUに関しては、CUDAプログラミングガイドのオンラインドキュメントをよーく探すと同じことが書いてあります。
AMD GPUはいろいろ情報を探さないと見つかりません。Intelは・・・


●答えはない
以上の説明はあくまで私の考えをまとめたものなので、local_work_sizeをいくつにすべき、という答えはないものだとは思います。
究極的にはlocal_work_sizeを全パターン試して最速のを採用するのが良いです。



■使用注意
(1)
一部のGPUでは、グローバルワークサイズはローカルワークサイズで整除できなければいけません。(おそらくOpenCL 2.0未満のGPU)
dim globalsize,3
dim localsize,3
globalsize=2048,2048,7
localsize=8,8,4
であった場合、globalsize.2はlocalsize.2で割り切れないためにエラーとなります。
エラーの場合
「global_work_sizeがlocal_work_size で整除できない、またはlocal_work_size[0]*local_work_size[1]*local_work_size[2]が、一つのワークグループ内のワークアイテム数の最大値を超えた」
というメッセージが出ます。


■カーネルソースについて
(1)
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
&	ポインタとして利用
*	ポインタとして利用
->	間接メンバ参照演算子
他多数・・・

(2)
使える代表的な型
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

(3)
型変換
uint a;
uchar b=1;
a=b;//これでもいいが
a=(uint)b;//このほうが不具合を防げる

同じく
float ftmp;
int i0=123;
ftmp=(float)i0;//ftmpには123.0000が代入される

(4)
関数
「__global 」はVRAM上の変数を使うという意味
「__local」はローカルメモリ上の変数を使うという意味

(5)
使える関数、命令、演算子など詳細に知りたい方は
https://www.khronos.org/files/opencl-quick-reference-card.pdf
へ


■最後に
これだけではまだ理解できないかと思いますが、本プラグイン付属のサンプルのコメントや、ドキュメントも読んでいただけたらなと思います。
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
https://pc.watch.impress.co.jp/docs/column/kaigai/318463.html


%href
HCLSetKernel
HCLSetKrns
HCLCall
HCLDokrn1
HCLDokrn1_sub
HCLDokrn2
HCLDokrn3

;--------

%index
HCLDoKrn1
一次元でカーネル実行

%prm
int64 p1,int p2,int p3,int p4
int64 p1 : カーネルid			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]
int p4 : event_id,省略可		[in]

%inst
動作はwork_dimが1の場合のHCLDoKernelと同じです。

p3が0の場合、グローバルワークアイテムをどのようにワークグループに分割するかは OpenCL 実装が決定します。
p4はevent_idで-1～65535の値を指定できます。省略時デフォルトでは-1です。

■この命令を使う前に
OpenCL全体のより詳細な解説はHCLDoKernelを参照下さい。

%href
HCLDoKernel
HCLCall
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLSetKernel
HCLSetKrns
;--------


;--------

%index
HCLDoKrn1_sub
一次元でカーネル実行

%prm
int64 p1,int p2,int p3,int p4
int64 p1 : カーネルid			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]
int p4 : event_id,省略可		[in]

%inst

この命令ではglobal_work_sizeがlocal_work_sizeで割り切れない場合、エラーを出さずにカーネルを2回に渡り実行するものです。

HCLDoKrn1ではglobal_work_sizeがlocal_work_sizeで割り切れなければいけませんでした。
もしlocal_work_sizeに0を指定してOpenCL実装にまかせても、global_work_sizeが素数の場合local_work_sizeが1にされてしまうことがあり、この場合計算が非効率になってしまいます。

この命令では1回目にlocal_work_sizeで割り切れる分だけのglobal_work_sizeを実行し、2回目にあまりの端数＝local_work_size＝global_work_sizeとして実行します。このとき「get_global_id(0)」が続きから始まるようになっています。
ただし「get_group_id(0)」の値は0になってしまいます。
p3に0は指定できません。
p4のevent idは省略時デフォルトで-1で、0～65535の値を指定できますが記録されるのは「端数じゃない方のカーネル」のみです。

■この命令を使う前に
OpenCL全体のより詳細な解説はHCLDoKernelを参照下さい。

%href
HCLDoKernel
HCLSetKernel
HCLSetKrns
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3

;--------


%index
HCLDoKrn2
ニ次元でカーネル実行

%prm
int64 p1,int p2,int p3,int p4,int p5
int64 p1 : カーネルid			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : local_work_size.0		[in]
int p5 : local_work_size.1		[in]
int p6 : event_id,省略可		[in]
%inst
work_dimが2の場合のHCLDoKernelと同じです。

p4が0の場合、グローバルワークアイテムがどのようにワークグループに分割されるかは自動で決定されます。

■この命令を使う前に
OpenCL全体のより詳細な解説はHCLDoKernelを参照下さい。

%href
HCLDoKernel
HCLSetKernel
HCLSetKrns
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn3

;--------

%index
HCLDoKrn3
三次元でカーネル実行

%prm
int64 p1,int p2,int p3,int p4,int p5,int p6,int p7
int64 p1 : カーネルid			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : global_work_size.2		[in]
int p5 : local_work_size.0		[in]
int p6 : local_work_size.1		[in]
int p7 : local_work_size.2		[in]
int p8 : event_id,省略可		[in]

%inst
work_dimが3の場合のHCLDoKernelと同じです。

p5が0の場合、グローバルワークアイテムがどのようにワークグループに分割されるかは自動で決定されます。

■この命令を使う前に
OpenCL全体のより詳細な解説はHCLDoKernelを参照下さい。

%href
HCLDoKernel
HCLSetKernel
HCLSetKrns
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2

;--------

%index
HCLFinish
OpenCLコマンド待ち

%prm

%inst

同じコマンドキュー内に入れられたOpenCLコマンドの実行がすべて終わるまで待ちます。
ここで言うOpenCLコマンドとは
HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLFillBuffer
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
HCLBLAS_sT
HCLBLAS_dT
HCLBLAS_sgemv
HCLBLAS_dgemv
HCLBLAS_sdot
HCLBLAS_ddot
HCLBLAS_snrm2
HCLBLAS_dnrm2

の命令で発行したものになります。

%href
HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLFillBuffer
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
HCLBLAS_sT
HCLBLAS_dT
HCLBLAS_sgemv
HCLBLAS_dgemv
HCLBLAS_sdot
HCLBLAS_ddot
HCLBLAS_snrm2
HCLBLAS_dnrm2
HCLFlush
;--------

%index
HCLFlush
OpenCLコマンドを発行

%prm

%inst

HCLSetDeviceで指定しているデバイスのすべてのコマンドキューに入れられた全てのOpenCLコマンドを発行します。

ここで言うOpenCLコマンドとは

HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLFillBuffer
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
HCLBLAS_sT
HCLBLAS_dT
HCLBLAS_sgemv
HCLBLAS_dgemv
HCLBLAS_sdot
HCLBLAS_ddot
HCLBLAS_snrm2
HCLBLAS_dnrm2
の命令で発行したものになります。

%href
HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLFillBuffer
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
HCLBLAS_sT
HCLBLAS_dT
HCLBLAS_sgemv
HCLBLAS_dgemv
HCLBLAS_sdot
HCLBLAS_ddot
HCLBLAS_snrm2
HCLBLAS_dnrm2
HCLFinish
;--------

%index
HCLSetCommandQueue
コマンドキュー番号をセット

%prm
int p1
int p1 : コマンドキュー番号	[in]

%inst

HCLSetDeviceで指定しているデバイスのうち、使えるコマンドキューは0～3まであります。
デフォルトでは0です。
下記命令は指定したコマンドキューにOpenCLコマンドとして入り実行されます。

HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLFillBuffer

同じデバイスでも違うコマンドキューに入れられたOpenCLコマンドは、順不同で実行されます。
例えば同じメモリにデータを書き込むカーネルを別々のコマンドキューにいれて実行すると、カーネルが同時に実行される可能性があり、メモリにはそれぞれのカーネルが書き込んだ値が混在している可能性があります。
複雑で不便なように思いますが、OpenCLコマンドのオーバーラップ実行が可能になり、使い方によっては速度面で有利になります。

%href
HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLFillBuffer
HCLFlush
HCLFinish
HCLGetSettingCommandQueue
_ExHCLSetCommandQueueMax
_ExHCLSetCommandQueueProperties
;--------

%index
HCLGetSettingCommandQueue
セットしているコマンドキュー番号を取得

%prm
()

%inst
HCLSetCommandQueueでセットした番号を返します。
;--------
%index
HCLReleaseKernel
カーネル破棄

%prm
int64 p1
int64 p1 : カーネルid			[in]

%inst

登録カーネルを破棄します。

%href
HCLCreateKernel
;--------

%index
HCLReleaseProgram
プログラム破棄

%prm
int64 p1
int64 p1 : プログラムid			[in]
%inst

登録コンパイル済みプログラムを破棄します。

%href
HCLCreateProgram
;--------


%index
HCLDoXc
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
;--------


%index
HCLDoXi
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
;--------


%index
HCLDoXl
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
;--------


%index
HCLDoXf
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
;--------


%index
HCLDoXd
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
;--------


%index
HCLDoXuc
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
;--------


%index
HCLDoXui
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
;--------


%index
HCLDoXul
短縮記法カーネル実行

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:短縮記法カーネル文字列		[in]
p2以降:引数に渡す実体(arrayやvar intなどの数値)	[in]
%inst

カーネルを実行します。

まずHCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXdの8種類の違いですが
c,i,l,uc,ui,ul,f,dがそれぞれchar,int,long,uchar,uint,ulong,float,doubleに対応しています。
この型情報は、基本的にglobal変数の型の解釈として使われます。

■HCLDoX系命令について
第一引数の文字列はOpenCL カーネルコードになります。

ただ普通と違うのは__global float *Aなどと宣言してないことです。
文字列のコードをプラグイン内部で解釈し、1文字の大文字はglobal変数、1文字の小文字はprivate変数として自動的に宣言が追加されます。

A,B,Cとaという1文字変数を短縮記カーネルで使うと
	__global int *A,__global int *B,__global int *C,int a
という宣言がプラグイン内部によって追加されていることになります。


■型については
global変数の場合、HCLDoXiはint型に決定されます。
private変数の場合、HSP側で入力した引数の型がそのまま採用されます。

■並列実行数
global_sizeとlocal_sizeですが、local_sizeは64固定、global_sizeは
グローバル変数Aに対応するBufferのサイズから決定されます。
例えばHCLDoXi命令で、サイズが256*4=1024byteのcl memをp2に指定した場合
HCLDoXiなのでint型と解釈しておりsizeof(int)=4で割って
global_size=1024/4=256
ということになります。

■小文字変数について(1文字)
例外としては「i」「j」「k」「x」「y」「z」があります。
iは
	int i = get_global_id(0);
というように宣言されており今回の「a」のような使い方はできません。
j,k,x,y,zはprivate変数の宣言には使われず、普通にコード内で
	float x=1.2;
と使うことができます。

■小文字変数について(2文字以上)
「li」という変数は
	int li = get_local_id(0);
と宣言されています。


■大文字変数について(2文字以上)
1文字の大文字はglobal変数と解釈されますが、型については例えばHCLDoXdなら全てdoubleと決め打ちされてしまいます。
そこでglobal変数の型を明示的に、簡単に記せるよう以下のような規則を設けています。
	C0 ～C9 	:	global変数をchar型と解釈
	UC0～UC9	:	global変数をunsigned char型と解釈
	I0 ～I9 	:	global変数をint型と解釈
	UI0～UI9	:	global変数をunsigned int型と解釈
	L0 ～L9 	:	global変数をlong long型と解釈
	UL0～UL9	:	global変数をunsigned long long型と解釈
	F0 ～F9 	:	global変数をfloat型と解釈
	D0 ～D9 	:	global変数をdouble型と解釈


ただしコード内に必ず「A」や「B」などの半角1文字の大文字を使っていないといけません。
それはglobal_sizeを決める際に、その1文字変数が基準になるからです。

HCLDoX系命令に引数を与える順番ですが
１ 半角1文字大文字変数A-Z
２ C D F I L UC UI UL
３ 半角1文字小文字変数a-z
の順になります。


またS0～S9という文字列も意味を持ちます。
SはShared memoryのSであり
	S0	:	1要素のShared memory
	S1	:	2要素のShared memory
	S2	:	4要素のShared memory
	S3	:	8要素のShared memory
	S4	:	16要素のShared memory
	S5	:	32要素のShared memory
	S6	:	64要素のShared memory
	S7	:	128要素のShared memory
	S8	:	256要素のShared memory
	S9	:	512要素のShared memory

型はHCLDoXfならfloat型と決定されます。


OUTという文字も意味を持ちます。
まずHCLDoX系命令は関数として使うこともでき、新しくcl_memを作成し返すことができます。
カーネルコード側でOUTと書いてあるところが、出力メモリバッファにあたります。
カーネルコード内ではHCLDoXfの場合OUTはfloat型でありメモリのサイズは「A※」と同じものが作られます。

※1文字大文字変数でアルファベット順で最初にくるもの(つまりHCLDoX系命令の第2引数にあたるもの)と同じサイズ、型として作成されるという規則があります。

もしカーネルコード中にOUTを使用していても、HCLDoX系命令を命令形(関数ではなく)として使った場合OUTは一度作成されますがプラグイン内部ですぐ破棄されます。

■デフォルト関数
デフォルト設定されている関数があり
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

これによりRND()関数をデフォルトで使うことができます。

また#defineで下記文言が登録されており使うことができます。
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


■コードの使い回しについて
HCLDoX系命令もHCLCallもHCLCall2も、入力文字列はハッシュ化され、過去に同じ文字列でカーネルを実行したことがあるならば
文字列のコンパイルをスキップしkernel idを使い回すことでオーバーヘッドを極力へらす仕様になっています。
ただし、異なるデバイスidでコンパイルしたものは同じコード文字列であっても別物と解釈します。

したがって同じデバイスで同じコード文字列を何度も実行しても、最初の1回のみ大きなオーバーヘッドがあるだけで
2回目以降の実行はHCLDokrn1,2,3と同じくらい、気にならない程度のオーバーヘッドになるはずです。
例えば1秒に10000回HCLDoX系命令を実行するなら別ですが・・・その場合HCLDokrn1,2,3系命令のほうが明らかにオーバーヘッドという観点では高速になるでしょう。(もちろんGPU上のカーネルコードの実行速度は変わらない)



%href
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul

;----------------

%index
HCLBLAS_sgemm
sgemmカーネル実行 C=A*B

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[C]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[B]cl_mem_id			[in]
int p4:[C]転置フラグ,省略可			[in]
int p5:[A]転置フラグ,省略可			[in]
int p6:[B]転置フラグ,省略可			[in]

%inst

C=A×Bの行列行列積を行ないます。
プラグイン内部に埋め込まれているカーネルで実行されます。

転置フラグは0で転置なし、1で転置ありになります。
A,BにはHCLBLAS_Set2DShape
であらかじめcl memに行、列のサイズを設定しておく必要があります。

命令として実行することもできますが、関数として実行することもできます。
その際は
C=HCLBLAS_sgemm(A,B,0,0,0)
のように使います。
この場合、Cには新たにHCLCreateBufferで確保されたmem idが返されます。


%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;----------------

%index
HCLBLAS_dgemm
dgemmカーネル実行 C=A*B

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[C]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[B]cl_mem_id			[in]
int p4:[C]転置フラグ,省略可			[in]
int p5:[A]転置フラグ,省略可			[in]
int p6:[B]転置フラグ,省略可			[in]

%inst

C=A×Bの行列行列積を行ないます。
プラグイン内部に埋め込まれているカーネルで実行されます。

転置フラグは0で転置なし、1で転置ありになります。
A,BにはHCLBLAS_Set2DShape
であらかじめcl memに行、列のサイズを設定しておく必要があります。

命令として実行することもできますが、関数として実行することもできます。
その際は
C=HCLBLAS_sgemm(A,B,0,0,0)
のように使います。
この場合、Cには新たにHCLCreateBufferで確保されたmem idが返されます。


%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;--------
%index
HCLBLAS_Set2DShape
cl mem idに行と列を設定する

%prm
int64 p1,int p2,int p3
int64 p1:cl_mem_id			[in]
int p2:行(raw)の数			[in]
int p3:列(col)の数			[in]

%inst
cl memに行、列のサイズを設定します。
HCLBLAS_sgemm命令やHCLBLAS_dgemm命令を使う際にあらかじめ行、列を正しく設定しておく必要があります。
この設定した行と列の値はcl memと一緒にプラグイン内部に記録され、HCLBLAS_Get2DShapeで取り出すことができます。


%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;--------

%index
HCLBLAS_Get2DShape
cl mem idに行or列を取得する

%prm
(int64 p1,int p2)
int64 p1:cl_mem_id			[in]
int p2:0 or 1

%inst
cl memの行、列のサイズを取得します。
p2が0なら行、1なら列が返されます。

%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;--------

%index
HCLBLAS_sT
cl mem idをfloat型で行列転置

%prm
int64 p1,int64 p2
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
■命令として使った場合
p1をソースとしてfloat型として解釈し、行列転置したものをp2に書き込みます。
■関数として使った場合
p1をソースとしてfloat型として解釈し、行列転置したメモリbufferを作成しメモリidを返します。
p2は指定できません。

%href
HCLBLAS_dT
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_dT
cl mem idをdouble型で行列転置

%prm
int64 p1,int64 p2
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
■命令として使った場合
p1をソースとしてdouble型として解釈し、行列転置したものをp2に書き込みます。
■関数として使った場合
p1をソースとしてdouble型として解釈し、行列転置したメモリbufferを作成しメモリidを返します。
p2は指定できません。

%href
HCLBLAS_sT
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_sgemv
sgemvカーネル実行 y=A*x

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[y]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[x]cl_mem_id			[in]

%inst

y=A×xの行列ベクトル積を行ないます。
プラグイン内部に埋め込まれているカーネルで実行されます。

AにはHCLBLAS_Set2DShape
であらかじめcl memに行、列のサイズを設定しておく必要があります。

x,yはHCLBLAS_Set2DShapeでサイズ指定されていても無視されます。


命令として実行することもできますが、関数として実行することもできます。
その際は
y=HCLBLAS_sgemm(A,x)
のように使います。
この場合、yには新たにHCLCreateBufferで確保されたmem idが返されます。


%href
HCLBLAS_sgemv
HCLBLAS_dgemv
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_dgemv
dgemvカーネル実行 y=A*x

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[y]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[x]cl_mem_id			[in]

%inst

y=A×xの行列ベクトル積を行ないます。
プラグイン内部に埋め込まれているカーネルで実行されます。

AにはHCLBLAS_Set2DShape
であらかじめcl memに行、列のサイズを設定しておく必要があります。

x,yはHCLBLAS_Set2DShapeでサイズ指定されていても無視されます。


命令として実行することもできますが、関数として実行することもできます。
その際は
y=HCLBLAS_sgemm(A,x)
のように使います。
この場合、yには新たにHCLCreateBufferで確保されたmem idが返されます。


%href
HCLBLAS_sgemv
HCLBLAS_dgemv
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_sdot
x1・x2のドット積(ベクトル内積)を計算

%prm
int64 p1,int64 p2,int64 p3
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]
int64 p3:cl_mem_id			[in]

%inst
■命令として使った場合
p2,p3をfloat型のベクトルとして解釈し内積計算したものをp1に書き込みます。
■関数として使った場合
p1,p2をfloat型のベクトルとして解釈し内積計算したものの結果が格納されているmem idを返します。
p3は使いません。

%href
HCLBLAS_ddot
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_ddot
x1・x2のドット積(ベクトル内積)を計算

%prm
int64 p1,int64 p2,int64 p3
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]
int64 p3:cl_mem_id			[in]

%inst
■命令として使った場合
p2,p3をdouble型のベクトルとして解釈し内積計算したものをp1に書き込みます。
■関数として使った場合
p1,p2をdouble型のベクトルとして解釈し内積計算したものの結果が格納されているmem idを返します。
p3は使いません。

%href
HCLBLAS_sdot
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_snrm2
ベクトルxのL2ノルムを計算

%prm
int64 p1,int64 p2
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
■命令として使った場合
p2をfloat型のベクトルとして解釈しL2ノルムを計算したものをp1に書き込みます。
■関数として使った場合
p1をfloat型のベクトルとして解釈しL2ノルムを計算したものの結果が格納されているmem idを返します。
p2は使いません。

%href
HCLBLAS_dnrm2
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_dnrm2
ベクトルxのL2ノルムを計算

%prm
int64 p1,int64 p2
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
■命令として使った場合
p2をdouble型のベクトルとして解釈しL2ノルムを計算したものをp1に書き込みます。
■関数として使った場合
p1をdouble型のベクトルとして解釈しL2ノルムを計算したものの結果が格納されているmem idを返します。
p2は使いません。

%href
HCLBLAS_snrm2
HCLBLAS_Set2DShape
;--------