;------------------------
;   �������֘A
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
hspcl32.as ���C���N���[�h���Ă��������B

%type
GPGPU�p�v���O�C��

%group
OpenCL����������

%port
Win

;-------- ref --------

%index
HCLCreateBuffer
VRAM�쐬

%prm
var p1,int p2
var p1 : CL_mem_object id����������	[OUT]
int p2 : �m�ۂ���byte��			[in]

%inst
HCLSetDev�Ŏw�肳�ꂽ�O���t�B�b�N�{�[�h�Ȃǂ̃f�o�C�X��Ƀ��������m�ۂ��܂��B
���GDDR5�Ȃǂ̃������̂���O���{��ɁA�w�肵���T�C�Y�̃��������m�ۂ���邱�ƂɂȂ�܂��B
���΂�HCLReleaseMemObject�ŉ���ł�


�ȉ��̐}�ł����@�̃o�b�t�@���쐬�ł��閽�߂ł�
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLSetDev
HCLReleaseMemObject

;--------

%index
HCLWriteBuffer
HSP�z�����VRAM�ɏ���

%prm
int p1,array p2,int p3,int p4,int p5,int p6
int p1 : �R�s�[��CL_mem_object id		[in]
array p2:�R�s�[���z��ϐ�		[in]
int p3 : �R�s�[�T�C�Ybyte		[in]
int p4 : �R�s�[��̃I�t�Z�b�g		[in]
int p5 : �R�s�[���̃I�t�Z�b�g		[in]
int p6 : �u���b�L���O���[�hoff		[in]

%inst
�z�X�g(CPU)����HCLSetDev�Ŏw�肵���f�o�C�X(GPU)���Ƀf�[�^��]�����܂��B
p6�̃u���b�L���O���[�h��0���w�肷���off�ɂȂ�A�]�����������Ȃ������Ɏ��̖��߂Ɉڂ�܂��B
���̏ꍇ�]�������܂ł�HCLWaitTask�ő҂��Ƃ��ł��܂��B
p6�͏ȗ����f�t�H���g��1�ł��B

�ȉ��̐}�ł����@��A�̃o�b�t�@�ɑ΂��ăf�[�^�������ޖ��߂ł��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLCreateBuffer
HCLReadBuffer
HCLWaitTask

;--------

%index
HCLReadBuffer
VRAM����HSP�z����ɓǍ�

%prm
int p1,array p2,int p3,int p4,int p5,int p6
int p1 : �R�s�[��CL_mem_object id		[in]
array p2:�R�s�[��z��ϐ�			[OUT]
int p3 : �R�s�[�T�C�Ybyte		[in]
int p4 : �R�s�[���̃I�t�Z�b�g		[in]
int p5 : �R�s�[��̃I�t�Z�b�g		[in]
int p6 : �u���b�L���O���[�hoff		[in]

%inst
HCLSetDev�Ŏw�肵���f�o�C�X(GPU)����z�X�g(CPU)���Ƀf�[�^��]�����܂��B
p6�̃u���b�L���O���[�h��0���w�肷���off�ɂȂ�A�]�����������Ȃ������Ɏ��̖��߂Ɉڂ�܂��B
���̏ꍇ�]�������܂ł�HCLWaitTask�ő҂��Ƃ��ł��܂��B
p6�͏ȗ����f�t�H���g��1�ł��B

�ȉ��̐}�ł����@��A�̃o�b�t�@����f�[�^��ǂݏo�����߂ł��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html



������
HCLDoKernel�ŃL���[�ɑ������^�X�N���܂��v�Z���̎���HCLReadBuffer����VRAM�ɃA�N�Z�X�����HCLDoKernel�ő������^�X�N����������O��VRAM�ǂݍ��݂����Ă��܂��ꍇ������܂�(�@��ɂ��)�B�t�ɁAHCLReadBuffer��HCLDoKernel�̃^�X�N��҂��Ă���Ă���ꍇ�A���̖��߂̏������Ԃ��������������Ă���悤�ɂ݂��鎞������܂����A���ۂ̓^�X�N�҂������������������ł��B��ʓI��CPU����VRAM�ւ̓ǂݍ��݁A�������ݑ��x�͒ʏ�Е���8GB/sec�`16GB/sec�ƍ����ł��B

%href
HCLCreateBuffer
HCLWriteBuffer
HCLWaitTask


;--------

%index
HCLCopyBuffer
VRAM���m�R�s�[

%prm
int p1,int p2,int p3,int p4,int p5,int p6]
int p1 : �R�s�[��CL_mem_object id		[in]
int p2 : �R�s�[��CL_mem_object id		[in]
int p3 : �R�s�[�T�C�Ybyte		[in]
int p4 : �R�s�[��̃I�t�Z�b�g		[in]
int p5 : �R�s�[���̃I�t�Z�b�g		[in]
int p6 : �u���b�L���O���[�hoff		[in]

%inst
HCLSetDev�Ŏw�肵���f�o�C�X��̃������ԂŃR�s�[�����܂��B
p6�̃u���b�L���O���[�h��0���w�肷���off�ɂȂ�A�]�����������Ȃ������Ɏ��̖��߂Ɉڂ�܂��B
�]�������܂ł�HCLWaitTask�ő҂��Ƃ��ł��܂��B
p6�̓f�t�H���g��1�ł��B


�ȉ��̐}�ł����@�A�A�A�C�A�D�֑��ݕ����փf�[�^�R�s�[���\�Ȗ��߂ł��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer
HCLWaitTask

;--------

%index
HCLReleaseMemObject
VRAM�j��

%prm
int p1
int p1 : CL_mem_object id			[in]
%inst
�f�o�C�X��̃�������������܂��B


�ȉ��̐}�ł����@�̉���ł��B�A�̉����HGLReleaseBuffer���g���ĉ������B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

%href
HCLCreateBuffer
;--------

%index
HCLCreateFromGLBuffer
VRAM�쐬(OpenGL�A�g)

%prm
var p1,int p2
var p1 : CL_mem_object id����������	[OUT]
int p2 : GL_mem_object vbo		[in]

%inst
vbo�́uglGenBuffers�v���߂ō쐬����vbo�Ȃǂ��w�肵�Ă��������B
OpenCL�Ōv�Z�������W��OpenGL�œ_(�v���~�e�B�u)��`�悵�������ȂǂɎg���܂��B

���̖��߂͈ȉ��̐}�ł����A�̐���HGLCreateBuffer�̒��Ŏg�p����Ă��܂��B
�Ȃ̂�HGLCreateBuffer���g���ꍇ�́AHCLCreateFromGLBuffer�͕K�v����܂���B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
;--------

%index
HCLEnqueueAcquireGLObjects
vbo�o�b�t�@�����b�N

%prm
int p1
int p1 : vbo�Ɗ֘A�t����CL_mem_object	[in]

%inst
vbo��opencl�ň������߂�vbo�o�b�t�@�����b�N���܂��B
vbo�������J�[�l���̑O�ɂ͂��Ȃ炸���s���Ă��������B
�܂�������Ă񂾌�HCLEnqueueReleaseGLObjects��K�����s���ă��b�N���������Ă�������

%href
HCLEnqueueReleaseGLObjects


;--------

%index
HCLEnqueueReleaseGLObjects
vbo�o�b�t�@�����b�N����

%prm
int p1
int p1 : vbo�Ɗ֘A�t����CL_mem_object	[in]

%inst
HCLEnqueueAcquireGLObjects�Ƒ΂ł�
%href
HCLEnqueueAcquireGLObjects
;--------























;--------

%index
HCLReadIndex_i
VRAM����1�v�f�ǂݍ���

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]

%inst
GPU��VRAM���璼��1�̒l���Ƃ肾���Ԃ��܂��B
p1��CL mem obj id
p2�͓ǂݏo���C���f�b�N�X���w�肵�ĉ������B
�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

VRAM�̓��e��int�^4�̔z��ϐ��@(100,400,500,700)
�������ꍇ
HCLReadIndex_i(memid,3)�@�́@700
��Ԃ��܂��B

%href
HCLReadIndex_d
HCLReadIndex_f
HCLReadIndex_s

;--------



;--------

%index
HCLReadIndex_d
VRAM����1�v�f�ǂݍ���

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]

%inst
GPU��VRAM���璼��1�̒l���Ƃ肾���Ԃ��܂��B
p1��CL mem obj id
p2�͓ǂݏo���C���f�b�N�X���w�肵�ĉ������B
�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

VRAM�̓��e��double�^4�̔z��ϐ��@(100.0,400.0,500.0,700.0)
�������ꍇ
HCLReadIndex_d(memid,3)�@�́@700.0
��Ԃ��܂��B

%href
HCLReadIndex_i
HCLReadIndex_f
HCLReadIndex_s

;--------



;--------

%index
HCLReadIndex_f
VRAM����1�v�f�ǂݍ���

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]

%inst
GPU��VRAM���璼��1�̒l���Ƃ肾���Ԃ��܂��B
p1��CL mem obj id
p2�͓ǂݏo���C���f�b�N�X���w�肵�ĉ������B
�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

VRAM�̓��e��float�^4�̔z��ϐ��@(100.0,400.0,500.0,700.0)
�������ꍇ
HCLReadIndex_f(memid,3)�@�́@700.0
��Ԃ��܂��B

%href
HCLReadIndex_d
HCLReadIndex_i
HCLReadIndex_s

;--------



;--------

%index
HCLReadIndex_s
VRAM����1�v�f�ǂݍ���

%prm
(int p1,int p2)

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]

%inst
GPU��VRAM���璼��1�̒l���Ƃ肾���Ԃ��܂��B
p1��CL mem obj id
p2�͓ǂݏo���C���f�b�N�X���w�肵�ĉ������B
�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

VRAM�̓��e��char�^4�̔z��ϐ��@(10,40,50,7)
�������ꍇ
HCLReadIndex_s(memid,3)�@�́@7
��Ԃ��܂��B
char�^�Ȃ̂Ŕ͈͂�0�`255�͈̔͂ł��B

%href
HCLReadIndex_d
HCLReadIndex_f
HCLReadIndex_i

;--------



















;--------

%index
HCLWriteIndex_i
VRAM��1�v�f��������

%prm
int p1,int p2,int p3

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]
int p3 : ���e				[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��int�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B


%href
HCLWriteIndex_d
HCLWriteIndex_f
HCLWriteIndex_s

;--------


;--------

%index
HCLWriteIndex_d
VRAM��1�v�f��������

%prm
int p1,int p2,double p3

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]
double p3:���e				[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��double�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B


%href
HCLWriteIndex_i
HCLWriteIndex_f
HCLWriteIndex_s

;--------

;--------

%index
HCLWriteIndex_f
VRAM��1�v�f��������

%prm
int p1,int p2,float p3

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]
float p3:���e				[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��float�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B


%href
HCLWriteIndex_d
HCLWriteIndex_i
HCLWriteIndex_s

;--------

;--------

%index
HCLWriteIndex_s
VRAM��1�v�f��������

%prm
int p1,int p2,int p3

int p1 : CL_mem_object id		[in]
int p2 : �z��̗v�f(index)		[in]
int p3 : ���e(0�`255)			[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��char�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B


%href
HCLWriteIndex_d
HCLWriteIndex_f
HCLWriteIndex_i

;--------
