;------------------------
;   イベント関連
;------------------------

;-------- header --------
%dll
HSPCL64.dll

%ver
1.1

%date
2023/02/06

%author
toropippi

%note
hspcl64.as をインクルードしてください。

%type
64bitランタイムGPGPU用プラグイン

%group
OpenCLイベント関連

%port
Win

;-------- ref --------
;--------
%index
event詳細

%inst
HSPCL32N,64で扱われるeventの概念について詳しく説明します。

■event
eventは、1つのデータ転送命令またはカーネル実行命令に紐づいています。
eventを使うことで主に以下の4種類のことが行なえます。
1.データ転送やカーネル実行開始時間、終了時間などの情報を取得することができます。HCLGetEventLogs命令がそれにあたります。
2.データ転送やカーネルが現在実行中かといった情報を取得することができます。HCLGetEventStatus命令がそれにあたります。
3.データ転送やカーネルの終了待ちが行なえます。HCLWaitForEventとHCLWaitForEvents命令がそれにあたります。
4.データ転送やカーネルが終了するまで、次のカーネルの実行を待たせることができます。HCLSetWaitEventとHCLSetWaitEvents命令がそれにあたります。

例えばHCLDoKrn1命令で1つのカーネルを実行し、その時間を計測したいとします。そのときはHCLDoKrn1命令の引数に任意のevent IDをユーザーが指定し、そのIDをHCLGetEventLogs命令で指定することで時間を取得できます。
このevent IDはデフォルトで0～65535のint型整数が使えます。それ以上記録したい場合は_ExHCLSetEventMax命令で記録可能event数を増やすことができます。そのかわり少しだけホスト側のメモリ消費量が増えます。

データ転送命令やカーネル実行命令にevent IDを紐づけたい場合、命令の最後の引数にevent IDを入力できるところがあるため、そこに指定してください。
以下の命令は、任意のevent IDと紐づけることができます。

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub


しかし、状況によってはいちいち命令の引数にevent idを指定するのが面倒であると考え以下の2つの命令を追加しました。
HCLEventAutoProfilingStart
HCLEventAutoProfilingEnd
このstart～endの間に実行されたデータ転送命令やカーネル実行命令(以下参照)は、event idが入力できる命令であってもそこに0以上の数値を指定しない限り、自動的にevent id 0番から実行順に紐づけされていきます。HCLEventAutoProfilingEndまでに記録したイベント数はHCLEventAutoProfilingEnd命令で取得できるようになっています。
このstart～endの間にはさむことでeventと紐づけることができる命令は以下になります。

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul

なお、event idが入力できる命令であり、そこに0以上の数値を指定した場合、指定された数値が優先的と判断されます。


■user event
もう一つuser eventという概念があります。(そもそもOpenCL APIにuser eventが実装されており、その命令をそのまま持ってきている形です。)
user eventはデータ転送命令やカーネル実行命令と関係なく、ユーザーが作成できるeventになります。
user eventでないeventとの違いは1～3の部分であり
1.event idを使って、終了時間などの情報を取得ができません。
2.event idを使って現在実行中かといった情報を取得することできません。
3.event idを使って終了待ちが行なえません。
4.event idを使って、次のカーネルの実行を待たせることができます。
となっております。ユーザーが作成したuser eventは、データ転送やカーネルと紐づいているわけではないため、そもそも実行状況や実行終了待ちが行えるわけではありません。4の使い方にのみ使えます。
このuser eventとeventは概念として違うものですが、event idは共通なので注意してください。
詳細はHCLCreateUserEventとサンプルを参照ください。



%href
HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLSetWaitEvent
HCLSetWaitEvents
HCLGetEventLogs
HCLSetUserEventStatus
HCLWaitForEvent
HCLWaitForEvents
HCLCreateUserEvent
_ExHCLSetEventMax

;--------
%index
HCLSetWaitEvent
event待ちに使うeventを1つセット

%prm
int p1
int p1 : event id [in]

%inst
p1に実行完了を行いたいカーネルに紐づいたevent idを入れて下さい。
下記命令を次に実行する際に、そのeventがすべて終了するまで実行待ちが行われます。

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul


