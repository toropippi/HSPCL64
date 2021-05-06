;------------------------
;   OpenGL�֘A���샂�W���[��
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
OpenGL�֘A���샂�W���[��

%port
Win



;-------- ref --------

%index
HGLSetView
��ʏ�����

%prm

%inst
OpenGL�ŕ`����n�߂�ۂɕK�v��perspective���������Őݒ肵�܂��B
���g�͈ȉ��̂Ƃ���ł��B

#deffunc HGLSetView
	win_x=ginfo(12)
	win_y=ginfo(13)
	glViewport 0,0,win_x,win_y
	glMatrixMode GL_PROJECTION
	glLoadIdentity
	gluPerspective 65.0,1.0*win_x/win_y, 0.01,10000.0; //����̐ݒ�
	glPushMatrix
	glEnable GL_DEPTH_TEST
	view3D
	return

%href

;--------

;-------- ref --------

%index
HGLCreateBuffer
VRAM�쐬

%prm
var p1,var p2,int p3
var p1 : GL_mem_object id����������	[OUT]
var p2 : CL_mem_object id����������	[OUT]
int p3 : �m�ۂ���byte��			[in]

%inst
�O���t�B�b�N�{�[�h�Ȃǂ̃f�o�C�X��Ƀ��������m�ۂ��܂��B
�ȉ��̐}�ł����A�̃o�b�t�@���쐬�ł��閽�߂ł��B���̖��߂̓�����HCLCreateFromGLBuffer���g�p���Ă��܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


�����ō쐬�����o�b�t�@��OpenCL�Ōv�Z�������W���i�[���āAOpenGL��glDrawArrays�Ȃǂ��g���ē_��O�p�`(�v���~�e�B�u)��`�悵�������Ɏg���܂��B
�������邱�ƂŁA���t���[��CPU�����W�v�Z����GPU�ɓ]�������ɍςނ̂ŁA���ɍ����ɕ`�恕�v���~�e�B�u�̕ό`���\�ɂȂ�܂��B

�����ō쐬���ꂽCL_mem_object�ɑ΂���HCLDoKernel�����s����ۂɂ͕K��HCLEnqueueAcquireGLObjects��HCLEnqueueReleaseGLObjects��Y��Ȃ��悤���ӂ��ĉ������B

%href
HGLReleaseBuffer
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
;--------


;-------- ref --------

%index
HGLReleaseBuffer
VRAM�j��

%prm
int p1
int p1 : GL_mem_object id		[in]

%inst
�ȉ��̐}�ł����A�̃o�b�t�@��������閽�߂ł��B
�������߂�HCLReleaseBuffer�ł͉���ł��Ȃ��̂Œ��ӂ��ĉ������B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html


%href
HGLCreateBuffer
HCLEnqueueAcquireGLObjects
HCLEnqueueReleaseGLObjects
;--------


;-------- ref --------

%index
HGLWriteBuffer
VRAM�֏�������

%prm
int p1,array p2,int p3
int  p1 : GL_mem_object id		[in]
array p2: �z��ϐ�			[in]
int  p3 : ��������byte��		[in]

%inst
�z�X�g����f�o�C�X�փf�[�^��]�����܂��B
p1�ɂ�HGLCreateBuffer�ō쐬����GL_mem_object id ���Ap2�ɂ�HSP���ō쐬�����z��ϐ����g���ĉ������B


�ȉ��̐}�ł����A�̃o�b�t�@�ɑ΂��ăf�[�^���������݂܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

��HCLWriteBuffer�ő�p�ł��܂��B

%href
HGLReadBuffer
HGLCreateBuffer
HGLReleaseBuffer
;--------



;-------- ref --------

%index
HGLReadBuffer
VRAM����ǂݍ���

%prm
int p1,array p2,int p3
int  p1 : GL_mem_object id		[in]
array p2: �z��ϐ�			[in]
int  p3 : ��������byte��		[in]

%inst
�f�o�C�X����z�X�g�փf�[�^��]�����܂��B
p1�ɂ�HGLCreateBuffer�ō쐬����GL_mem_object id ���Ap2�ɂ�HSP���ō쐬�����z��ϐ����g���ĉ������B


�ȉ��̐}�ł����A�̃o�b�t�@����CPU���Ƀf�[�^��]�����܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

��HCLReadBuffer�ő�p�ł��܂��B

%href
HGLWriteBuffer
HGLCreateBuffer
HGLReleaseBuffer
;--------



;-------- ref --------

%index
HGLCreateTexture3
�����_�����O�\�e�N�X�`���쐬

%prm
var p1,var p2,var p3,var p4,int p5,int p6,int p7,int p8

var p1 : texid			[OUT]
var p2 : CL_mem_object id	[OUT]
var p3 : fboid			[OUT]
var p4 : rboid			[OUT]
int p5 : size_x			[in]
int p6 : size_y			[in]
int p7 : fmt			[in]
int p8 : type			[in]


%inst
�����_�����O�\�e�N�X�`�����쐬���܂��B
�ȉ��̐}�ł����D�̃e�N�X�`�����쐬���܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

�����OpenCL������������݁��ǂݍ��݂��ł��A�܂��e�N�X�`���Ƃ��ă|���S���ɓ\��t���邱�Ƃ��\�ŁA�������_�����O��Ƃ��Ă��g�����Ƃ��ł��܂��B
p1��texid�́AglBindTexture GL_TEXTURE_2D,texid�Ƃ����悤�Ɏg���΁A�|���S���Ƀe�N�X�`����\��t���邱�Ƃ��ł��܂��B(glBindTexture GL_TEXTURE_2D,0�Ńo�C���h����)
p2��CL_mem_object id��HCLDoKernel�Ŏg�p�ł���clid�ŁAOpenCL�J�[�l������ǂݏ����ł��܂��B
p3��fboid��glBindFramebuffer GL_FRAMEBUFFER, fboid�Ƃ����悤�Ɏg���΃����_�����O��Ƃ��Đݒ�ł�glBindFramebuffer GL_FRAMEBUFFER,0�Ńo�C���h�����ł��܂��B
p4��rboid�͓��Ɏg�����Ƃ͂Ȃ���������܂��񂪁AHGLCreateTexture3�ō쐬�����e�N�X�`���̔j���Ɏg���܂��B
p5�ɂ̓e�N�X�`��x�T�C�Y(�s�N�Z��)
p6�ɂ̓e�N�X�`��y�T�C�Y(�s�N�Z��)
p7�ɂ�GL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL ���w��ł��܂��B
p8�ɂ�GL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV ���w��ł��܂��B

p7��GL_RGBA�Ap8��GL_FLOAT���w�肷���HDR(�n�C�_�C�i�~�b�N�����W)�ȕ`����\�ƂȂ�܂��B


���̖��߂ō쐬�����e�N�X�`���ɑ΂��Ă�HGLReleaseTexture3�Ŕj�����Ă��������B

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture3
;--------


;-------- ref --------

%index
HGLReleaseTexture
�����_�����O�\�e�N�X�`�����

%prm
int p1,int p2,int p3

int p1 : texid			[in]
int p2 : fboid			[in]
int p3 : rboid			[in]


%inst
�ȉ��̐}�ł����B�C�̃e�N�X�`����j�����܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

%href
HGLCreateTexture3
;--------


;-------- ref --------

%index
HGLReleaseTexture3
�����_�����O�\�e�N�X�`�����

%prm
int p1,int p2,int p3

int p1 : texid			[in]
int p2 : fboid			[in]
int p3 : rboid			[in]


%inst
�ȉ��̐}�ł����D�̃e�N�X�`����j�����܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

%href
HGLCreateTexture
;--------


;-------- ref --------

%index
HGLCreateTexture2
�e�N�X�`���쐬

%prm
var p1,var p2,int p3,int p4,int p5,int p6


var p1 : texid			[OUT]
var p2 : CL_mem_object id	[OUT]
int p3 : size_x			[in]
int p4 : size_y			[in]
int p5 : fmt			[in]
int p6 : type			[in]


%inst
�e�N�X�`�����쐬���܂��B
�ȉ��̐}�ł����C�̃e�N�X�`�����쐬���܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

�����OpenCL���珑�����݁��ǂݍ��݂��ł��A�܂��e�N�X�`���Ƃ��ă|���S���ɓ\��t���邱�Ƃ��\�ȃe�N�X�`���ł��B
�����_�����O��Ƃ��Ďg���ɂ�HGLCreateTexture3���g�p���ĉ������B
p1��texid�́AglBindTexture GL_TEXTURE_2D,texid�Ƃ����悤�Ɏg���΁A�|���S���Ƀe�N�X�`����\��t���邱�Ƃ��ł��܂��B(glBindTexture GL_TEXTURE_2D,0�Ńo�C���h����)
p2��CL_mem_object id��HCLDoKernel�Ŏg�p�ł���clid�ŁAOpenCL�J�[�l������ǂݏ����ł��܂��B
p3�ɂ̓e�N�X�`��x�T�C�Y(�s�N�Z��)
p4�ɂ̓e�N�X�`��y�T�C�Y(�s�N�Z��)
p5�ɂ�GL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL ���w��ł��܂��B
p6�ɂ�GL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV ���w��ł��܂��B

�j����HGLReleaseTexture

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture
;--------


;-------- ref --------

%index
HGLCreateTexture1
�e�N�X�`���쐬

%prm
var p1,int p2,int p3,int p4,int p5


var p1 : texid			[OUT]
int p2 : size_x			[in]
int p3 : size_y			[in]
int p4 : fmt			[in]
int p5 : type			[in]


%inst
�e�N�X�`�����쐬���܂��B
�ȉ��̐}�ł����B�̃e�N�X�`�����쐬���܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

�e�N�X�`���Ƃ��ă|���S���ɓ\��t���邱�Ƃ��\�ȃe�N�X�`���ł��B���̖��߂ō�����e�N�X�`���͂܂��^�����ȏ�ԂȂ̂�HGLWriteTexture�œ��e�����������Ďg���܂��B

p1��texid�́AglBindTexture GL_TEXTURE_2D,texid�Ƃ����悤�Ɏg���΁A�|���S���Ƀe�N�X�`����\��t���邱�Ƃ��ł��܂��B(glBindTexture GL_TEXTURE_2D,0�Ńo�C���h����)
p2�ɂ̓e�N�X�`��x�T�C�Y(�s�N�Z��)
p3�ɂ̓e�N�X�`��y�T�C�Y(�s�N�Z��)
p4�ɂ�GL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL ���w��ł��܂��B
p5�ɂ�GL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV ���w��ł��܂��B

�j����HGLReleaseTexture

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture
HGLCreateTexture1_texload
;--------


;-------- ref --------

%index
HGLCreateTexture1_texload
�摜�e�N�X�`���쐬

%prm
var p1,str p2,int p3

var p1 : texid			[OUT]
str p2 : name			[in]
int p3 : flg			[in]

%inst
�t�@�C����ǂݍ���Ńe�N�X�`�����쐬���܂��B
�ȉ��̐}�ł����B�̃e�N�X�`�����쐬���܂��B
p3��1���w�肷��ƁA����color�Ŏw�肳�ꂽ�F�������F�Ƃ��ă��ɐݒ肳��܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html

�������̓�����HSP��1039�Ԗڂ̃o�b�t�@���g�p���Ă��܂��B

�j����HGLReleaseTexture

%href
HGLWriteTexture
HGLReadTexture
HGLReleaseTexture
HGLCreateTexture1
;--------



;-------- ref --------

%index
HGLWriteTexture
�e�N�X�`����������

