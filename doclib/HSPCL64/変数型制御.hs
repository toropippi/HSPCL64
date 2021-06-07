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
dim_i64
64bit int型配列変数を作成

%prm
p1,int p2
p1     : 変数			[in]
int p2 : 配列数			[in]

%inst
p1を64bit int型配列変数にします

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
p1をfloat型数値として認識した後、double型に数値を変換し返します。
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