使い方
HCLSetCommandQueue 0
HCLWriteBuffer memA,data,,,,0,0 //eventid=0
HCLSetCommandQueue 1
HCLSetWaitEvent 0
HCLDoKrn1 krnid,65536,256

これで、HCLWriteBufferの転送が終了したあとにkrnidのカーネルの実行が始まることが保証されます。(HCLSetWaitEvent 0をしてないと転送とカーネル実行が同時に起こる可能性がある)

%href
HCLSetWaitEvents
event詳細
;--------

%index
HCLSetWaitEvents
event待ちに使うeventを複数セット

%prm
array p1
array p1 : event idが格納されたint型配列 [in]

%inst
p1にevent idが格納されたint型配列を入れて下さい。
下記命令を次に実行する際に、そのeventがすべて終了するまで実行待ちが行われます。

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul


%href
HCLSetWaitEvent
event詳細
;--------

%index
HCLGetEventLogs
event情報取得

%prm
(int p1.int p2)
int p1 ： event id	[in]
int p2 ： parameter	[in]

%inst
p1にevent idを指定してp2で0～7のパラメーターを指定することで下記情報を取得できます。
返り値は必ず64bit intです。

0:eventと紐付いているOpenCLコマンドの種類
CL_COMMAND_NDRANGE_KERNEL                   0x11F0
CL_COMMAND_TASK                             0x11F1
CL_COMMAND_NATIVE_KERNEL                    0x11F2CL_COMMAND_READ_BUFFER                      0x11F3
CL_COMMAND_WRITE_BUFFER                     0x11F4
CL_COMMAND_COPY_BUFFER                      0x11F5
CL_COMMAND_READ_IMAGE                       0x11F6
CL_COMMAND_WRITE_IMAGE                      0x11F7
CL_COMMAND_COPY_IMAGE                       0x11F8
CL_COMMAND_COPY_IMAGE_TO_BUFFER             0x11F9
CL_COMMAND_COPY_BUFFER_TO_IMAGE             0x11FA
CL_COMMAND_MAP_BUFFER                       0x11FB
CL_COMMAND_MAP_IMAGE                        0x11FC
CL_COMMAND_UNMAP_MEM_OBJECT                 0x11FD
CL_COMMAND_MARKER                           0x11FE
CL_COMMAND_ACQUIRE_GL_OBJECTS               0x11FF
CL_COMMAND_RELEASE_GL_OBJECTS               0x1200
CL_COMMAND_READ_BUFFER_RECT                 0x1201
CL_COMMAND_WRITE_BUFFER_RECT                0x1202
CL_COMMAND_COPY_BUFFER_RECT                 0x1203
CL_COMMAND_USER                             0x1204
CL_COMMAND_BARRIER                          0x1205
CL_COMMAND_MIGRATE_MEM_OBJECTS              0x1206
CL_COMMAND_FILL_BUFFER                      0x1207
CL_COMMAND_FILL_IMAGE                       0x1208
そのeventがCL_COMMAND_NDRANGE_KERNELだったか、CL_COMMAND_WRITE_BUFFERだったか、CL_COMMAND_Read_BUFFERだったかの判定につかえます。

1:kernel_idかコピーサイズ
そのeventがCL_COMMAND_NDRANGE_KERNELならkernel_idが、
CL_COMMAND_WRITE_BUFFERやCL_COMMAND_Read_BUFFERやCL_COMMAND_FILL_BUFFERやCL_COMMAND_COPY_BUFFERならコピーサイズがbyteで返ります。

2:そのeventを実行したdevice 番号

3:そのeventを実行したCommandQueue 番号

4:CL_PROFILING_COMMAND_QUEUEDの時間
単位はナノセカンド(ns)

5:CL_PROFILING_COMMAND_SUBMITの時間
単位はナノセカンド(ns)

6:CL_PROFILING_COMMAND_STARTの時間
単位はナノセカンド(ns)

7:CL_PROFILING_COMMAND_ENDの時間
単位はナノセカンド(ns)

%href
HCLGetEventStatus
event詳細
;--------

%index
HCLGetEventStatus
イベント実行状態取得

%prm
(int p1)
int p1 ： event id [in]