%prm
int p1,array p2,int p3,int p4,int p5,int p6,int p7,int p8

int p1 : texid			[in]
array p2:data			[in]
int p3 : xoffset		[in]
int p4 : yoffset		[in]
int p5 : size_x			[in]
int p6 : size_y			[in]
int p7 : fmt			[in]
int p8 : type			[in]


%inst
CPU������GPU�̃e�N�X�`���Ƀf�[�^���������݂܂��B
�ȉ��̐}�ł����B�C�D�̃e�N�X�`���ɏ������݂��s���܂��B
p1�ɂ̓e�N�X�`��id
p2�ɂ�HSP���Ŋm�ۂ����z��ϐ�
p3�ɂ͏������ݐ��x�I�t�Z�b�g
p4�ɂ͏������ݐ��x�I�t�Z�b�g
p5�ɂ͏�������x�T�C�Y
p6�ɂ͏�������y�T�C�Y
���w�肵�ĉ������B
p7�ɂ�GL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL ���w��ł��܂��B
p8�ɂ�GL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV
���w��ł��܂��B

html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html




%href
HGLReadTexture
HGLReleaseTexture
;--------



;-------- ref --------

%index
HGLReadTexture
�e�N�X�`���ǂݍ���

%prm
int p1,array p2,int p3,int p4

