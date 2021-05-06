;------------------------
;  �f�o�C�X���֘A
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
OpenCL�f�o�C�X���Ǘ�

%port
Win

;-------- ref --------

%index
HCLini
HSPCL��������

%prm
int p1,int p2
int p1�F�X�N���[���t���O	[in]
int p2�F�f�o�b�O���[�h		[in]

%inst
HSPCL�����������܂��B
hspcl32.as���C���N���[�h�������ƂɎ��s���ĉ������B
��������s������AHCLDevCount��OpenCL���s�\�f�o�C�X�����������܂��B
�ȍ~�f�o�C�Xid��HCLSetDev��  0�`(HCLDevCount-1)  �܂Ŏw��o���܂��B

�f�o�C�X�ɂ��AHCLini�̏������ŉ�ʂ������Ȃ�Ames �� boxf �Ȃǂ�redraw 1�ŕ\��������ʂ��X�V����Ȃ��Ȃ錻�ۂ��N����܂��B
���̂Ƃ�p1��1���w�肷���HCLini�̏��������ɉ�ʂ���u������܂����A���̌��ʂ������Ȃ錻�ۂ͒���܂��B��ʂ̍����Ȃ錻�ۂ�OpenGL�̏������ɂ����̂Ȃ̂�OpenGL�ŉ�ʕ`����s���ꍇ��p1��0�̂܂܂ő��v�ł��B
p2��1�ɂ����HCLini�ł̏��������ɁA����OpenGL�A�g�������ȃf�o�C�X�ł�������AOpenCL���A�E�g�I�u�I�[�_�[���s�ł͂Ȃ��C���I�[�_�[���s�����ł��Ȃ��f�o�C�X�ł���ꍇ�A�_�C�A���O���o�͂���悤�ɂ��܂��B
OpenGL�A�g���������ǂ�����HCLini�̌�ł�HCLGetDevGLflg����擾�ł��܂��B

%href
HCLbye

;--------

%index
HCLbye
HSPCL�����


%inst
HSPCL��������܂��B
HCLini�����s���Ă���ꍇ�Ō�ɂ���Ń�������������Ă��������B
HCLbye�����s�����Ƃ��_�C�A���O�́u����v���N���b�N��������
�����I��HCLbye�����s�����悤��hspcl32.as�ɂĐݒ肵�Ă���܂��B
�܂��A������d�ɌĂяo�����ꍇ�v��ʃG���[�ɂȂ邱�Ƃ�����܂��B

%href
HCLini
;--------

%index
HCLGetDeviceInfo_s
�f�o�C�X���擾

%prm
(int p1)
int p1�Fparam_name [in]

%inst
HCLSetDev �ŃZ�b�g�����f�o�C�X�̏��𕶎���Ŏ擾���܂��B
p1��param_name���w�肵�ĉ������B�߂�l�͕�����ɂȂ�܂��B
���l�Ŏ擾�������ꍇ��HCLGetDeviceInfo_i���g���ĉ������B

p1�͉��L��URL�̕\�ɂ���l����ЂƂI��Ŏw��ł��܂��B
���{��T�C�g�Fhttp://wiki.tommy6.net/wiki/clGetDeviceInfo
�p��T�C�g�Fhttps://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i
HCLGetDevCLflg
HCLGetDevfp64flg
HCLGetDevGLflg
;--------

%index
HCLGetDeviceInfo_i
�f�o�C�X���擾

%prm
(int p1,int p2)
int p1�Fparam_name [in]
int p2�Findex [in]

%inst
HCLSetDev �ŃZ�b�g�����f�o�C�X�̏��𕶎���Ŏ擾���܂��B
p1��param_name���w�肵�ĉ������B�߂�l��int�^�̐����ɂȂ�܂��B
�߂�l�̐��l���z��̏ꍇ�́Ap2��index���w�肷�邱�ƂŁAp2�Ԗڂ̗v�f�̏��𓾂邱�Ƃ��ł��܂��B
������Ŏ擾�������ꍇ��HCLGetDeviceInfo_s���g���ĉ������B

p1�͉��L��URL�̕\�ɂ���l����ЂƂI��Ŏw��ł��܂��B
���{��T�C�g�Fhttp://wiki.tommy6.net/wiki/clGetDeviceInfo
�p��T�C�g�Fhttps://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_s
HCLGetDevCLflg
HCLGetDevfp64flg
HCLGetDevGLflg
;--------


%index
HCLGetDevGLflg
�f�o�C�X���擾

%prm
()

%inst
HCLSetDev �ŃZ�b�g�����f�o�C�X�ŁAOpenGL��OpenCL�̘A�g���\���ǂ���int�^�ŕԂ��܂��B
�u0�v�Ȃ�g���Ȃ��A�u1�v�Ȃ�g����Ƃ������Ƃ��킩��܂��B
�A�g�Ƃ����̂͋�̓I�ɂ����ƁAOpenCL�łƂ�����W���v�Z���A���̍��W�f�[�^��VRAM�Ɏc�����܂܁AOpenGL�œǂݍ��݂��̍��W�ɓ_��ł��������ꍇ�Ȃǂł��B
����́ACPU���̃����������郁�C���������ɍ��W�f�[�^��߂��Ă��Ȃ��Ă����̂Ńf�[�^�]���̎��Ԃ�0�ɂȂ�`��܂ł���ɍ����ɍs�����Ƃ��ł���Ƃ������̂ł��B

�����A�g���ł��Ȃ��ꍇ�A��U���C���������ɍ��W�f�[�^��߂��Ă�����OpenGL�̖��߂ł��̍��W�ɓ_��ł��Ƃ͂ł��܂��B
����HCLCreateFromGLBuffer,HCLEnqueueAcquireGLObjects,HCLEnqueueReleaseGLObjects���g���Ȃ������ł��B

%href
HCLCreateFromGLBuffer
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
HCLGetDevCLflg
HCLGetDevfp64flg
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s

;--------

%index
HCLGetDevCLflg
�f�o�C�X���擾

%prm
()

%inst
HCLSetDev �ŃZ�b�g�����f�o�C�X�ŁAOpenCL���g���邩�ǂ�����int�^�ŕԂ��܂��B
�u0�v�Ȃ�g���Ȃ��A�u1�v�Ȃ�g����Ƃ������Ƃ��킩��܂��B

%href
HCLGetDevfp64flg
HCLGetDevGLflg
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s
;--------

%index
HCLGetDevfp64flg
�f�o�C�X���擾

%prm
()

%inst
HCLSetDev �ŃZ�b�g�����f�o�C�X�ŁAOpenCL��double�^���g���邩�ǂ�����int�^�ŕԂ��܂��B
�u0�v�Ȃ�g���Ȃ��A�u1�v�Ȃ�g����Ƃ������Ƃ��킩��܂��B

%href
HCLGetDevCLflg
HCLGetDevGLflg
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s

;--------


%index
HCLSetDev
�f�o�C�X�Z�b�g

%prm
int p1
int p1	�f�o�C�Xid [in]

%inst

�J�[�l�����߂�J�[�l���o�^�A�������m�ۂ����s����f�o�C�X���w�肵�܂��B
�ȉ��̖��߂����s����f�o�C�X�����̖��߂ōŏ��Ɏw�肵�܂��B

HCLBuildProgram
HCLCreateKernel
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer
HCLCopyBuffer
HCLDoKernel
HCLWaitTask

HCLSetDev��ǂ�ł��Ȃ��ꍇ�́A�J�����g�f�o�C�X�̓f�o�C�X0�ł��B
p1�ɂ�0�`(HCLDevCount-1)���w�肵�ĉ������B

%href
HCLBuildProgram
HCLCreateKernel
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer
HCLCopyBuffer
HCLDoKernel
HCLWaitTask

;--------

%index
fdim
�z��ϐ����쐬

%prm
p1,int p2
p1     : �ϐ�			[in]
int p2 : �z��			[in]

%inst
p1��float�z��ϐ��ɂ��܂�

;--------

%index
varsize
�ϐ��̃T�C�Y�擾

%prm
(var p1)
var p1 : �ϐ�[in]

%inst
p1�Ŏw�肳�ꂽ�C�ӂ̌^�̔z��ϐ��̊m�ۍς݃T�C�Y(byte)��Ԃ��܂��B
�i���̊֐���Kerupani129 Project �̃u���O��http://blogs.yahoo.co.jp/kerupani/13754300.html����q�؂������܂����j

;--------