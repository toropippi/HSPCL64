;------------------------
;   �J�[�l���֘A
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
hspcl64.as ���C���N���[�h���Ă��������B

%type
64bit�����^�C��GPGPU�p�v���O�C��

%group
OpenCL�J�[�l���֘A

%port
Win

;-------- ref --------

%index
HCLCreateProgram
�J�[�l���v���O�����̃r���h

%prm
(str p1,str p2)
str p1 : �J�[�l���\�[�X�t�@�C���� 	[in]
str p2 : �r���h�I�v�V����,�ȗ���	[in]

%inst
�v���O����id��64bit int�^�ŕԂ�܂��B
p1�ɂ̓\�[�X�̃t�@�C���������ĉ������B
p2�ɂ̓r���h�I�v�V���������Ă��������B
��F"-D SCALE=111"

�R���p�C�����ꂽOpenCL�J�[�l���v���O�����́A���̃f�o�C�X��ł����g���܂���B
�Q�ȏ�̃f�o�C�X��œ����J�[�l�������s�������Ƃ��A���ꂼ��̃f�o�C�Xid��HCLSetDevice�ŃZ�b�g���Ȃ�����HCLCreateProgram�����s���ĉ������B

%href
HCLCreateProgramWithSource
HCLSetDevice
HCLCreateKernel
HCLReleaseProgram

;-------- ref --------

%index
HCLCreateProgramWithSource
�J�[�l���v���O�����̃r���h

%prm
(str p1,str p2)
str p1 : �J�[�l���\�[�X������		[in]
str p2 : �r���h�I�v�V����,�ȗ���	[in]

%inst
�v���O����id��64bit int�^�ŕԂ�܂��B
p1�ɂ̓\�[�X�̃f�[�^�����ĉ������B
p2�ɂ̓r���h�I�v�V���������Ă��������B
��F"-D SCALE=111"

�R���p�C�����ꂽOpenCL�J�[�l���v���O�����́A���̃f�o�C�X��ł����g���܂���B
�Q�ȏ�̃f�o�C�X��œ����J�[�l�������s�������Ƃ��A���ꂼ��̃f�o�C�Xid��HCLSetDevice�ŃZ�b�g���Ȃ�����HCLCreateProgramWithSource�����s���ĉ������B

%href
HCLCreateProgram
HCLSetDevice
HCLCreateKernel
HCLReleaseProgram

;--------
%index
HCLGetProgramBinary
�v���O�����o�C�i���쐬

%prm
(int64 p1)
int64 p1 : �v���O����id		[in]

%inst
�o�C�i��������str�^�ŕԂ�܂��B

���s�R�[�h��CR LF�ł͂Ȃ��ALF�݂̂̕�����ɂȂ��Ă���_�ɒ��ӂ��Ă��������B

%href
HCLCreateProgramWithSource
HCLCreateProgramWithBinary
;--------
%index
HCLCreateProgramWithBinary
�v���O�����o�C�i������v���O�����쐬

%prm
(str p1,str p2)
str p1 : �v���O�����o�C�i��������	[in]
str p2 : �r���h�I�v�V����,�ȗ���	[in]

%inst
�v���O����id��int64�^�ŕԂ�܂��B
p1�ɂ̓\�[�X�̃f�[�^�����ĉ������B
p2�ɂ̓r���h�I�v�V���������Ă��������B
��F"-D SCALE=111"

�R���p�C�����ꂽOpenCL�J�[�l���v���O�����́A���̃f�o�C�X��ł����g���܂���B
�Q�ȏ�̃f�o�C�X��œ����J�[�l�������s�������Ƃ��A���ꂼ��̃f�o�C�Xid��HCLSetDevice�ŃZ�b�g���Ȃ�����HCLCreateProgramWithBinary�����s���ĉ������B

%href
HCLGetProgramBinary
HCLCreateProgramWithSource
;------------

%index
HCLCreateKernel
�J�[�l���쐬

%prm
(int64 p1,str p2)
int64 p1 : �v���O����id		[in]
str p2 : �J�[�l���֐���		[in]

%inst
�J�[�l��id��64bit int�^�ŕԂ�܂��B

p2��p1�J�[�l���\�[�X���ɂ���u__kernel �v����n�܂�֐������u__kernel �v����̕�����Ŏw�肵�܂��B
�Ⴆ��p1�\�[�X���Ɂu__kernel void vector_add(__global float *A) {}�v�Ƃ����s�������p2�� "vector_add" ���w�肵�܂��B
�ȍ~�A�ϐ��̃Z�b�g��v�Z�͂��̃J�[�l��id�Ƃ����`�ŊǗ��A���s�ł��܂��B

%href
HCLSetDevice
HCLReleaseKernel
HCLSetKernel
HCLSetKrns

;--------

%index
HCLSetKernel
�J�[�l���Z�b�g

%prm
int64 p1,int p2,p3,int p4
int64 p1 : �J�[�l��id			[in]
int p2 : �����̏���p(x)�̎w��		[in]
    p3 : �����ɓn������(�萔��mem_object)[in]
int p4 : ���[�J���������t���O,�ȗ���	[in]
%inst
�J�[�l���̈������Ƀf�[�^��n���܂��B

HCLDoKernel�Ōv�Z����O�ɂ���ŃJ�[�l���̈�����\�߃Z�b�g���Ă����Ȃ���΂����܂���B


�Ⴆ�΃J�[�l�����̃\�[�X��

__kernel void vector_add(__global int *array1,int arg2) {}

�Ƃ������̂Ȃ�
HCLSetKernel p1,0,mem_object_A	//(��HCLCreateBuffer�ō쐬����mem_object id)	;�z��
HCLSetKernel p1,1,5	//����2
��2��ɓn��w�肵�܂��B

p2�́Avector_add�̈����̈�ԍ���0�ԂƂ��čl���܂��B

�P��Z�b�g����Ύ��Z�b�g�������܂œK�����ꑱ���܂��B
p3�ɂ�64bit int�^�A32bit int�^�A������^�ϐ��Adouble�^�ϐ����w��ł��܂��B

p4��0�ȊO�ɂ���ƁA���̈����̓��[�J���������i���L�������j�Ƃ��ēo�^����܂��B���[�J���������̓O���[�o�����������e�ʂ����Ȃ��������ɃA�N�Z�X���\�ȏ����ǎ�\�������ł��B
��̃��[�N�O���[�v���ł����l��ێ��ł��܂���B�����l�͐ݒ�s��0�܂��͕s��ł��B
����v�Z���A���̃X���b�h�Ə������L�������Ƃ��Ɏg���܂��B�ȉ��Q�ƁB
p4��0�ȊO�̂Ƃ��Ap4�ɂ͊m�ۂ��������[�J���������T�C�Y(byte)��int�Ŏw�肵�ĉ������Bp3�͖�������܂��B


���[�J���������̎g�����͈ȉ��̂Ƃ���ł�

��
�J�[�l���R�[�h
__kernel void vector_add(__global double *A, __global double *B, __local double block[] , int b, int n) {
	block[0]=1;//���L��������0�Ԗڂ�1����
�E�E�E�E�E

�ɑ΂���HSP�X�N���v�g�ł�HCLSetKernel��
HCLSetKernel p1,0,mem_object_dpA
HCLSetKernel p1,1,mem_object_dpB
HCLSetKernel p1,2,0,64 (��p3�ɂ�0���w��Ap4��64byte�܂�double�^*8�̋��L�����������Ƃ����Ӗ��AOpenCL�J�[�l���\�[�X���ł�block[0]�`block[7]���������[�N�O���[�v���ŋ��L���Ďg����)
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
�J�[�l���Z�b�g

%prm
int64 p1,p2,,,,,
int64 p1 : �J�[�l��id				[in]
p2�ȍ~ : �����ɓn������(�萔��mem_object)	[in]

%inst
�J�[�l���̈������܂Ƃ߂Ďw�肵�܂��B

HCLSetKernel p1,0,mem_object_dpA
HCLSetKernel p1,1,mem_object_dpB

�Ȃ�

HCLSetkrns p1,mem_object_dpA,mem_object_dpB

�ƂȂ�܂��B
�Ȃ����[�J���������̃T�C�Y�w��͂ł��܂���B

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
�J�[�l�����擾

%prm
(int64 p1)
int64 p1 : �J�[�l��id			[in]

%inst
�J�[�l���̖��O�𕶎���ŕԂ��܂��B

%href
HCLCreateKernel
;--------

%index
HCLCall
�J�[�l����������s

%prm
str p1,int p2,int p3,p4,p5,p6,,,,,
str p1:�J�[�l��������				[in]
int p2:�O���[�o���T�C�Y(1�������񏈗���)	[in]
int p3:���[�J���T�C�Y(1�������񏈗���)		[in]
p4�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in,out]
%inst

HCLCreateProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer���������J�[�l�������s���Č��ʂ𓾂܂��B
�Ⴆ��OpenCL�Ŕz��ɒl���������ޏ����������Ď��s����ƁAp4�ȍ~�Ɏw�肵��HSP�z��ϐ��Ɍ��ʂ��������܂�܂��B
p1�ɂ̓\�[�X�R�[�h�̕�����
p2�ɂ̓O���[�o���T�C�Y�i���s���������񏈗����j
p3�ɂ̓��[�J���T�C�Y
p4�ȍ~�ɂ̓J�[�l���ɓn���������w�肵�ĉ������B

p4�ȍ~�̈����̐���OpenCL�J�[�l�����̈����̐�������Ȃ��ƃG���[�ɂȂ�܂��B


������HCLCreateProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer,HCLWriteBuffer,HCLReadBuffer,HCLReleaseKernel,HCLReleaseProgram,HCLReleaseBuffer���g�p���Ă��܂��B
���̖��߂Ŋm�ۂ���VRAM���́A���̖��߂��I���܂łɕK���j������܂��B
HCLDoKernel�ƈႢ�A�^�X�N����������܂Ŏ��̖��߂ɂ���܂���B
�I�[�o�[�w�b�h���傫���̂ŁA���x�����߂���ꍇ�ɂ͌����܂���B

%href
HCLDoKernel
HCLCall2
HCLDokrn1
HCLDokrn2
HCLDokrn3
;--------

%index
HCLCall2
�J�[�l����������s

%prm
str p1,int p2,int p3,p4,p5,p6,,,,,
str p1:�J�[�l��������				[in]
int p2:�O���[�o���T�C�Y(1�������񏈗���)	[in]
int p3:���[�J���T�C�Y(1�������񏈗���)		[in]
p4�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in,out]
%inst

HCLCreateProgram,HCLCreateKernel,HCLSetKernel�������J�[�l�������s���Č��ʂ𓾂܂��B
�����HCLCall2�͈����𒼐�(?)�w��ł���̂ŁA��蒼�ϓI�ɏ������Ƃ��ł��܂��B
�܂�HCLCall��HSP�z��cl mem�łł��B

p1�ɂ̓\�[�X�R�[�h�̕�����
p2�ɂ̓O���[�o���T�C�Y�i���s���������񏈗����j
p3�ɂ̓��[�J���T�C�Y
p4�ȍ~�ɂ̓J�[�l���ɓn���������w�肵�ĉ������B

p4�ȍ~�̈����̐���OpenCL�J�[�l�����̈����̐�������Ȃ��ƃG���[�ɂȂ�܂��B

������HCLCreateProgram,HCLCreateKernel,HCLSetKernel���g�p���Ă��܂��B
HCLCall�ƈႢ�^�X�N����������O�Ɏ��̖��߂ɂ���܂�(�u���b�L���O���[�hoff)�B

HCLCall��HCLCall2�ł͑������̓��͕����񂪃v���O�C�������Ńn�b�V��������ۑ�����Ă���A�S������������̏ꍇ�A�O��̃r���h�������Ŏg���܂킷���Ƃ��ł���悤�ɂȂ��Ă��܂��B
�܂薈��J�[�l���\�[�X���R���p�C�����Ă���킯�ł͂Ȃ��̂ō����ł��B
����HCLDokrn1,2,3���߂̂悤�Ɉ����w��ƕ����ł��Ă�킯�ł͂Ȃ��̂ŁA�ׂ������Ƃ������Έ����w��̕��I�[�o�[�w�b�h�͂ǂ����Ă�����܂��B

%href
HCLDoKernel
HCLCall
HCLDokrn1
HCLDokrn2
HCLDokrn3

;--------

%index
HCLDoKernel
�J�[�l�����s

%prm
int64 p1,int p2,array p3,array p4,int p5
int64 p1 : �J�[�l��id			[in]
int p2 : work_dim(1�`3)			[in]
array p3 : global_work_size		[in]
array p4 : local_work_size		[in]
int p5 : event_id,�ȗ���		[in]
%inst

p1�ɂ͎��s�������J�[�l��id
p2�ɂ�1�`3 (work dimension���O���[�o�����[�N�T�C�Y�ƃ��[�J�����[�N�T�C�Y�̎���)
p3�ɂ͎������ɉ������O���[�o�����[�N�T�C�Y(���񏈗���)���L������ϐ�
p4�ɂ͎������ɉ��������[�J�����[�N�T�C�Y���L������ϐ�
���w�肵�Ă��������B
p4�̕ϐ��̓��e��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B
p5��event_id��-1�`65535�̒l���w��ł��܂��B�ȗ����f�t�H���g�ł�-1�ł��B
�J�[�l���̎��s��Ԃ��擾����ɂ�event���L�^����K�v������A0�`65535�̂Ƃ�����event�ԍ��ƃJ�[�l�����R�t������܂��B
�ȍ~�A���̔ԍ���event���e�̎擾(���s�󋵁A���s�J�n���ԁA���s�I�����ԂȂ�)���s���܂��B
�ԍ��̏㏑�����ł��܂����A�㏑�������O��event���͔j������܂��B

���̖��ߎ��͎̂��s����������܂ő҂��߂ł͂Ȃ��AOpenCL�R�}���h���L���[�ɓ���邾���ł���A���ۂ̃J�[�l���̎��s�I����҂ɂ�event���g����HCLFinish���ő҂��ƂɂȂ�܂��B
����͈ꌩ���G�Ȃ悤�Ɏv���܂����AGPU���v�Z���Ă���Œ���CPU���ʂ̃^�X�N�ɏ������񂹂�Ƃ������_������܂��B

��HCLDoKernel�ɂ���
���̖��߂�OpenCL�̓���p�Ƃ��āA�܂��ȈՂ�OpenCL�𗘗p�ł��邱�Ƃ�ړI�ɍ쐬�������߂ł��B
HCLCall�ł͎����I�ɏ������Ă����uHSP�ŗp�ӂ����z��ϐ���VRAM���Ɉڂ������v�u�X���b�h�̎����v��
����ݒ肵�Ȃ���΂Ȃ�܂���B
�������ݒ�ł��镔�������Ȃ�HCLCall�Ɣ�r���ď����̍������⎩�R�x�̍������Ƃ��\�ɂȂ�܂��B


HSP���[�U�[�Ƃ���HCLDoKernel�iOpneCL�v���O�C���j�𗘗p���鎞�A�����̏���T���₷���_�����X�g�A�b�v���܂����B
���̂��߂�OpenCL�𗘗p�����ł̓Ɠ��ȏ�����������܂��B

	1.OpenCL�p�̖��߃\�[�X��ʌp�ӂ���K�v������B�i�ȈՂ�C����ɂĕ\�L�j
	�����Ă��̃\�[�X��HSP��ŌŗL�̖��߁iHCLCreateProgram�j�œǂݍ��݁B

	2.���̃\�[�X�̊֐����u�J�[�l���v�ƌ����閽�ߒP�ʂ�HSP��ŌŗL�̖��߁iHCLCreateKernel�j�ō쐬����B


	3.�J�[�l���֐��ւ̈������Z�b�g����ہA���̈����́@CL_mem_object id�Ƃ����ŗL�̃I�u�W�F�N�g�`���ł���K�v������B
	CL_mem_object�@id��64bit int�^�̐��l�ł���B
	���̃I�u�W�F�N�g��p�ӂ���ɂ�HSP��ŌŗL�̖���HCLCreateBuffer�ɂč쐬����B
	�܂����̃I�u�W�F�N�g��HSP��ŗp�ӂ����z�����ꍞ�݂�������HSP��ŌŗL�̖���HCLWriteBuffer�ɂē��ꍞ�ށB
�@
	4.��قǃJ�[�l���֐��ɓ��ꍞ�ނ��߂̈������ŗL�̃I�u�W�F�N�g�`���ɂėp�ӂ����B
	���̈������J�[�l���֐��Ɉ������Z�b�g����Ƃ��ŗL�̖��߁iHCLSetKernel��HCLSetKrns�j���g�p���Ȃ���΂Ȃ�Ȃ��B 

	5.�����Ĉ������Z�b�g�����J�[�l�����ŗL�̖��߁iHCLDoKernel�j�Ŏ��s�B

	6.�����Ă��̌��ʂ��Q�Ƃ��鎞��HSP��̌ŗL�̖��߁iHCLReadBuffer�j�Ńf�[�^��߂��Ă��Ȃ���΂Ȃ�Ȃ��B

���̂悤�ȏ������K�v�ƂȂ�̂̓z�X�g���iCPU���j�ƃf�o�C�X���iGPU���j�̏���/�������Ǘ����ʌƂȂ��Ă��邩��ł��B
�Ȃ��֋X��GPU���Ə����Ă��܂����AOpenCL�f�o�C�X��Intel CPU��AMD CPU�̏ꍇ�����肦�܂��B���̏ꍇ�ł��������Ǘ����ʌł��邱�Ƃ͕ς��Ȃ��ł��B���܂�SVM�͎g���Ȃ�(ver1.x���_)


���C���f�N�X��Ԃɂ���
GPGPU�v���O���~���O�ɂ����āA�O���[�o�����[�N�T�C�Y�⃍�[�J�����[�N�T�C�Y�͂ƂĂ��d�v�ȊT�O�ɂȂ��Ă��܂��B
OpenCL�����łȂ�CUDA�ł��l���������܂��B


html{
<img src="./doclib/HSPCL64/thumbs/d22.png">
}html


���̐}�S�̂�NDRange

NDRange �T�C�Y Gx��global_work_size[0]���O���[�o�����[�N�A�C�e��x�̃T�C�Y�����̐}����4
NDRange �T�C�Y Gy��global_work_size[1]���O���[�o�����[�N�A�C�e��y�̃T�C�Y�����̐}����6

���[�N�O���[�v�T�C�YSx��local_work_size[0]�����[�J�����[�N�A�C�e��x�̃T�C�Y�����̐}����2
���[�N�O���[�v�T�C�YSy��local_work_size[1]�����[�J�����[�N�A�C�e��y�̃T�C�Y�����̐}����3

���[�N�A�C�e�����X���b�h�����̐}�Ō�����24���鐅�F�̔��B

�Ԙg���̉��F���Ƃ���(�O���[�v��)�ŋ��L���������g���܂��B
�uVRAM�v�Ɓu���L�������v�͈Ⴂ�܂��B

VRAM���r�f�I�������[���f�o�C�X�������[���O���[�o���������[��GDDR6�i�A�N�Z�X��Ԓx���j���J�[�l���\�[�X��__global�Ŏw�肵���ϐ�
���L�������[���P���L���b�V�������[�J���������[�i���������j���J�[�l���\�[�X��__local�Ŏw�肵���ϐ�
�v���C�x�[�g�������[�����W�X�^�i��ԑ����j���J�[�l���\�[�X�ŉ����w�肵�Ȃ��������̕ϐ�(uint ic�@�Ƃ��͂���������Ă���)

�v���O���}��OpenCL�Ńf�[�^���񏈗����s�����߂ɃC���f�N�X��Ԃ̎������A���[�N�T�C�Y�̑����A���[�J���T�C�Y���w�肷�邱�ƂŃC���f�N�X��Ԃ��`���Ȃ���΂Ȃ�܂���B(��q)

�ȉ���OpenCL C�ł̃O���[�o��id�Ȃǂ̎g�����ɂ��ċL�ڂ��܂��B

��
work_dim=2
global_work_size=4,6
local_work_size=2,3
���w�肵���Ƃ��܂��B

html{
<img src="./doclib/HSPCL64/thumbs/d22.png">
}html

������s�����X���b�h����4*6��24�ƂȂ�܂��B

���x�̓J�[�l�����̃T���v���ł��B
�J�[�l���\�[�X�ł�
__kernel void vector_add(__global double *A, __global double *B, __local double block[] , int bekii, int n) {
	int i0 = get_global_id(0);
	int i1 = get_global_id(1);
�E�E�E�E�E�E�E�E�E�v�Z���������E�E�E�E�E�E�E�E
}

�ƂȂ��Ă���Ƃ��܂��B
�J�[�l����24����쓮���܂������ꂼ�����������id������A���ꂪget_global_id�Ŏ擾�ł��܂��B

get_global_id(0)��0�`3��
get_global_id(1)��0�`5�����ꂼ��̃��[�N�A�C�e���ɖ߂��܂��B�i�ȉ��̐}�Q�Ɓj

get_local_id �̓��[�N�O���[�v���̎���id��߂��܂��B
get_local_id(0)��0�`1��
get_local_id(1)��0�`2�����ꂼ��̃��[�N�A�C�e���ɖ߂��܂��B�i�ȉ��̐}�Q�Ɓj

get_group_id�̓��[�N�O���[�v�̃O���[�v���ʔԍ���߂��܂��B
get_group_id(0)��0�`1
get_group_id(1)��0�`1�����ꂼ��̃��[�N�A�C�e���ɖ߂��܂��B�i�ȉ��̐}�Q�Ɓj

get_global_size�̓O���[�o���T�C�Y�ŁA�ǂ̃��[�N�A�C�e���ł��߂��l�͓����l��
get_global_size(0)��6
get_global_size(1)��3
�ƂȂ�܂��B

get_local_size�̓��[�J���T�C�Y�ŁA�ǂ̃��[�N�A�C�e���ł��߂��l�͓����l��
get_local_size(0)��2
get_local_size(1)��3
�ƂȂ�܂�

get_num_groups�̓O���[�v���ŁA�ǂ̃��[�N�A�C�e���ł��߂��l�͓����l��
get_num_groups(0)��3
get_num_groups(1)��1
�ƂȂ�܂�


�ȉ��A24�X���b�h�̊e�l�̐}

html{
<img src="./doclib/HSPCL64/thumbs/d2.png">
}html




��global_work_size�̎w��
���񐔂��w�肷����̂��Ǝv���Ă��������B
100�v�f�̔z�񂪂�����1�X���b�h��1�̗v�f�ɃA�N�Z�X����悤�ȏ����̏ꍇ�A1����100����œ������̂ŁAglobal_work_size[0]��100�Ƃ��܂��B

�摜�̂悤�ȃf�[�^�ɏ������{���ꍇ�́A2������256*256����ȂǂƂ������Ƃ��ł��܂��B

��local_work_size�̎w��
��قǂ�global_work_size���ǂ̂悤�ɕ������邩�A�Ƃ����̂����ϓI�Ȑ������Ǝv���܂��B
�܂芄��؂��Ή��ł������킯�ł����A�v�Z���x�ɒ�������̂ŏd�v�ȍ��ڂł��B

���_���猾����64,128,256�̂ǂꂩ���w�肷��ΊO��͂���܂���B
global_work_size�����[�Ȑ��ŏ�L�̐��Ŋ���؂�Ȃ��ꍇ�́Aglobal_work_size�𑝂₵�Ăł�����؂�鐔���ɂ����ق����ǂ��ł��B

�E�ڍא���
global_work_size��1024��local_work_size��64�ɂ����Ƃ��܂��B
�����������1�O���[�v(=1�̃��[�N�O���[�v)��64�̃X���b�h�������Ă����Ԃł��B1024/64=16�Ȃ̂�16�O���[�v���݂��܂��B
������1�O���[�v�͈ȉ��̋@�\���g���܂��B

    �E���L������������΁A���L�����������L�ł���B

���̋@�\�̂��߂ɁA�����O���[�v�ɑ�����X���b�h�͕K�������CU(SM)�Ŏ��s����܂��B
��ʓI��NVIDIA��GPU����1SM������64,128,192��CUDA Core������AAMD��GPU����1CU������64��PE������A����CUDA core��PE���������s�Ȃ��܂��B

NVIDIA��Turing�A�[�L�e�N�`���ł�����1SM������64CUDA Core����A���ꂪ16+16+16+16�ƕ�����Ă��܂��B
����1�~16CUDA core��1��Warp(*1)��2cycle�����ď������܂��B
*1:Warp�Ƃ�32�X���b�h�̂܂Ƃ܂�̂���

1�O���[�v=64�X���b�h�Ȃ̂ŁA2��Warp�ɂ����܂�܂��B
�S����16�O���[�v����̂őS����Warp��32���邱�ƂɂȂ�܂��BWarp�ԍ�0�`31������U���Ă���Ƃ��܂��B

�܂������ł�1SM����16�O���[�v=32Warp�S�������s�����Ƃ��āA����FMA(c=a*b+c)��1���s����Ƃ����
��قǂ̇@16+�A16+�B16+�C16��CUDA Core��
1,2cycle��
�@:Warp0
�A:Warp1
�B:Warp2
�C:Warp3

3,4cycle��
�@:Warp4
�A:Warp5
�B:Warp6
�C:Warp7

5,6cycle��
�@:Warp8
�A:Warp9
�B:Warp10
�C:Warp11

7,8cycle��
�@:Warp12
�A:Warp13
�B:Warp14
�C:Warp15

9,10cycle��
�@:Warp16
�A:Warp17
�B:Warp18
�C:Warp19

11,12cycle��
�@:Warp20
�A:Warp21
�B:Warp22
�C:Warp23

13,14cycle��
�@:Warp24
�A:Warp25
�B:Warp26
�C:Warp27

15,16cycle��
�@:Warp28
�A:Warp29
�B:Warp30
�C:Warp31


���̂悤�Ɏ��s����A1024��FMA�����s�ł������ƂɂȂ�܂��B

���ۂ�SM����70��������ł����Ƙb�͕��G�Ȃ̂ł����A���̂悤�ȗ���ł��邱�Ƃ�CUDA�ł�Compute Shader�ł��ς��܂���B
AMD GPU��GCN�A�[�L�e�N�`������1CU=16PE+16PE+16PE+16PE��16PE��4cycle��1wavefront(64thread)�����s���܂��B

�Ȃ̂ŁAlocal_work_size��32�Ŋ���؂�Ȃ����Warp�ɂ��܂������܂�Ȃ��̂ŋ��肷��Core���łĂ��Ă��܂��A�v�Z��������ɂȂ��Ă��܂��܂��B
AMD GPU�̂��Ƃ��l�����64�Ŋ���؂�邱�Ƃ��K�v�ɂȂ�܂��B

�Ȃ̂Ŗ`���ɏ�����64,128,256���ǂ��Ƃ������_�ɂȂ�A512,1024�͈ꕔ��GPU�ŃG���[���o��̂ł����܂ő傫�����͎w�肵�Ȃ��ق�������A�Ƃ����l���ɂȂ�܂��B
�����܂Ŏ��̍l���Ȃ̂ŁA�����͂Ȃ����̂��Ƃ͎v���܂��B���ɓI�ɂ�local_work_size��S�p�^�[�������čő��̂��̗p����̂��ǂ��ł��B


���g�p����
(1)
�ꕔ��GPU�ł́A�O���[�o�����[�N�T�C�Y�̓��[�J�����[�N�T�C�Y�Ő����ł��Ȃ���΂����܂���B
dim globalsize,3
dim localsize,3
globalsize=2048,2048,7
localsize=8,8,4
�ł������ꍇ�Aglobalsize.2��localsize.2�Ŋ���؂�Ȃ����߂ɃG���[�ƂȂ�܂��B������AMD�̃O���{��ŐV��NVidia�̃O���{�A�ꕔ��CPU�ł̓G���[�ɂȂ�Ȃ����Ƃ�����܂��B�G���[�̏ꍇ
�uglobal_work_size��local_work_size �Ő����ł��Ȃ��A�܂���local_work_size[0]*local_work_size[1]*local_work_size[2]���A��̃��[�N�O���[�v���̃��[�N�A�C�e�����̍ő�l�𒴂����v
�Ƃ������b�Z�[�W���o�܂��B


���J�[�l���\�[�X�ɂ���
(1)
�g�����\�I�ȉ��Z�q
=	���
!=	������
==	������
>	������
<	������
>=	������
<=	������
>>	�E�V�t�g
<<	���V�t�g
��	a��b�@��a��b�Ŋ������]���Ԃ��i����ɂ��S�p�j
/	����Z
*	�|���Z
+	�����Z
-	�����Z
--	-=1�Ɠ��Ӗ�
++	+=1�Ɠ��Ӗ�
&var	�ϐ�var�̃|�C���^�B�g���h�R���Ƃ��Ă͎���֐��̏o�͒l�ɕϐ����Z�b�g�������Ƃ��i�ނ��낻�ꂾ���j
*var	var���|�C���^�ł��邱�Ƃ��O��B�u*var�v��var�̎w���|�C���^�ʒu�̕ϐ��B�g���h�R���Ƃ��Ă͊֐��̏o�͒l�̐錾�Ȃ�
->	�Ԑڃ����o�Q�Ɖ��Z�q

(2)
�g�����\�I�Ȍ^
u��unsigned�̈Ӗ�
1bit�ϐ�
�Ebool 0�`1
1byte�ϐ�
�Euchar 0�`255
�Echar -128�`127
2byte�ϐ�
�Eushort 0�`65536
�Eshort -32768�`32767
4byte�ϐ�
�Efloat -���`+��
�Euint 0�`��40��
�Eint -��20���`+��20��
8byte�ϐ�
�Edouble -���`+��
�Eulong 0�`��1800��
�Elong -��900���`+��900��

(3)
�^�ϊ�
uint a;
uchar b=1;
a=b;//����ł�������
a=(uint)b;//���̂ق����G���[��h����

������
float ftmp;
int i0=123;
ftmp=(float)i0;//ftmp�ɂ�123.0000����������

(4)
�֐�
�u__global �v��VRAM��̕ϐ����g���Ƃ����Ӗ�
�u__local�v�̓��[�J����������̕ϐ����g���Ƃ����Ӗ�

(5)
�g����֐��A���߁A���Z�q�ȂǏڍׂɒm�肽������
https://www.khronos.org/files/opencl-quick-reference-card.pdf
��


���Ō��
���ꂾ���ł͂܂������ł��Ȃ����Ǝv���܂����A�{�v���O�C���t���̃T���v���̃R�����g��A�h�L�������g���ǂ�ł�����������ȂƎv���܂��B
������OpenCL�̑S�e�𗝉�����̂ɏ����ł����ɗ��Ă΂����Ǝv���Q�l�ƂȂ郊���N���ڂ��Ă����܂��B

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
�ꎟ���ŃJ�[�l�����s

%prm
int64 p1,int p2,int p3,int p4
int64 p1 : �J�[�l��id			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]
int p4 : event_id,�ȗ���		[in]

%inst
�����work_dim��1�̏ꍇ��HCLDoKernel�Ɠ����ł��B

p3��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B
p4��event_id��-1�`65535�̒l���w��ł��܂��B�ȗ����f�t�H���g�ł�-1�ł��B�ڍׂ�HCLDokernel���Q�Ƃ��������B

�����̖��߂��g���O��
LV3	HCLDoKrn1�`3�𗘗p����OpenCL
OpenCL�iGPGPU�j�̏���������⏕���邽�߂Ƀ��x�����R�i�K�ɕ����Ă���܂�����
HCLDoKrn1�`3��LV3�ƂȂ��Ă���܂��B


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
�ꎟ���ŃJ�[�l�����s

%prm
int64 p1,int p2,int p3,int p4
int64 p1 : �J�[�l��id			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]
int p4 : event_id,�ȗ���		[in]

%inst

���̖��߂ł�global_work_size��local_work_size�Ŋ���؂�Ȃ��ꍇ�A�G���[���o�����ɃJ�[�l����2��ɓn����s������̂ł��B

HCLDoKrn1�ł�global_work_size��local_work_size�Ŋ���؂�Ȃ���΂����܂���ł����B
����local_work_size��0���w�肵��OpenCL�����ɂ܂����Ă��Aglobal_work_size���f���̏ꍇlocal_work_size��1�ɂ���Ă��܂����Ƃ�����A���̏ꍇ�v�Z��������ɂȂ��Ă��܂��܂��B

���̖��߂ł�1��ڂ�local_work_size�Ŋ���؂�镪������global_work_size�����s���A2��ڂɂ��܂�̒[����local_work_size��global_work_size�Ƃ��Ď��s���܂��B���̂Ƃ��uget_global_id(0)�v����������n�܂�悤�ɂȂ��Ă��܂��B
�������uget_group_id(0)�v�̒l��0�ɂȂ��Ă��܂��܂��B
p3��0�͎w��ł��܂���B
p4��event id�͏ȗ����f�t�H���g��-1�ŁA0�`65535�̒l���w��ł��܂����L�^�����̂́u�[������Ȃ����̃J�[�l���v�݂̂ł��B


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
�j�����ŃJ�[�l�����s

%prm
int64 p1,int p2,int p3,int p4,int p5
int64 p1 : �J�[�l��id			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : local_work_size.0		[in]
int p5 : local_work_size.1		[in]
int p6 : event_id,�ȗ���		[in]
%inst
work_dim��2�̏ꍇ��HCLDoKernel�Ɠ����ł��B

p4��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B

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
�O�����ŃJ�[�l�����s

%prm
int64 p1,int p2,int p3,int p4,int p5,int p6,int p7
int64 p1 : �J�[�l��id			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : global_work_size.2		[in]
int p5 : local_work_size.0		[in]
int p6 : local_work_size.1		[in]
int p7 : local_work_size.2		[in]
int p8 : event_id,�ȗ���		[in]

%inst
work_dim��3�̏ꍇ��HCLDoKernel�Ɠ����ł��B

p5��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B

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
OpenCL�R�}���h�҂�

%prm

%inst

�����R�}���h�L���[���ɓ����ꂽOpenCL�R�}���h�̎��s�����ׂďI���܂ő҂��܂��B
�����Ō���OpenCL�R�}���h�Ƃ�
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

�̖��߂Ŕ��s�������̂ɂȂ�܂��B

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
OpenCL�R�}���h�𔭍s

%prm

%inst

HCLSetDevice�Ŏw�肵�Ă���f�o�C�X�̂��ׂẴR�}���h�L���[�ɓ����ꂽ�S�Ă�OpenCL�R�}���h�𔭍s���܂��B

�����Ō���OpenCL�R�}���h�Ƃ�

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
�̖��߂Ŕ��s�������̂ɂȂ�܂��B

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
�R�}���h�L���[�ԍ����Z�b�g

%prm
int p1
int p1 : �R�}���h�L���[�ԍ�	[in]

%inst

HCLSetDevice�Ŏw�肵�Ă���f�o�C�X�̂����A�g����R�}���h�L���[��0�`3�܂ł���܂��B
�f�t�H���g�ł�0�ł��B
���L���߂͎w�肵���R�}���h�L���[��OpenCL�R�}���h�Ƃ��ē�����s����܂��B

HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLFillBuffer

�����f�o�C�X�ł��Ⴄ�R�}���h�L���[�ɓ����ꂽOpenCL�R�}���h�́A���s���Ŏ��s����܂��B
�Ⴆ�Γ����������Ƀf�[�^���������ރJ�[�l����ʁX�̃R�}���h�L���[�ɂ���Ď��s����ƁA�J�[�l���������Ɏ��s�����\��������A�������ɂ͂��ꂼ��̃J�[�l�����������񂾒l�����݂��Ă���\��������܂��B
���G�ŕs�ւȂ悤�Ɏv���܂����AOpenCL�R�}���h�̃I�[�o�[���b�v���s���\�ɂȂ�A�g�����ɂ���Ă͑��x�ʂŗL���ɂȂ�܂��B

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
�Z�b�g���Ă���R�}���h�L���[�ԍ����擾

%prm
()

%inst
HCLSetCommandQueue�ŃZ�b�g�����ԍ���Ԃ��܂��B
;--------
%index
HCLReleaseKernel
�J�[�l���j��

%prm
int64 p1
int64 p1 : �J�[�l��id			[in]

%inst

�o�^�J�[�l����j�����܂��B

%href
HCLCreateKernel
;--------

%index
HCLReleaseProgram
�v���O�����j��

%prm
int64 p1
int64 p1 : �v���O����id			[in]
%inst

�o�^�R���p�C���ς݃v���O������j�����܂��B

%href
HCLCreateProgram
;--------


%index
HCLDoXc
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
�Z�k�L�@�J�[�l�����s

%prm
str p1,p2,p3,p4,p5,,,,,
str p1:�Z�k�L�@�J�[�l��������		[in]
p2�ȍ~:�����ɓn������(array��var int�Ȃǂ̐��l)	[in]
%inst

�J�[�l�������s���܂��B

�܂�HCLDoXc,HCLDoXi,HCLDoXl,HCLDoXuc,HCLDoXui,HCLDoXul,HCLDoXf,HCLDoXd��8��ނ̈Ⴂ�ł���
c,i,l,uc,ui,ul,f,d�����ꂼ��char,int,long,uchar,uint,ulong,float,double�ɑΉ����Ă��܂��B
���̌^���́A��{�I��global�ϐ��̌^�̉��߂Ƃ��Ďg���܂��B

��HCLDoX�n���߂ɂ���
�������̕������OpenCL �J�[�l���R�[�h�ɂȂ�܂��B

�������ʂƈႤ�̂�__global float *A�ȂǂƐ錾���ĂȂ����Ƃł��B
������̃R�[�h���v���O�C�������ŉ��߂��A1�����̑啶����global�ϐ��A1�����̏�������private�ϐ��Ƃ��Ď����I�ɐ錾���ǉ�����܂��B

A,B,C��a�Ƃ���1�����ϐ���Z�k�L�J�[�l���Ŏg����
	__global int *A,__global int *B,__global int *C,int a
�Ƃ����錾���v���O�C�������ɂ���Ēǉ�����Ă��邱�ƂɂȂ�܂��B


���^�ɂ��Ă�
global�ϐ��̏ꍇ�AHCLDoXi��int�^�Ɍ��肳��܂��B
private�ϐ��̏ꍇ�AHSP���œ��͂��������̌^�����̂܂܍̗p����܂��B

��������s��
global_size��local_size�ł����Alocal_size��64�Œ�Aglobal_size��
�O���[�o���ϐ�A�ɑΉ�����Buffer�̃T�C�Y���猈�肳��܂��B
�Ⴆ��HCLDoXi���߂ŁAcl�@mem�Ƃ��ăT�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
HCLDoXi�Ȃ̂�int�^�Ɖ��߂��Ă���sizeof(int)=4�Ŋ�����
global_size=1024/4=256
�Ƃ������ƂɂȂ�܂��B

���������ϐ��ɂ���(1����)
��O�Ƃ��Ắui�v�uj�v�uk�v�ux�v�uy�v�uz�v������܂��B
i��
	int i = get_global_id(0);
�Ƃ����悤�ɐ錾����Ă��荡��́ua�v�̂悤�Ȏg�����͂ł��܂���B
j,k,x,y,z��private�ϐ��̐錾�ɂ͎g��ꂸ�A���ʂɃR�[�h����
	float x=1.2;
�Ǝg�����Ƃ��ł��܂��B

���������ϐ��ɂ���(2�����ȏ�)
�uli�v�Ƃ����ϐ���
	int li = get_local_id(0);
�Ɛ錾����Ă��܂��B


���啶���ϐ��ɂ���(2�����ȏ�)
1�����̑啶����global�ϐ��Ɖ��߂���܂����A�^�ɂ��Ă͗Ⴆ��HCLDoXd�Ȃ�S��double�ƌ��ߑł�����Ă��܂��܂��B
������global�ϐ��̌^�𖾎��I�ɁA�ȒP�ɋL����悤�ȉ��̂悤�ȋK����݂��Ă��܂��B
	C0 �`C9 	:	global�ϐ���char�^�Ɖ���
	UC0�`UC9	:	global�ϐ���unsigned char�^�Ɖ���
	I0 �`I9 	:	global�ϐ���int�^�Ɖ���
	UI0�`UI9	:	global�ϐ���unsigned int�^�Ɖ���
	L0 �`L9 	:	global�ϐ���long long�^�Ɖ���
	UL0�`UL9	:	global�ϐ���unsigned long long�^�Ɖ���
	F0 �`F9 	:	global�ϐ���float�^�Ɖ���
	D0 �`D9 	:	global�ϐ���double�^�Ɖ���


�������R�[�h���ɕK���uA�v��uB�v�Ȃǂ̔��p1�����̑啶�����g���Ă��Ȃ��Ƃ����܂���B
�����global_size�����߂�ۂɁA����1�����ϐ�����ɂȂ邩��ł��B

HCLDoX�n���߂Ɉ�����^���鏇�Ԃł���
�P ���p1�����啶���ϐ�A-Z
�Q C D F I L UC UI UL
�R ���p1�����������ϐ�a-z
�̏��ɂȂ�܂��B


�܂�S0�`S9�Ƃ�����������Ӗ��������܂��B
S��Shared memory��S�ł���
	S0	:	1�v�f��Shared memory
	S1	:	2�v�f��Shared memory
	S2	:	4�v�f��Shared memory
	S3	:	8�v�f��Shared memory
	S4	:	16�v�f��Shared memory
	S5	:	32�v�f��Shared memory
	S6	:	64�v�f��Shared memory
	S7	:	128�v�f��Shared memory
	S8	:	256�v�f��Shared memory
	S9	:	512�v�f��Shared memory

�^��HCLDoXf�Ȃ�float�^�ƌ��肳��܂��B


OUT�Ƃ����������Ӗ��������܂��B
�܂�HCLDoX�n���߂͊֐��Ƃ��Ďg�����Ƃ��ł��A�V����cl_mem���쐬���Ԃ����Ƃ��ł��܂��B
�J�[�l���R�[�h����OUT�Ə����Ă���Ƃ��낪�A�o�̓������o�b�t�@�ɂ�����܂��B
�J�[�l���R�[�h���ł�HCLDoXf�̏ꍇOUT��float�^�ł��胁�����̃T�C�Y�́uA���v�Ɠ������̂�����܂��B

��1�����啶���ϐ��ŃA���t�@�x�b�g���ōŏ��ɂ������(�܂�HCLDoX�n���߂̑�2�����ɂ��������)�Ɠ����T�C�Y�A�^�Ƃ��č쐬�����Ƃ����K��������܂��B

�����J�[�l���R�[�h����OUT���g�p���Ă��Ă��AHCLDoX�n���߂𖽗ߌ`(�֐��ł͂Ȃ�)�Ƃ��Ďg�����ꍇOUT�͈�x�쐬����܂����v���O�C�������ł����j������܂��B

���f�t�H���g�֐�
�f�t�H���g�ݒ肳��Ă���֐�������
	uint RND(uint s) {
		s*=1847483629;
		s=(s^61)^(s>>16);
		s*=9;
		s=s^(s>>4);
		s*=0x27d4eb2d;
		s=s^(s>>15);
		return s;
	}

����ɂ��RND()�֐����f�t�H���g�Ŏg�����Ƃ��ł��܂��B

�܂�#define�ŉ��L�������o�^����Ă���g�����Ƃ��ł��܂��B
	#define REP(j, n) for(int j = 0; j < (int)(n); j++)
	#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);


���R�[�h�̎g���񂵂ɂ���
HCLDoX�n���߂�HCLCall��HCLCall2���A���͕�����̓n�b�V��������A�ߋ��ɓ���������ŃJ�[�l�������s�������Ƃ�����Ȃ��
������̃R���p�C�����X�L�b�v��kernel id���g���񂷂��ƂŃI�[�o�[�w�b�h���ɗ͂ւ炷�d�l�ɂȂ��Ă��܂��B
�������A�قȂ�f�o�C�Xid�ŃR���p�C���������͓̂����R�[�h������ł����Ă��ʕ��Ɖ��߂��܂��B

���������ē����f�o�C�X�œ����R�[�h����������x�����s���Ă��A�ŏ���1��̂ݑ傫�ȃI�[�o�[�w�b�h�����邾����
2��ڈȍ~�̎��s��HCLDokrn1,2,3�Ɠ������炢�A�C�ɂȂ�Ȃ����x�̃I�[�o�[�w�b�h�ɂȂ�͂��ł��B
�Ⴆ��1�b��10000��HCLDoX�n���߂����s����Ȃ�ʂł����E�E�E���̏ꍇHCLDokrn1,2,3�n���߂̂ق������炩�ɃI�[�o�[�w�b�h�Ƃ����ϓ_�ł͍����ɂȂ�ł��傤�B(�������GPU��̃J�[�l���R�[�h�̎��s���x�͕ς��Ȃ�)



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
sgemm�J�[�l�����s C=A*B

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[C]CL_mem_object id			[in]
int64 p2:[A]CL_mem_object id			[in]
int64 p3:[B]CL_mem_object id			[in]
int p4:[C]�]�u�t���O,�ȗ���			[in]
int p5:[A]�]�u�t���O,�ȗ���			[in]
int p6:[B]�]�u�t���O,�ȗ���			[in]

%inst

C=A�~B�̍s��s��ς��s�Ȃ��܂��B
�v���O�C�������ɖ��ߍ��܂�Ă���J�[�l���Ŏ��s����܂��B

�]�u�t���O��0�œ]�u�Ȃ��A1�œ]�u����ɂȂ�܂��B
A,B�ɂ�HCLBLAS_Set2DShape
�ł��炩����cl mem�ɍs�A��̃T�C�Y��ݒ肵�Ă����K�v������܂��B

���߂Ƃ��Ď��s���邱�Ƃ��ł��܂����A�֐��Ƃ��Ď��s���邱�Ƃ��ł��܂��B
���̍ۂ�
C=HCLBLAS_sgemm(A,B,0,0,0)
�̂悤�Ɏg���܂��B
���̏ꍇ�AC�ɂ͐V����HCLCreateBuffer�Ŋm�ۂ��ꂽmem id���Ԃ���܂��B


%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;----------------

%index
HCLBLAS_dgemm
dgemm�J�[�l�����s C=A*B

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[C]CL_mem_object id			[in]
int64 p2:[A]CL_mem_object id			[in]
int64 p3:[B]CL_mem_object id			[in]
int p4:[C]�]�u�t���O,�ȗ���			[in]
int p5:[A]�]�u�t���O,�ȗ���			[in]
int p6:[B]�]�u�t���O,�ȗ���			[in]

%inst

C=A�~B�̍s��s��ς��s�Ȃ��܂��B
�v���O�C�������ɖ��ߍ��܂�Ă���J�[�l���Ŏ��s����܂��B

�]�u�t���O��0�œ]�u�Ȃ��A1�œ]�u����ɂȂ�܂��B
A,B�ɂ�HCLBLAS_Set2DShape
�ł��炩����cl mem�ɍs�A��̃T�C�Y��ݒ肵�Ă����K�v������܂��B

���߂Ƃ��Ď��s���邱�Ƃ��ł��܂����A�֐��Ƃ��Ď��s���邱�Ƃ��ł��܂��B
���̍ۂ�
C=HCLBLAS_sgemm(A,B,0,0,0)
�̂悤�Ɏg���܂��B
���̏ꍇ�AC�ɂ͐V����HCLCreateBuffer�Ŋm�ۂ��ꂽmem id���Ԃ���܂��B


%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;--------
%index
HCLBLAS_Set2DShape
cl mem id�ɍs�Ɨ��ݒ肷��

%prm
int64 p1,int p2,int p3
int64 p1:CL_mem_object id			[in]
int p2:�s(raw)�̐�			[in]
int p3:��(col)�̐�			[in]

%inst
cl mem�ɍs�A��̃T�C�Y��ݒ肵�܂��B
HCLBLAS_sgemm���߂�HCLBLAS_dgemm���߂��g���ۂɂ��炩���ߍs�A��𐳂����ݒ肵�Ă����K�v������܂��B


%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;--------

%index
HCLBLAS_Get2DShape
cl mem id�ɍsor����擾����

%prm
(int64 p1,int p2)
int64 p1:CL_mem_object id			[in]
int p2:0 or 1

%inst
cl mem�̍s�A��̃T�C�Y���擾���܂��B
p2��0�Ȃ�s�A1�Ȃ�񂪕Ԃ���܂��B

%href
HCLBLAS_Set2DShape
HCLBLAS_Get2DShape
HCLBLAS_sgemm
HCLBLAS_dgemm
;--------

%index
HCLBLAS_sT
cl mem id��float�^�ōs��]�u

%prm
int64 p1,int64 p2
int64 p1:CL_mem_object id			[in]
int64 p2:CL_mem_object id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���float�^�Ƃ��ĉ��߂��A�s��]�u�������̂�p2�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���float�^�Ƃ��ĉ��߂��A�s��]�u����������buffer���쐬��������id��Ԃ��܂��B
p2�͎w��ł��܂���B

%href
HCLBLAS_dT
;--------
%index
HCLBLAS_dT
cl mem id��double�^�ōs��]�u

%prm
int64 p1,int64 p2
int64 p1:CL_mem_object id			[in]
int64 p2:CL_mem_object id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���double�^�Ƃ��ĉ��߂��A�s��]�u�������̂�p2�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���double�^�Ƃ��ĉ��߂��A�s��]�u����������buffer���쐬��������id��Ԃ��܂��B
p2�͎w��ł��܂���B

%href
HCLBLAS_sT
;--------
%index
HCLBLAS_sgemv
sgemv�J�[�l�����s y=A*x

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[y]CL_mem_object id			[in]
int64 p2:[A]CL_mem_object id			[in]
int64 p3:[x]CL_mem_object id			[in]

%inst

y=A�~x�̍s��x�N�g���ς��s�Ȃ��܂��B
�v���O�C�������ɖ��ߍ��܂�Ă���J�[�l���Ŏ��s����܂��B

A�ɂ�HCLBLAS_Set2DShape
�ł��炩����cl mem�ɍs�A��̃T�C�Y��ݒ肵�Ă����K�v������܂��B

x,y��HCLBLAS_Set2DShape�ŃT�C�Y�w�肳��Ă��Ă���������܂��B


���߂Ƃ��Ď��s���邱�Ƃ��ł��܂����A�֐��Ƃ��Ď��s���邱�Ƃ��ł��܂��B
���̍ۂ�
y=HCLBLAS_sgemm(A,x)
�̂悤�Ɏg���܂��B
���̏ꍇ�Ay�ɂ͐V����HCLCreateBuffer�Ŋm�ۂ��ꂽmem id���Ԃ���܂��B


%href
HCLBLAS_sgemv
HCLBLAS_dgemv
;--------
%index
HCLBLAS_dgemv
dgemv�J�[�l�����s y=A*x

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[y]CL_mem_object id			[in]
int64 p2:[A]CL_mem_object id			[in]
int64 p3:[x]CL_mem_object id			[in]

%inst

y=A�~x�̍s��x�N�g���ς��s�Ȃ��܂��B
�v���O�C�������ɖ��ߍ��܂�Ă���J�[�l���Ŏ��s����܂��B

A�ɂ�HCLBLAS_Set2DShape
�ł��炩����cl mem�ɍs�A��̃T�C�Y��ݒ肵�Ă����K�v������܂��B

x,y��HCLBLAS_Set2DShape�ŃT�C�Y�w�肳��Ă��Ă���������܂��B


���߂Ƃ��Ď��s���邱�Ƃ��ł��܂����A�֐��Ƃ��Ď��s���邱�Ƃ��ł��܂��B
���̍ۂ�
y=HCLBLAS_sgemm(A,x)
�̂悤�Ɏg���܂��B
���̏ꍇ�Ay�ɂ͐V����HCLCreateBuffer�Ŋm�ۂ��ꂽmem id���Ԃ���܂��B


%href
HCLBLAS_sgemv
HCLBLAS_dgemv
;--------
%index
HCLBLAS_sdot
x1�Ex2�̃h�b�g��(�x�N�g������)���v�Z

%prm
int64 p1,int64 p2,int64 p3
int64 p1:CL_mem_object id			[in]
int64 p2:CL_mem_object id			[in]
int64 p3:CL_mem_object id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2,p3��float�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1,p2��float�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p3�͎g���܂���B

%href
HCLBLAS_ddot
;--------
%index
HCLBLAS_ddot
x1�Ex2�̃h�b�g��(�x�N�g������)���v�Z

%prm
int64 p1,int64 p2,int64 p3
int64 p1:CL_mem_object id			[in]
int64 p2:CL_mem_object id			[in]
int64 p3:CL_mem_object id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2,p3��double�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1,p2��double�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p3�͎g���܂���B

%href
HCLBLAS_sdot
;--------
%index
HCLBLAS_snrm2
�x�N�g��x��L2�m�������v�Z

%prm
int64 p1,int64 p2
int64 p1:CL_mem_object id			[in]
int64 p2:CL_mem_object id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2��float�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1��float�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p2�͎g���܂���B

%href
HCLBLAS_dnrm2
;--------
%index
HCLBLAS_dnrm2
�x�N�g��x��L2�m�������v�Z

%prm
int64 p1,int64 p2
int64 p1:CL_mem_object id			[in]
int64 p2:CL_mem_object id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2��double�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1��double�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p2�͎g���܂���B

%href
HCLBLAS_snrm2
;--------