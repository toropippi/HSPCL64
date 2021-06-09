;------------------------
;   変数型制御
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
64bitランタイムGPGPU用プラグイン

%group
OpenCLメモリ制御

%port
Win

;-------- ref --------
%index
dim64
int64型の配列変数を作成

%prm
p1,p2...
p1=変数 : 配列を割り当てる変数名	[in]
p2=0～ : 要素の最大			[in]

%inst
任意の要素を持つint64型の配列変数を作成します。

例：
	dim64 a,20

上の例では、変数aの要素を２０個、つまり「a(0)」～「a(19)」までをあらかじめ確保します。

パラメータを増やすことで多次元配列を作成することも可能です。

例：
dim64 a,10,5	: 変数aは２次元配列
a(0,0)=1	: 要素(0,0)に1を代入
a(1,0)=2	: 要素(1,0)に2を代入
a(0,1)=3	: 要素(0,1)に3を代入

上の例では、a(0,0)から、a(9,4)までを使用できるようになります。
多次元配列は、４次元まで確保することが可能です。

dim64命令はスクリプト内のどこででも定義・再定義することが可能です。
また、配列変数を作成すると内容はすべて0にクリアされます。

%href
FloatToDouble
DoubleToFloat
Min64
Max64
;--------

%index
DoubleToFloat
doubleをfloatにして4byteバイナリで出力

%prm
(double p1)
double p1：val [in]

%inst
p1をfloat型数値に変換し、その4byteバイナリをint型として返します。
HSPでfloat型が扱えないものの、OpenCLとfloat型でやりとりする場合にこの命令を使います。

%href
FloatToDouble
;--------

%index
FloatToDouble
4byteバイナリfloatをdoubleをにして出力

%prm
(int p1)
int p1：val [in]

%inst
p1のビットパターンをfloat型として解釈した後、double型に数値を変換し返します。
HSPでfloat型が扱えないものの、OpenCLとfloat型でやりとりする場合にこの命令を使います。

%href
DoubleToFloat
;--------

%index
Min64
小さい方を返す

%prm
(int64 p1,int64 p2)
int64 p1：val [in]
int64 p2：val [in]

%inst
p1とp2のうち小さい方を返します。

%href
Max64
;--------
%index
Max64
大きい方を返す

%prm
(int64 p1,int64 p2)
int64 p1：val [in]
int64 p2：val [in]

%inst
p1とp2のうち大きい方を返します。

%href
Min64
;--------

%index
int64
64bit整数値に変換

%prm
(p1)
p1 : 変換元の値または変数 [in]

%inst
p1で指定された値を64bit整数にしたものを返します。
値が実数の場合は、小数点以下が切り捨てられます。
値が文字列の場合は、数値文字列の場合はその数値に、それ以外は0になります。

%href
int
;--------