;------------------------
;   �ϐ��^����
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
hspcl64.as ���C���N���[�h���Ă��������B

%type
64bit�����^�C��GPGPU�p�v���O�C��

%group
OpenCL����������

%port
Win

;-------- ref --------
%index
dim_i64
64bit int�^�z��ϐ����쐬

%prm
p1,int p2
p1     : �ϐ�			[in]
int p2 : �z��			[in]

%inst
p1��64bit int�^�z��ϐ��ɂ��܂�

%href
FloatToDouble
DoubleToFloat
Min64
Max64
;--------

%index
DoubleToFloat
double��float�ɂ���4byte�o�C�i���ŏo��

%prm
(double p1)
double p1�Fval [in]

%inst
p1��float�^���l�ɕϊ����A����4byte�o�C�i����int�^�Ƃ��ĕԂ��܂��B
HSP��float�^�������Ȃ����̂́AOpenCL��float�^�ł��Ƃ肷��ꍇ�ɂ��̖��߂��g���܂��B

%href
FloatToDouble
;--------

%index
FloatToDouble
4byte�o�C�i��float��double���ɂ��ďo��

%prm
(int p1)
int p1�Fval [in]

%inst
p1��float�^���l�Ƃ��ĔF��������Adouble�^�ɐ��l��ϊ����Ԃ��܂��B
HSP��float�^�������Ȃ����̂́AOpenCL��float�^�ł��Ƃ肷��ꍇ�ɂ��̖��߂��g���܂��B

%href
DoubleToFloat
;--------

%index
Min64
����������Ԃ�

%prm
(int64 p1,int64 p2)
int64 p1�Fval [in]
int64 p2�Fval [in]

%inst
p1��p2�̂�������������Ԃ��܂��B

%href
Max64
;--------
%index
Max64
�傫������Ԃ�

%prm
(int64 p1,int64 p2)
int64 p1�Fval [in]
int64 p2�Fval [in]

%inst
p1��p2�̂����傫������Ԃ��܂��B

%href
Min64
;--------