int p1 : texid			[in]
array p2:data			[OUT]
int p3 : fmt			[in]
int p4 : type			[in]


%inst
GPU���̃e�N�X�`������CPU���փf�[�^��]�����܂��B
�ȉ��̐}�ł����B�C�D�̃e�N�X�`������f�[�^��ǂݍ��݂܂��B
p1�ɂ̓e�N�X�`��id
p2�ɂ�HSP���Ŋm�ۂ����z��ϐ�
���w�肵�ĉ������B

p3�ɂ�GL_RED, GL_RG, GL_RGB, GL_BGR, GL_RGBA, GL_BGRA, GL_RED_INTEGER, GL_RG_INTEGER, GL_RGB_INTEGER, GL_BGR_INTEGER, GL_RGBA_INTEGER, GL_BGRA_INTEGER, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_DEPTH_STENCIL ���w��ł��܂��B
p4�ɂ�GL_UNSIGNED_BYTE, GL_BYTE, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT, GL_UNSIGNED_BYTE_3_3_2, GL_UNSIGNED_BYTE_2_3_3_REV, GL_UNSIGNED_SHORT_5_6_5, GL_UNSIGNED_SHORT_5_6_5_REV, GL_UNSIGNED_SHORT_4_4_4_4, GL_UNSIGNED_SHORT_4_4_4_4_REV, GL_UNSIGNED_SHORT_5_5_5_1, GL_UNSIGNED_SHORT_1_5_5_5_REV, GL_UNSIGNED_INT_8_8_8_8, GL_UNSIGNED_INT_8_8_8_8_REV, GL_UNSIGNED_INT_10_10_10_2, and GL_UNSIGNED_INT_2_10_10_10_REV
���w��ł��܂��B
html{
<img src="./doclib/HSPCL32/thumbs/mem.png">
}html




%href
HGLReadTexture
HGLWriteTexture
HGLReleaseTexture
;--------




;-------- ref --------

%index
convRGBtoBGR
�t�H�[�}�b�g�ϊ�

%prm
array p1,array p2

array p1 : data				[in]
array p2 : data				[OUT]


%inst

1byte����RGBRGBRGB�E�E�Ə�񂪓����Ă����ꍇ�ABGRBGRBGR�E�E�Ƃ����悤��R��B�����ւ��ďo�͂��܂��B
p1�͓��́Ap2�͏o�͂ł��B


%href
convRGBAtoRGB
convRGBtoRGBA
;--------


;-------- ref --------

%index
convRGBAtoRGB
�t�H�[�}�b�g�ϊ�

%prm
array p1,array p2

array p1 : data				[in]
array p2 : data				[OUT]


%inst

1byte����RGBARGBARGBA�E�E�Ə�񂪓����Ă����ꍇ�ARGBRGBRGB�E�E�Ƃ����悤��A����菜���ďo�͂��܂��B
p1�͓��́Ap2�͏o�͂ł��B


%href

convRGBtoRGBA
convRGBtoBGR
;--------


;-------- ref --------

%index
convRGBtoRGBA
�t�H�[�}�b�g�ϊ�

%prm
array p1,array p2,int p3

array p1 : data				[in]
array p2 : data				[OUT]
int   p3 : flg				[in]


%inst

1byte����RGBRGBRGB�E�E�Ə�񂪓����Ă����ꍇ�ARGBARGBARGBA�E�E�Ƃ����悤��A��t�������ďo�͂��܂��B
p1�͓��́Ap2�͏o�͂ł��B
p3��1���w�肷��ƁA����color�Ŏw�肳�ꂽ�F�������F�Ƃ��ă��ɐݒ肳��܂��B


%href
convRGBAtoRGB
convRGBtoBGR
;--------



;-------- ref --------

%index
HGLgcopy
2D�摜�`��

%prm
int p1,int p2,int p3,int p4,int p5
p1=0�`(0) : texid				[in]
p2=0�`(0) : �R�s�[���̍���X���W			[in]
p3=0�`(0) : �R�s�[���̍���Y���W			[in]
p4=0�`    : �R�s�[����傫��X�i�h�b�g�P�ʁj	[in]
p5=0�`    : �R�s�[����傫��Y�i�h�b�g�P�ʁj	[in]

%inst
HGLCreateTexture���ō쐬���ꂽtexid��2D�ŕ`�悵�܂��B
pos�Ŏw�肵���|�W�V����������Ƃ���gcopy���l�ɃR�s�[���܂��B
gmode �ɂĂ̔������A�A���t�@�u�����h�ɂ͑Ή����Ă܂���B
�A���t�@�u�����h��

	glEnable GL_BLEND ;//�u�����h�̗L����
	glBlendFunc GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA

�Ńu�����h��L��������΂ł��܂��B

%href
HGLgrotate
;--------

;-------- ref --------

%index
HGLgrotate
2D�摜��]�`��

%prm
int p1,int p2,int p3,int p4,int p5,double p6,int p7,int p8
p1=0�`(0)   : texid						[in]
p2=0�`(0)   : �R�s�[���̍���X���W				[in]
p3=0�`(0)   : �R�s�[���̍���Y���W				[in]
p4=0�`      : �R�s�[���̃R�s�[����傫��X�i�h�b�g�P�ʁj		[in]
p5=0�`      : �R�s�[���̃R�s�[����傫��Y�i�h�b�g�P�ʁj		[in]
p6=0�`(0.0) : ��]�p�x(�P�ʂ̓��W�A��)				[in]
p7=0�`(?)   : X�T�C�Y						[in]
p8=0�`(?)   : Y�T�C�Y						[in]

%inst
HGLCreateTexture���ō쐬���ꂽtexid��2D�ŉ�]�`�悵�܂��B
pos�Ŏw�肵���|�W�V�����𒆐S�Ƃ���grotate���l�ɃR�s�[���܂��B
gmode �ɂĂ̔������A�A���t�@�u�����h�ɂ͑Ή����Ă܂���B
�A���t�@�u�����h��

	glEnable GL_BLEND ;//�u�����h�̗L����
	glBlendFunc GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA

�Ńu�����h��L��������΂ł��܂��B

%href
HGLgcopy
;--------














;-------- ref --------

%index
HGLmqoload
mqo�f�[�^���[�h

%prm
str p1,var p2
str p1 : name				[in]
var p2 : mqoid				[OUT]

%inst
p1�ɂ�mqo�t�@�C�����Ap2�ɂ�mqoid���������܂��B
����mqoid�͕`��⃂�f���̉�]�������Ɏg���܂��B


%href
HGLMqoDraw
HGLMqoSetPos
HGLMqoSetAng
HGLMqoSetScale
;--------

;-------- ref --------

%index
HGLMqoDraw
mqo�`��

%prm
int p1
int p1 : mqoid				[in]

%inst
p1��mqoid���w�肵�ĉ������B

%href
HGLMqoSetPos
HGLMqoSetAng
HGLMqoSetScale
HGLmqoload
;--------




;-------- ref --------

%index
HGLMqoSetScale
mqo�{���ύX

%prm
int p1,double p2,double p3,double p4
int p1    : mqoid				[in]
double p2 : scalex				[in]
double p3 : scaley				[in]
double p4 : scalez				[in]

%inst
p1��mqoid���w�肵�ĉ������B
p2�`p4��x,y,z�����̔{�����w�肵�ĉ������B
������OpenCL�̌v�Z����������܂��B�K��glClear�`glFinish�̊Ԃɓ���Ȃ��悤�ɂ��ĉ������B

%href
HGLMqoDraw
HGLMqoSetPos
HGLMqoSetAng
HGLmqoload
;--------



;-------- ref --------

%index
HGLMqoSetPos
mqo�ʒu�Z�b�g

%prm
int p1,double p2,double p3,double p4
int p1    : mqoid				[in]
double p2 : posx				[in]
double p3 : posy				[in]
double p4 : posz				[in]

%inst
p1��mqoid���w�肵�ĉ������B
p2�`p4��x,y,z�����̈ʒu���w�肵�ĉ������B
������OpenCL�̌v�Z����������܂��B�K��glClear�`glFinish�̊Ԃɓ���Ȃ��悤�ɂ��ĉ������B

%href
HGLMqoDraw
HGLMqoSetAng
HGLMqoSetScale
HGLmqoload
;--------


;-------- ref --------

%index
HGLMqoSetAng
mqo��]

%prm
int p1,double p2,double p3,double p4,double p5
int p1    : mqoid				[in]
double p2 : Quaternion.0			[in]
double p3 : Quaternion.1			[in]
double p4 : Quaternion.2			[in]
double p5 : Quaternion.3			[in]

%inst
p1��mqoid���w�肵�ĉ������B
p2�ɂ͉�]���������p�x
p3�`p5�ɂ͉�]���ƂȂ�x�N�g��(x,y,z)��P�ʃx�N�g���ŃZ�b�g���ĉ������B
������OpenCL�̌v�Z����������܂��B�K��glClear�`glFinish�̊Ԃɓ���Ȃ��悤�ɂ��ĉ������B

%href
HGLMqoDraw
HGLMqoSetPos
HGLMqoSetScale
HGLmqoload
HGLmulQuaternion
;--------



;-------- ref --------

%index
HGLmulQuaternion
�N�I�[�^�j�I���|�����킹

%prm
array p1,array p2
array p1  : Quaternion			[OUT]
array p2  : Quaternion			[in]

%inst
Quaternion��4�̗v�f������double�^�̔z��ϐ��ł��B
p1�ɉ�]�������鑤��Quaternion���w�肵�ĉ������B��]��̐��l��p1�ɑ������܂��B
p2�ɉ�]�����鑤��Quaternion���w�肵�ĉ������B
Quaternion�̌`���ł���
Q = rad, x, y, z
�̌`���ɂ��ĉ������Brad�͉�]�p�x���W�A���Ax,y,z�͉�]���ƂȂ鎲�̒P�ʃx�N�g���ł��B���ׂĕ��������_�Ƃ��܂��B

Q = (cos(��/2); xv�Esin(��/2), yv�Esin(��/2), zv�Esin(��/2))
�̌`���ł͂Ȃ����Ƃɒ��ӂ��ĉ������B


%href
HGLMqoSetAng
HGLRotate3dbyQuaternion
;--------


;-------- ref --------

%index
HGLRotate3dbyQuaternion
���W��]

%prm
array p1,array p2,array p3
array p1  : Vertex (x,y,z)			[in]
array p2  : Vertex (x,y,z)			[OUT]
array p3  : Quaternion				[in]

%inst
Quaternion���g����3�������W����]�����܂��B
p1�ɂ͉�]�O��3��x,y,z���W�����z��ϐ�
p2�ɂ͉�]���3��x,y,z���W���i�[����z��ϐ�
p3�ɃN�I�[�^�j�I�����w�肵�ĉ������B

%href
HGLmulQuaternion

;--------

























