%inst

event と関連付けられたコマンドの実行状態をint型で返します。
以下の値のうちひとつが返されます。
CL_QUEUED - コマンドがコマンドキューに挿入された。
CL_SUBMITTED - コマンドキューに関連付けられたデバイスに対し、挿入されたコマンドがホストから送られた。
CL_RUNNING - 現在デバイスがコマンドを実行中。
CL_COMPLETE - コマンドが完了した。
このほかに、負の整数値のエラーコードが返されることがあります（問題のあるメモリアクセスなどでコマンドが異常終了したときなど）。

詳細は
http://wiki.tommy6.net/wiki/clGetEventInfo
ここの
CL_EVENT_COMMAND_EXECUTION_STATUS
を参照して下さい。

%href
event詳細
;--------

%index
HCLWaitForEvent
event完了待ち

%prm
int p1
int p1 ： event id [in]

%inst
eventの実行完了を待ちます。

%href
HCLWaitForEvents
event詳細
;--------
%index
HCLWaitForEvents
event完了待ち

%prm
array p1
array p1 ： event idのint型配列 [in]

%inst
eventの実行完了を待ちます。

%href
HCLWaitForEvent
event詳細
;--------

%index
HCLCreateUserEvent
UserEvent作成

%prm
int p1
int p1 ： event id [in]

%inst
p1で指定したevent番号をユーザーイベントとして登録します。
HCLSetUserEventStatusとHCLSetWaitEvent等と組み合わせて使います。
HCLSetUserEventStatusで任意のタイミングでユーザーイベントにCL_COMPLETEをセットすることで
HCLSetWaitEventにより、あるOpenCLコマンドの実行開始を制御することができます。

初期状態ではCL_SUBMITTEDがセットされています。
注意としてはHCLGetEventLogs命令でUserEventが扱えないことです。

%href
HCLSetUserEventStatus
HCLSetWaitEvent
HCLSetWaitEvents
event詳細
;--------

%index
HCLSetUserEventStatus
UserEventに状態をセット

%prm
int p1,int p2
int p1 ： user event id		[in]
int p2 ： parameter		[in]

%inst
p1で指定したUserEventにp2をセットします。
p2は基本的にCL_COMPLETE(*)を指定します。

(*)
CL_COMPLETE    0x0

それ以外の値をセットする場合は下記参照下さい。
https://www.khronos.org/registry/OpenCL/sdk/2.2/docs/man/html/clSetUserEventStatus.html


%href
HCLCreateUserEvent
HCLSetWaitEvent
HCLSetWaitEvents
event詳細
;--------

%index
HCLEventAutoProfilingStart
Eventの自動記録開始

%prm

%inst
HCLEventAutoProfilingEndと対で使います。
このstart～endの間に実行されたデータ転送命令やカーネル実行命令(以下参照)は、event idが入力できる命令であってもそこに0以上の数値を指定しない限り、自動的にevent id 0番から実行順に紐づけされていきます。HCLEventAutoProfilingEndまでに記録したイベント数はHCLEventAutoProfilingEnd命令で取得できるようになっています。
このstart～endの間にはさむことでeventと紐づけることができる命令は以下になります。

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul

なお、event idが入力できる命令であり、そこに0以上の数値を指定した場合、指定された数値が優先的と判断されます。

%href
HCLEventAutoProfilingEnd
event詳細
;--------
%index
HCLEventAutoProfilingEnd
Eventの自動記録終了

%prm
()

%inst
HCLEventAutoProfilingStartと対で使います。
このstart～endの間に実行されたデータ転送命令やカーネル実行命令(以下参照)は、event idが入力できる命令であってもそこに0以上の数値を指定しない限り、自動的にevent id 0番から実行順に紐づけされていきます。HCLEventAutoProfilingEndまでに記録したイベント数はHCLEventAutoProfilingEnd命令で取得できるようになっています。
このstart～endの間にはさむことでeventと紐づけることができる命令は以下になります。

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul

なお、event idが入力できる命令であり、そこに0以上の数値を指定した場合、指定された数値が優先的と判断されます。

%href
HCLEventAutoProfilingStart
event詳細