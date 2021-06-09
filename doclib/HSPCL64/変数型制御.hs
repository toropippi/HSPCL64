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
dim64
int64�^�̔z��ϐ����쐬

%prm
p1,p2...
p1=�ϐ� : �z������蓖�Ă�ϐ���	[in]
p2=0�` : �v�f�̍ő�			[in]

%inst
�C�ӂ̗v�f������int64�^�̔z��ϐ����쐬���܂��B

��F
	dim64 a,20

��̗�ł́A�ϐ�a�̗v�f���Q�O�A�܂�ua(0)�v�`�ua(19)�v�܂ł����炩���ߊm�ۂ��܂��B

�p�����[�^�𑝂₷���Ƃő������z����쐬���邱�Ƃ��\�ł��B

��F
dim64 a,10,5	: �ϐ�a�͂Q�����z��
a(0,0)=1	: �v�f(0,0)��1����
a(1,0)=2	: �v�f(1,0)��2����
a(0,1)=3	: �v�f(0,1)��3����

��̗�ł́Aa(0,0)����Aa(9,4)�܂ł��g�p�ł���悤�ɂȂ�܂��B
�������z��́A�S�����܂Ŋm�ۂ��邱�Ƃ��\�ł��B

dim64���߂̓X�N���v�g���̂ǂ��łł���`�E�Ē�`���邱�Ƃ��\�ł��B
�܂��A�z��ϐ����쐬����Ɠ��e�͂��ׂ�0�ɃN���A����܂��B

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
p1�̃r�b�g�p�^�[����float�^�Ƃ��ĉ��߂�����Adouble�^�ɐ��l��ϊ����Ԃ��܂��B
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

%index
int64
64bit�����l�ɕϊ�

%prm
(p1)
p1 : �ϊ����̒l�܂��͕ϐ� [in]

%inst
p1�Ŏw�肳�ꂽ�l��64bit�����ɂ������̂�Ԃ��܂��B
�l�������̏ꍇ�́A�����_�ȉ����؂�̂Ă��܂��B
�l��������̏ꍇ�́A���l������̏ꍇ�͂��̐��l�ɁA����ȊO��0�ɂȂ�܂��B

%href
int
;--------