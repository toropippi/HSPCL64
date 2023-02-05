;------------------------
;  デバイス情報関連
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
OpenCLデバイス情報管理

%port
Win

;-------- ref --------

%index
HCLinit
HSPCL64を初期化

%prm

%inst
HSPCL64を初期化します。
hspcl64.asをインクルードしたあとに実行して下さい。

%href
HCLGetDeviceCount
_ExHCLSetCommandQueueMax
_ExHCLSetCommandQueueProperties
_ExHCLSetEventMax
;--------

%index
HCLGetPluginVersion
HSPCL64バージョン取得

%prm
()

%inst
HSPCL64プラグインのバージョンがdouble型で返ります。

%href
;--------

%index
HCLGetDeviceCount
OpenCLデバイス数取得

%prm
()

%inst
OpenCLデバイスとして認識されるデバイス数が返ります。
HCLSetDeviceで指定できる番号は0～HCLGetDeviceCount()-1の範囲となります。

%href
HCLinit
HCLSetDevice

;--------


%index
HCLSetDevice
デバイスセット

%prm
int p1
int p1	デバイスid [in]

%inst

カーネル命令やカーネル登録、メモリ確保を実行するデバイスを指定します。
HCLSetDeviceで指定できる番号は0～HCLGetDeviceCount()-1の範囲となります。
例えばGPUを2枚以上搭載しているPCで、それぞれのGPUで全く異なるプログラムを実行されることができます。

以下の命令は設定したデバイスのみで実行されます。


HCLGetDeviceInfo_s
HCLGetDeviceInfo_i
HCLGetDeviceInfo_i64
HCLGetSettingDevice
HCLCreateProgram
HCLCreateProgramWithSource
HCLReleaseProgram
HCLGetProgramBinary
HCLCreateProgramWithBinary
HCLCreateKernel
HCLSetKernel
HCLSetKrns
HCLGetKernelName
HCLReleaseKernel
HCLCreateBuffer
HCLCreateBufferFrom
HCLWriteBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer
HCLReadBuffer_NonBlocking
HCLGet_NonBlocking_Status
HCLCopyBuffer
HCLFillBuffer
HCLReleaseBuffer
HCLdim_i32FromBuffer
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
HCLGetSize
HCLGetAllBufferSize
HCLGarbageCollectionNow
HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
HCLReadIndex_fp
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLWriteIndex_fp
HCLCall
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLFinish
HCLFlush
HCLWaitForEvent
HCLWaitForEvents
HCLBLAS_Set2DShape
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

HCLSetDeviceを実行していない場合は、カレントデバイスはデバイス0です。

%href
HCLGetDeviceInfo_s
HCLGetDeviceInfo_i
HCLGetDeviceInfo_i64
HCLGetSettingDevice
HCLCreateProgram
HCLCreateProgramWithSource
HCLReleaseProgram
HCLGetProgramBinary
HCLCreateProgramWithBinary
HCLCreateKernel
HCLSetKernel
HCLSetKrns
HCLGetKernelName
HCLReleaseKernel
HCLCreateBuffer
HCLCreateBufferFrom
HCLWriteBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer
HCLReadBuffer_NonBlocking
HCLGet_NonBlocking_Status
HCLCopyBuffer
HCLFillBuffer
HCLReleaseBuffer
HCLdim_i32FromBuffer
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
HCLGetSize
HCLGetAllBufferSize
HCLGarbageCollectionNow
HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
HCLReadIndex_fp
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLWriteIndex_fp
HCLCall
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLFinish
HCLFlush
HCLWaitForEvent
HCLWaitForEvents
HCLBLAS_Set2DShape
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
;--------

%index
HCLGetSettingDevice
セットデバイスno取得

%prm
()

%inst
HCLSetDeviceで指定したデバイスのidが返ります。

%href
HCLSetDevice
;--------

%index
HCLGetDeviceInfo_s
デバイス情報取得

%prm
(int p1)
int p1 ： param_name [in]

%inst
HCLSetDeviceでセットしたデバイスの情報を文字列で取得します。
p1にparam_nameを指定して下さい。戻り値は文字列になります。

p1は下記のURLの表にある値からひとつ選んで指定できます。
日本語サイト：http://wiki.tommy6.net/wiki/clGetDeviceInfo
英語サイト：https://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i
HCLGetDeviceInfo_i64
;--------

%index
HCLGetDeviceInfo_i
デバイス情報取得

%prm
(int p1,int p2)
int p1 ： param_name [in]
int p2 ： index [in]

%inst
HCLSetDevice でセットしたデバイスの情報を文字列で取得します。
p1にparam_nameを指定して下さい。戻り値はint型の整数になります。
戻り値の数値が配列の場合は、p2にindexを指定することで、p2番目の要素の情報を得ることができます。

p1は下記のURLの表にある値からひとつ選んで指定できます。
日本語サイト：http://wiki.tommy6.net/wiki/clGetDeviceInfo
英語サイト：https://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i64
HCLGetDeviceInfo_s
;--------

%index
HCLGetDeviceInfo_i64
デバイス情報取得

%prm
(int p1,int p2)
int p1 ： param_name [in]
int p2 ： index [in]

%inst
HCLSetDevice でセットしたデバイスの情報を文字列で取得します。
p1にparam_nameを指定して下さい。戻り値は64bit int型の整数になります。
戻り値の数値が配列の場合は、p2にindexを指定することで、p2番目の要素の情報を得ることができます。

p1は下記のURLの表にある値からひとつ選んで指定できます。
日本語サイト：http://wiki.tommy6.net/wiki/clGetDeviceInfo
英語サイト：https://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s
;--------

%index
_ExHCLSetCommandQueueMax
コマンドキューの最大数をセット

%prm
int p1
int p1	コマンドキューの最大数 [in]


%inst
HCLinitの実行前に指定することで、1つのデバイスあたりのコマンドキューの最大を増やすことができます。
デフォルトでは1つのデバイスあたりのコマンドキューは0～3までつかえます。

%href
_ExHCLSetCommandQueueProperties
_ExHCLSetEventMax
;--------

%index
_ExHCLSetCommandQueueProperties
コマンドキュープロパティのセット

%prm
int p1
int p1	properties [in]

%inst
HCLinitの実行前に指定することで、OpenCLのコマンドキューのプロパティの設定を変えることができます。
コマンドキュープロパティはデフォルトではCL_QUEUE_PROFILING_ENABLEが指定されています。
http://wiki.tommy6.net/wiki/clCreateCommandQueue
を参考にして下さい。

%href
_ExHCLSetCommandQueueMax
_ExHCLSetEventMax
;--------

%index
_ExHCLSetEventMax
イベントの最大数をセット

%prm
int p1
int p1	イベントの最大数 [in]

%inst
HCLinitの実行前に指定することで、記録可能イベントの最大を増やすことができます。
デフォルトでイベントidは0～65535番までつかえます。

%href
_ExHCLSetCommandQueueMax
_ExHCLSetCommandQueueProperties
;--------