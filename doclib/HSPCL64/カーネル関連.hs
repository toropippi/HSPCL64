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
    p3 : �����ɓn������(�萔��cl_mem_id)[in]
int p4 : ���[�J���������t���O,�ȗ���	[in]
%inst
�J�[�l���̈������Ƀf�[�^��n���܂��B

HCLDoKernel�Ōv�Z����O�ɂ���ŃJ�[�l���̈�����\�߃Z�b�g���Ă����Ȃ���΂����܂���B


�Ⴆ�΃J�[�l�����̃\�[�X��

__kernel void vector_add(__global int *array1,int arg2) {}

�Ƃ������̂Ȃ�
HCLSetKernel p1,0,cl_mem_id_A	//(��HCLCreateBuffer�ō쐬����cl_mem_id)	;�z��
HCLSetKernel p1,1,5	//����2
��2��ɓn��w�肵�܂��B

p2�́Avector_add�̈����̈�ԍ���0�ԂƂ��čl���܂��B

�P��Z�b�g����Ύ��Z�b�g�������܂œK�����ꑱ���܂��B
p3�ɂ�32bit int�^�A64bit int�^�A������^�ϐ��Adouble�^�Afloat�^�ϐ����w��ł��܂��B

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
HCLSetKernel p1,0,cl_mem_id_dpA
HCLSetKernel p1,1,cl_mem_id_dpB
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
p2�ȍ~ : �����ɓn������(�萔��cl_mem_id)	[in]

%inst
�J�[�l���̈������܂Ƃ߂Ďw�肵�܂��B

HCLSetKernel p1,0,cl_mem_id_dpA
HCLSetKernel p1,1,cl_mem_id_dpB

�Ȃ�

HCLSetkrns p1,cl_mem_id_dpA,cl_mem_id_dpB

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

HCLCreateProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer�������J�[�l�������s���Č��ʂ𓾂܂��B
�Ⴆ�Έȉ��̃J�[�l���R�[�h��
__kernel void sample(__global int* A)
{
    uint gid = get_global_id(0);
    A[gid]=12345;
}

A[]�ɒl���������ޏ����������Ď��s����ƁAp4�Ɏw�肵��HSP�z��ϐ���12345���������܂�܂��B

p1�ɂ̓\�[�X�R�[�h�̕�����
p2�ɂ̓O���[�o���T�C�Y�i���s���������񏈗����j
p3�ɂ̓��[�J���T�C�Y
p4�ȍ~�ɂ̓J�[�l���ɓn���������w�肵�ĉ������B

p4�ȍ~�̈����̐���OpenCL�J�[�l�����̈����̐�������Ȃ��ƃG���[�ɂȂ�܂��B


���̖��߂̓v���O�C��������HCLCreateProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer,HCLWriteBuffer,HCLReadBuffer,HCLReleaseKernel,HCLReleaseProgram,HCLReleaseBuffer���g�p���Ă��܂��B
���̖��߂Ŋm�ۂ���VRAM���́A���̖��߂��I���܂łɕK���j������܂��B
HCLDoKernel�ƈႢ�A�^�X�N����������܂Ŏ��̖��߂ɂ���܂���B

HCLCall��HCLCall2�ł͑������̓��͕����񂪃v���O�C�������Ńn�b�V��������ۑ�����Ă���A�S������������̏ꍇ�A�O��̃r���h�������Ŏg���܂킷���Ƃ��ł���悤�ɂȂ��Ă��܂��B
�܂薈��J�[�l���\�[�X���R���p�C�����Ă���킯�ł͂Ȃ��̂ō����ł��B

������HCLCall�ł͑��̕����̖��߂̃I�[�o�[�w�b�h���傫���̂ŁA���x�����߂���ꍇ�ɂ͌����܂���B

OpenCL�S�̂̂��ڍׂȉ����HCLDoKernel���Q�Ɖ������B

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
HCLCall2�ł́A���܂�HCLCall��HSP�z��ϐ����w�肵�Ă����Ƃ����CL_mem_id���w�肵�܂��B

p1�ɂ̓\�[�X�R�[�h�̕�����
p2�ɂ̓O���[�o���T�C�Y�i���s���������񏈗����j
p3�ɂ̓��[�J���T�C�Y
p4�ȍ~�ɂ̓J�[�l���ɓn���������w�肵�ĉ������B

p4�ȍ~�̈����̐���OpenCL�J�[�l�����̈����̐�������Ȃ��ƃG���[�ɂȂ�܂��B

���̖��߂̓v���O�C�������œ�����HCLCreateProgram,HCLCreateKernel,HCLSetKernel���g�p���Ă��܂��B
HCLCall�ƈႢ�^�X�N����������O�Ɏ��̖��߂ɂ���܂�(�u���b�L���O���[�hoff)�B

HCLCall��HCLCall2�ł͑������̓��͕����񂪃v���O�C�������Ńn�b�V��������ۑ�����Ă���A�S������������̏ꍇ�A�O��̃r���h�������Ŏg���܂킷���Ƃ��ł���悤�ɂȂ��Ă��܂��B
�܂薈��J�[�l���\�[�X���R���p�C�����Ă���킯�ł͂Ȃ��̂ō����ł��B
����HCLDokrn1,2,3���߂̂悤�Ɉ����w��ƕ����ł��Ă�킯�ł͂Ȃ��̂ŁA�ׂ������Ƃ������Έ����w��̕��I�[�o�[�w�b�h�͂ǂ����Ă�����܂��B

OpenCL�S�̂̂��ڍׂȉ����HCLDoKernel���Q�Ɖ������B

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
p2�ɂ�1�`3 (work_dim���O���[�o�����[�N�T�C�Y�ƃ��[�J�����[�N�T�C�Y�̎���)
p3�ɂ͎������ɉ������O���[�o�����[�N�T�C�Y(���񏈗���)���i�[�����ϐ�
p4�ɂ͎������ɉ��������[�J�����[�N�T�C�Y���i�[�����ϐ�
���w�肵�Ă��������B

p4�̕ϐ��̓��e��0�̏ꍇ�A���[�J�����[�N�T�C�Y�͎����I�Ɍ��肳��܂��B

p5��event_id��-1�`65535�̒l���w��ł��܂��B�ȗ����f�t�H���g�ł�-1�ł��B
�J�[�l���̎��s��Ԃ��擾����ɂ�event���L�^����K�v������A0�`65535�̂Ƃ�����event�ԍ��ƃJ�[�l�����R�t������܂��B
�ȍ~�A���̔ԍ���event���e�̎擾(���s�󋵁A���s�J�n���ԁA���s�I�����ԂȂ�)���s���܂��B
�ԍ��̏㏑�����ł��܂����A�㏑�������O��event���͔j������܂��B

���̖��ߎ��͎̂��s����������܂ő҂��߂ł͂Ȃ��AOpenCL�R�}���h���L���[�ɓ���邾���ł���A���ۂ̃J�[�l���̎��s�I����҂ɂ�event���g����HCLFinish���ő҂��ƂɂȂ�܂��B
����͈ꌩ���G�Ȃ悤�Ɏv���܂����AGPU���v�Z���Ă���Œ���CPU���ʂ̃^�X�N�ɏ������񂹂�Ƃ������_������܂��B

��HCLDoKernel�ɂ���
���̖��߂�OpenCL�̓���p�Ƃ��āA�܂��ȈՂ�OpenCL�𗘗p�ł��邱�Ƃ�ړI�ɍ쐬�������߂ł��B
HCLCall�ł͎����I�ɏ������Ă����uHSP�ŗp�ӂ����z��ϐ���VRAM���Ɉڂ������v�u�X���b�h�̎����ݒ�v��
����ݒ肵�Ȃ���΂Ȃ�܂���B
�������ݒ�ł��镔�������Ȃ�HCLCall�Ɣ�r���ď����̍������⎩�R�x�̍������Ƃ��\�ɂȂ�܂��B


HSP���[�U�[�Ƃ���HCLDoKernel�iOpneCL�v���O�C���j�𗘗p���鎞�A�����̏���T���₷���_�����X�g�A�b�v���܂����B
���̂��߂�OpenCL�𗘗p�����ł̓Ɠ��ȏ�����������܂��B

	1.OpenCL�p�̖��߃\�[�X��ʓr�p�ӂ���K�v������B�i�uOpenCL C�v�Ƃ����BVecAdd.cl�Ȃǁj
	�����Ă��̃t�@�C����HSP��ŌŗL�̖��߁iHCLCreateProgram�j�œǂݍ��݁B
	����ɂ��Program�I�u�W�F�N�g�����������B�����64bit�v���O�C���ł�int64�^�A32bit�v���O�C���ł�int�^�̐��l�ŕ\�����B

	2.����Program�I�u�W�F�N�g����u�J�[�l���v�ƌ����閽�ߒP�ʂ𒊏o����BHSP��ŌŗL�̖��߁iHCLCreateKernel�j�ō쐬����B
	����ɂ��Kernel�I�u�W�F�N�g�����������B�����64bit�v���O�C���ł�int64�^�A32bit�v���O�C���ł�int�^�̐��l�ŕ\�����B

	3.GPU��̃������̔z����m�ۂ���BHSP��ŌŗL�̖���HCLCreateBuffer�ɂč쐬����B
	����ɂ��CL_mem�I�u�W�F�N�g�����������B�����64bit�v���O�C���ł�int64�^�A32bit�v���O�C���ł�int�^�̐��l�ŕ\�����B
	
	4.CPU��GPU�Ƀf�[�^�]������B
	HCLWriteBuffer���g��HSP�z���CL_mem id�̂���GPU�������֓]������B
	
	5.�J�[�l���֐��ֈ������Z�b�g����B
	Kernel�I�u�W�F�N�g�ƁACL_mem�I�u�W�F�N�g��id���g���āAHCLSetKernel���߂ň����Z�b�g�������Ȃ��B

	6.�J�[�l�����ŗL�̖��߁iHCLDoKernel�j�Ŏ��s�B

	7.�����Čv�Z���ʂ�������CL_mem�I�u�W�F�N�g���Q�Ƃ��鎞��HSP��̌ŗL�̖��߁iHCLReadBuffer�j�Ńf�[�^��HSP�z��ɖ߂��B
	������GPU�Ōv�Z����ꍇ�͕K�v�Ȃ��B
	
	
���̂悤�ȏ������K�v�ƂȂ�̂̓z�X�g���iCPU���j�ƃf�o�C�X���iGPU���j�̏���/�������Ǘ����ʌƂȂ��Ă��邩��ł��B
�Ȃ��֋X��GPU���Ə����Ă��܂����AOpenCL�f�o�C�X��Intel CPU��AMD CPU�̏ꍇ�����肦�܂��B���̏ꍇ�ł��������Ǘ����ʌł��邱�Ƃ͕ς��Ȃ��ł��B


��NDRange(�C���f�N�X��Ԃɂ���)
GPGPU�v���O���~���O�ɂ����āA�O���[�o�����[�N�T�C�Y�⃍�[�J�����[�N�T�C�Y�͂ƂĂ��d�v�ȊT�O�ɂȂ��Ă��܂��B
OpenCL�����łȂ�CUDA��ComputeShader�ł������l���������܂��B


html{
<img src="./doclib/HSPCL64/thumbs/d22.png">
}html


���̐}�S�̂�NDRange
(HCLDoKernel kernel_id,2,[4,6],[2,3] �Ŏ��s�����Ƃ���z��)

NDRange �T�C�Y Gx��global_work_size[0]���O���[�o�����[�N�A�C�e��x�̃T�C�Y�����̐}����4
NDRange �T�C�Y Gy��global_work_size[1]���O���[�o�����[�N�A�C�e��y�̃T�C�Y�����̐}����6

���[�N�O���[�v�T�C�YSx��local_work_size[0]�����[�J�����[�N�A�C�e��x�̃T�C�Y�����̐}����2
���[�N�O���[�v�T�C�YSy��local_work_size[1]�����[�J�����[�N�A�C�e��y�̃T�C�Y�����̐}����3

���[�N�A�C�e�����X���b�h�����̐}�Ō�����24���鐅�F�̔��B

�Ԙg���̉��F���Ƃ���(���[�N�O���[�v��)�ŋ��L���������g���܂��B
�uVRAM�v�Ɓu���L�������v�͈Ⴂ�܂��B

VRAM���r�f�I�������[���f�o�C�X�������[���O���[�o���������[��GDDR6�i�A�N�Z�X��Ԓx���j���J�[�l���\�[�X��__global�Ŏw�肵���ϐ�
���L�������[���P���L���b�V�������[�J���������[�i���������j���J�[�l���\�[�X��__local�Ŏw�肵���ϐ�
�v���C�x�[�g�������[�����W�X�^�i��ԑ����j���J�[�l���\�[�X�ŉ����w�肵�Ȃ��������̕ϐ�(uint ic �Ƃ��͂���������Ă���)

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
�X���b�h��24����쓮���܂������ꂼ�����������id������A���ꂪget_global_id�Ŏ擾�ł��܂��B

get_global_id(0)��0�`3��
get_global_id(1)��0�`5�����ꂼ��̃��[�N�A�C�e���ɕԂ��܂��B�i�ȉ��̐}�Q�Ɓj

get_local_id �̓��[�N�O���[�v���̎���id��Ԃ��܂��B
get_local_id(0)��0�`1��
get_local_id(1)��0�`2�����ꂼ��̃��[�N�A�C�e���ɕԂ��܂��B�i�ȉ��̐}�Q�Ɓj

get_group_id�̓��[�N�O���[�v�̃O���[�v���ʔԍ���Ԃ��܂��B
get_group_id(0)��0�`1
get_group_id(1)��0�`1�����ꂼ��̃��[�N�A�C�e���ɕԂ��܂��B�i�ȉ��̐}�Q�Ɓj

get_global_size�̓O���[�o���T�C�Y�ŁA�ǂ̃��[�N�A�C�e���ł��Ԃ��l�͓����l��
get_global_size(0)��6
get_global_size(1)��3
�ƂȂ�܂��B

get_local_size�̓��[�J���T�C�Y�ŁA�ǂ̃��[�N�A�C�e���ł��Ԃ��l�͓����l��
get_local_size(0)��2
get_local_size(1)��3
�ƂȂ�܂�

get_num_groups�̓O���[�v���ŁA�ǂ̃��[�N�A�C�e���ł��Ԃ��l�͓����l��
get_num_groups(0)��3
get_num_groups(1)��1
�ƂȂ�܂�


�ȉ��A24�X���b�h�̊e�l�̐}

html{
<img src="./doclib/HSPCL64/thumbs/d2.png">
}html

-----------------------------------------
�����炢
�Eglobal_work_size
�Elocal_work_size
�E���[�N�O���[�v
�E���[�N�A�C�e��
�̒�`���o���܂��傤�B
���ꂼ��work_dim=1,2,3�ɂ���Ď�����1,2,3�ƕς��܂��B

work_dim=1�Ƃ����
���[�N�A�C�e����=global_work_size[0]
���[�N�O���[�v��=global_work_size[0]/local_work_size[0]
�ł��B

OpenCL C�Ŏg����֐��ŁA���X���b�h�����ʂ��邽�߂̊֐�������܂��B
get_global_id()
get_local_id()
get_group_id()
get_global_size()
get_local_size()
get_num_groups()
-----------------------------------------


��global_work_size�̎w��
���񐔂��w�肷����̂��Ǝv���Ă��������B
100�v�f�̔z�񂪂�����1�X���b�h��1�̗v�f�ɃA�N�Z�X����悤�ȏ����̏ꍇ�A1����100����œ������̂ŁAglobal_work_size[0]��100�ƂȂ�܂��B

�摜�̂悤�ȃf�[�^�ɏ������{���ꍇ�́A2������256*256����ȂǂƂ������Ƃ��ł��܂��B

��local_work_size�̎w��
��قǂ�global_work_size���ǂ̂悤�ɕ������邩�A�Ƃ����̂����ϓI�Ȑ������Ǝv���܂��B
�܂芄��؂��Ή��ł������킯�ł����A�v�Z���x�ɒ�������̂ŏd�v�ȍ��ڂł��B

���_���猾����64,128,256�̂ǂꂩ���w�肷��Α��v�ł��傤�B
global_work_size�����[�Ȑ��ŏ�L�̐��Ŋ���؂�Ȃ��ꍇ�́Aglobal_work_size�𑝂₵�Ăł�����؂�鐔���ɂ����ق����ǂ��ł��B


���ڍא���(��Փx:��)
local_work_size�̎w��ɂ��Ă͂����ȑO��m������p�Y���̂悤�ɑg�ݍ��킹�Č��肵�Ă���A�Ƃ����܂��B
�����Ǝw��ł���悤�ɂȂ�ɂ�NVIDIA�AAMD�̕���GPU�̃A�[�L�e�N�`���ׂ̍����Ƃ�����ËL���Ȃ��Ă͂����܂���E�E�B
����������local_work_size��work_dim�̎����̎w��ɂ�����܂ŁAOpenCL�݂̂Ȃ炸CUDA��ComputeShader�ł��قړ��l�̊T�O���̗p����Ă���܂��B
���������z�������CUDA��ComputeShader�����S�҂͒����Ă���Ƃ�����ł��傤�B


��work_dim�ɂ���
��}�ŁAwork_dim=2,global_work_size=[4,6]��24����ɂ��Đ������܂����B
����24����Ȃ�work_dim��1�ɂ���global_work_size��24�ɂ��Ă̓_���Ȃ̂��Ƃ����ƁA���͑S�����Ȃ��ł��B
work_dim��1�ł�2�ł�3�ł����\�ɑS���e�����܂���B�v���O���}�[�̍l���₷���悤�Ɏ�����3�܂Őݒ肳��Ă���ɉ߂��Ȃ��A�l�I�Ȃ��Ƃ������Ύ��̓������z�u��1�����Ɍ����Ă���̂�work_dim�͏��1�ŃR�[�h�������Ă܂��B

�悤�̓v���O���}�[�̍D�������Ō���ł���v�f�ł��B�e�N�X�`���ȂǓ񎟌����l����Ƃ��Awork_dim��2�̕����ǂ��Ƃ����l�����܂��B


�����[�N�O���[�v��local_work_size�A�J�[�l���R�[�h����__global��__local�ɂ���
������local_work_size�ł����A���ʂɕ��񏈗������邾���Ȃ炢��Ȃ��v�f�ł��B������������w�肵�Ȃ��Ƃ����Ȃ����R������܂��B
����͎�Ɉ���Ǝv���Ă��܂��B

�E1�̃��[�N�O���[�v�͕K�������ŋ��L�����������L�ł���悤�ɂȂ��Ă���

���������ƂɁA���L���������g��Ȃ��Ă�����local_work_size�̎w�肪�K�{�ƂȂ��Ă��܂��B

���L�������ɂ��Ă͏�����Ő������܂����A�Ⴆ�Ώ�}�̂悤local_work_size��[2,3]�Ǝw�肷��ƁA4�̃��[�N�O���[�v(�Ԙg�̎l�p)����������A1�̃��[�N�O���[�v������6�X���b�h�ł��B6�X���b�h�ŋ��L�����������L�ł��邱�ƂɂȂ�܂��B
�܂�local_work_size��[4,6]�Ǝw�肷�邱�Ƃ��ł��܂��B���̏ꍇ���[�N�O���[�v�̃T�C�Y��4*6�ɂȂ�24�X���b�h���ׂĂŋ��L�����������L���邱�Ƃ��ł��܂��B

HSPCL64�ŋ��L�������������Ă���T���v���Ɂu3_13�������������2���L�������T���v��.hsp�v������܂��B
�����global_work_size��65536��local_work_size��256�ł��B����.cl�����Ă݂��

	kisublock[lid]=kisu;
	gusublock[lid]=gusu;

�Ə����Ă���Alid�̓��[�N�O���[�v���̎����X���b�h��id������킵�Ă��܂��B
kisublock��gusublock�Ƃ������L�������ɃA�N�Z�X���Ă��邱�Ƃ��킩��܂��B
�����Ă��̋��L�������͊e���[�N�O���[�v���Ƃɒ��g���Ⴄ�Ǝv���ĉ������I(�d�v)

__kernel void wake(__global int *mema,__local int kisublock[],__local int gusublock[],__global int *memb,__global int *memc) {
	int ic = get_global_id(0)*64;
	int lid= get_local_id(0);//���[�J��id�擾=0�`255�̂ǂꂩ
	int gid= get_group_id(0);//�O���[�vid�擾=0�`255�̂ǂꂩ

�ŏ��̕����ł����Alid�������ł����ꂼ��̃��[�N�O���[�v�����Ă��鋤�L�������͈Ⴄ�̂ł��B
�Ⴆ��gid=0�̃��[�N�O���[�v��lid��0�`255�܂ł̃X���b�h�����݂��܂��Bgid=1�̃��[�N�O���[�v�ɂ�lid��0�`255�܂ł̃X���b�h�����݂��܂��B����lid�ňقȂ�gid�̃X���b�h�ł�gusublock[lid]�ɏ�������ł���l���قȂ�܂��B

���__global int *mema�̂ق��̓O���[�o���������ł��̂ŁA�ǂ̃��[�N�O���[�v����݂Ă������f�[�^�������Ă��܂��B
���ꂪ__local��__global�̈Ⴂ�ł��B


�����āu���L���������e���[�N�O���[�v���ƂɌʂɋ��L�ł��Ă���󋵁v�����o���̂�local_work_size�̎w�肪�K�v�Ȃ̂ł��B���̗�ł�local_work_size=256�Ƃ��邱�Ƃ�1�̃��[�N�O���[�v��256�̃X���b�h�������A���ꂪ�������L�����������L�ł��Ă��܂��B


��U�A�����܂ł͂킩��܂����H
�Ƃ肠�����Alocal_work_size�����̖ړI�̂��߂Ɏw�肷�邩�͏����킩�������Ǝv���܂��B

������local_work_size�͉��ł��w�肵�Ă����킯�ł͂Ȃ����Ȃ肫�����񂪂���܂��B


��CUDA Core,PE�̊T�O��Warp,WaveFront�̊T�O��SM,CU�̊T�O
��������͂�����������n�[�h�E�F�A�̘b�ɂȂ�܂��B
��ςł���local_work_size�̎w��ɂ���Ă͐��\���N���e�B�J���ɕς���Ă��邱�Ƃ�����A���_���������Ă��������Ƃ���ł�����܂��B

�܂��p��ɂ��Đ��������


�ECUDA Core��NVIDIA�p��
�EPE��AMD�p��
�T�O�͗��҈ꏏ

�EWarp��NVIDIA�p��
�EWaveFront��AMD�p��
�T�O�͗��҈ꏏ

�ESM��NVIDIA�p��
�ECU��AMD�p��
�T�O�͗��҈ꏏ


�ł��i����ł���G�c�ł����E�E�E�j
����CUDA Core�̏W�܂������̂�SM�ASM�̏W�܂������̂�GPU�Ƃ����F���ŗǂ��ł��B

�����ďd�v�Ȃ��ƂȂ̂Ő�ɏ����Ă�����
1�̃��[�N�O���[�v��1��SM�Ŏ��s����܂����A1��SM�͓�����1�̃��[�N�O���[�v�������s���Ȃ��킯�ł͂���܂���B
�܂�ASM�ɓ��ڂ���Ă��郌�W�X�^�⋤�L�������̗ʓI�ɁA������2�̃��[�N�O���[�v�����s�\�ȏꍇ��2���s���܂��i���m�ɂ́u����\��������܂��v�j�B
https://x.momo86.net/article/149��蔲������

�܂���O��̒m���ƂȂ�܂����A

	GPU�͂�������v�Z�R�A=CUDA Core�������Ă��邪�A���ׂĂ��������Ȃ��瓮���Ă���킯�ł͂Ȃ�

�Ƃ������Ƃ�����܂��BCPU���e�R�A�Ŏ��g�����Ⴄ���Ƃ�����̂Ɠ����ł��B
���Ƃ����đS�Ă̌v�Z�R�A���΂�΂�ɓ����Ă��邩�Ƃ����ƁA�����ł�����܂���B�i���̉𓚂�Warp�AWaveFront�̍��ڂɏ����Ă���܂��j

��GPU�n�[�h�E�F�A�\��
NVIDIA��GPU���ɂ����܂��BGPU��SM(streaming multiprocessor)�Ƃ����P�ʂ̉�H���ʂɎ����܂��B
�摜����16����܂��B(Fermi Overview�摜)
(https://pc.watch.impress.co.jp/docs/column/kaigai/318463.html���]��)

html{
<img src="./doclib/HSPCL64/fermioverview.jpg">
}html


����SM�̒��g�����Ă݂܂��B
���L��������SM���Ɏ�������Ă�����̂ł��B(�摜 ���L�������͉��̐����� 64KB)

(https://en.wikipedia.org/wiki/Fermi_%28microarchitecture%29���]��)
html{
<img src="./doclib/HSPCL64/fermistreamingmultiprocessor.png">
}html


�ǂݎ��ƁA1��SM��64KB�̃T�C�Y�̋��L�������̈悪�p�ӂ���Ă���A1��SM��CUDA Core��32����悤�ł��BCUDA Core��1��1clock��1�̐Ϙa���Z���s������̂ł��B

HCLDoKernel���߂�work_dim=1�Aglobal_work_size=32�Alocal_work_size=32�Ƃ��Ď��s�����ꍇ�A1�̃��[�N�O���[�v����������A���̃��[�N�O���[�v�͕K��1��SM���Ŏ��s����܂��B
32�X���b�h�͂���shared memory�ɕ����I�ɃA�N�Z�X���邱�Ƃ��ł���ƌ����ڂ�����z���ł��܂��B

�t�ɕʂ̂Ƃ���ɂ���SM��shared memory�͎d�؂肪���邽�ߕ����I�ɉ����A�A�N�Z�X����̂���ςł��邱�Ƃ��z���ł��܂�(������ł��܂���)�B

local_work_size�̎w��́A�C�ӂ̃X���b�h������Ȃ�1�̃��[�N�O���[�v���A1SM���Ŏ��s�����悤�Ɏd�����邽�߂̑��삾�Ǝv���ĉ������B

���x�͕��񐔂������Ƒ��₵���Ƃ��̂��Ƃ��l���܂��B(�b���ȒP�ɂ��邽�߂ɍ���Warp�̊T�O�͂Ȃ��Ƃ��܂��B)
�J�[�l���R�[�h��

d=a*b+c;

�Ƃ����Ϙa���Z��1�s�����Ă����Ƃ��āA

global_work_size=512�Alocal_work_size=512

�Ŏ��s����ƐϘa���Z��1SM��512�񂨂��Ȃ��K�v������܂���32����CUDA Core���Ȃ��̂�16clock�ɕ����Ď��s����܂��B
�܂�global_work_size=32�Alocal_work_size=32�̂Ƃ��Ɣ�גP����16�{���Ԃ������邱�ƂɂȂ�܂��B(*1)

������GPU��SM��16��邱�Ƃ��v���o���ƁA�܂�1SM�����g���Ă��Ȃ��̂ł���͔�����ł��B
global_work_size=512�Alocal_work_size=32�Ƃ���ƁA16��SM�ł��ꂼ�ꃏ�[�N�O���[�v�������オ��GPU�S�̂�1clock��512�̐Ϙa���Z������ɍs����Ɗ��҂ł��܂��B

local_work_size�̎w��̂������̃R�c�͂����������Ƃ���ɂ���܂��B

���ۂǂ�SM�ɂǂ̃��[�N�O���[�v�����蓖�Ă邩�̓v���O���}�[���w��ł��Ȃ��̂ŁA������16SM�ɋϓ��Ɋ��蓖�Ă��邩�͉^�ɂȂ�܂����A���܂ł̌o�����炯�������ϓ��ɍєz����Ă����ۂł��B

local_work_size�̍ő�l�����܂��Ă���̂�GPU�ɂ���āA����1SM������Ɉ�����X���b�h���Ɍ��E�����邩��ł��B

��₱�����̂́u1SM�����舵����X���b�h���v�Ƃ����n�[�h�E�F�A�̌��E�ƁA�ulocal_work_size�̐ݒ�ł���ő�l�v�͂܂��Ⴄ�Ƃ������Ƃ�����܂����A�܂������悤�Ȃ��̂ƍl���Ă悭�A�T��local_work_size�̂ق���1024���炢�̒l�ɂȂ�܂��B


�����܂ł̐����łǂ��܂ŗ����ł��܂����ł��傤���H(��Γ���ł���ˁE�E)

�܂�Warp�AWaveFront�ɂ��Đ������Ă܂���ˁE�E�E�B
���̑O�Ɉ�U�����炢���܂��B

-----------------------------------------
�����炢

1SM������32CUDA Core����A16SM�������GPU�ŃR�[�h�𓮂������Ƃ��l���܂�(�܂�Warp�̊T�O�͂Ȃ��Ƃ��܂�)

global_work_size=512�ƌ��肵���Ƃ��A���񏈗��ň�Ԍ����������̂�1SM������32�̃X���b�h���N�������Ƃ��ł��B
����������local_work_size=32�Ƃ���̂��œK�ł��B

global_work_size=1024�ƌ��肵���Ƃ��A���񏈗��ň�Ԍ����������̂�1SM������32��or64�̃X���b�h���N�������Ƃ��ł��B
����������local_work_size=32 or 64�Ƃ���̂��œK�ł��B
�ǂ����I�����Ă��A�g�[�^����1CUDA Core������2�̃X���b�h�̏�����S�����邱�ƂɂȂ�܂��B
�Ȃ��Ȃ�local_work_size=32�̂Ƃ�
16SM��32�̃��[�N�O���[�v�����蓖�Ă���̂�1SM������2���[�N�O���[�v�������邽�߂ł��B

global_work_size=65536�ƌ��肵���Ƃ��A���񏈗��ň�Ԍ����������̂�1SM������32��or64��or128��or256��or512��or1024�̃X���b�h���N�������Ƃ��ł��B���ꂼ��̃p�^�[����2048,1024,512,256,128,64�̃��[�N�O���[�v����������A���ꂪ16SM�ŋϓ��Ɋ��肫��邽�߂ł��B
-----------------------------------------
*1:�b���ȒP�ɂ��邽�߂�16�{�ƌ����܂������A�Ϙa���Z�̖��߃��C�e���V���l�����Ȃ��ꍇ�̘b�ł��B


��Warp�AWaveFront
����ɂ��ẮA���̃u���O��Unity���[�U�[�Ɍ������L���ł�����Ă���̂ł��ꂪ�Q�l�ɂȂ邩������܂���B
https://toropippi.livedoor.blog/archives/52915698.html
�u�O���[�v�X���b�h���v���ulocal_work_size�v�ɓǂ݂����Ă��������B

�ꉞ���������


Warp
�ENVIDIA��GPU�ł�32�X���b�h����1�܂Ƃ܂�̒P�ʂƂ��Ď��s����B���̒P�ʂ�Warp
�EMaxwell,Pascal�A�[�L�e�N�`���ł�32�X���b�h��32CUDA Core��1cycle�Ŏ��s����
�EFermi,Kepler,Volta,Turing�A�[�L�e�N�`���ł�32�X���b�h��16CUDA Core��2cycle�Ŏ��s����
�E16 or 32�̃X���b�h�������^�C�~���O�œ����s�̃v���O���������s����


Wavefront
�EAMD��GPU�ł�64�X���b�h����1�܂Ƃ܂�̒P�ʂƂ��Ď��s����B���̒P�ʂ�Wavefront
�E64�X���b�h��16PE��4cycle�Ŏ��s����(PE=CUDA core�݂����Ȃ���)
�E16�X���b�h�������^�C�~���O�œ����s�̃v���O���������s����


�ł��B
�A�[�L�e�N�`�����ł킩��ɂ����ł��傤���ǁA����Ŏ�vGPU�͂قږԗ����Ă��܂�(2020�N����)�B

�܂��Ӗ��s�����Ǝv���܂��̂�Warp�̐����ɒǉ����܂��B
local_work_size��Warp�̊֌W��

Warp��=local_work_size/32 (�[���͐؂�グ)

�ƂȂ��Ă��܂��B�����1�̃��[�N�O���[�v���œ���Warp�����������Ă��܂��B
������

WaveFront��=local_work_size/64 (�[���͐؂�グ)

�ł��B

local_work_size��1���w�肵�Ă�32���w�肵�Ă�Warp��1�����オ��܂��B
local_work_size��256���w�肷���8Warp�����オ��܂��B
local_work_size��255�ł�8Warp�����オ��܂��B(1�X���b�h���͖���������܂�)
local_work_size��[2,3]�̓񎟌��������ꍇ1Warp�����オ��32-2*3=26�X���b�h���͖���������܂��B

�����Ă���1Warp��1SM����CUDA Core 16 or 32���g����2 or 1cycle�P�ʂœ����܂���A�Ƃ������Ƃł��B
�Ƃ������Ƃ�global_work_size=10�Alocal_work_size=1�Ƃ���Ƃ܂����[�N�O���[�v��10��������A1���[�N�O���[�v������1�X���b�h�ł�������1�X���b�h�ɑ΂�1Warp�����オ��܂�(31�X���b�h���͖�����)�B�e���[�N�O���[�v�͕�SM�Ŏ��s�����\��������̂�10���[�N�O���[�v�̂��܂Ƃ߂�1Warp�Ƃ͂ł��Ȃ��̂ł��B
10Warp�~31�X���b�h���������Ȃ̂łƂ�ł��Ȃ����ʂ������邱�Ƃ��킩�邩�Ǝv���܂��B


���ɂ����������̂ōl���Ă݂ĉ������B

�Ⴆ��Fermi�A�[�L�e�N�`����GPU(��̐}�Ɠ�������)�ANVIDIA GTX580�ȂǂɂȂ�܂����A1SM��32CUDA Core�������āA����32��16+16�Ƃ�����ɕ�����Ă��܂��B
����1��16��2cycle������1��Warp���������܂��B
global_work_size=32��local_work_size=32�Ƃ����Ƃ��ASM���ŉ����N���邩�Ƃ����ƁA�܂�����local_work_size��32��1Warp�ɑ������܂��B����1Warp��16��CUDA Core��2cycle�����Ď��s����܂��B�c���16CUDA Core�ł͉����v�Z���܂���B

�Ȃ̂łǂ��������Ă�1cycle�Ōv�Z���I��炷���Ƃ��ł��Ȃ����ASM�̐��\���g���؂邱�Ƃ��ł��Ȃ��ł��B

����global_work_size=64��local_work_size=64�Ƃ����Ƃ��ASM���ŉ����N���邩�Ƃ����ƁA�܂�����local_work_size��64��2Warp�ɑ������܂��B
16��CUDA Core��1��Warp��S�����A�c���16��CUDA Core������1��Warp��S�����邱�ƂŁA�g�[�^��2cycle��32CUDA Core���g��64��̉��Z�����s����܂��B
����ł͂��߂�SM�̐��\���g���؂邱�Ƃ��ł��܂����B

global_work_size=64��local_work_size=32�Ƃ����Ƃ��́A����SM���ʁX��SM��2��Warp��2cycle�Ŏ��s����܂��B����SM��2Warp�Ȃ�A����Ɠ����悤1��SM���ŉғ���100%�ł��B�����łȂ��ꍇ�́A2��SM�ŉғ���50%�Ƃ����󋵂ɂȂ�܂��B


���̂悤�ɍl���܂��B


�܂�Fermi�ł�1SM=32Core��16SM������GPU�̑S���\���g���؂�ɂ͍Œ�ł�global_work_size��1024�K�v�ł��B
���ۂɂ�(*1)�̘b������ƕ��G�ȗ��R(*2)�Ȃǂ�����A����5-30�{���炢��global_work_size���Ȃ���GPU�̑S���\���o���Ȃ��̂ł����B
�܂��AGPU�ɂ����SM���͕ς��܂��B�����A�[�L�e�N�`���ɂ����1SM�������CUDA Core�����ς��܂��B

HSPCL32N,64���g����exe�t�@�C��������Ĕz�z���邱�ƂȂǂ��l����ƁA���ɑ����̎�ނ�GPU�Ŏ��s����邱�Ƃ��l�����܂��B���ׂẴp�^�[���Ŋ����ɐ��\���g���؂�̂͂ł��Ȃ��ł����A�p�Y���̂悤�ɑg�ݍ��킹�čl�����local_work_size��64,128,256�����肩�ȂƂ����̂����̌l�I�Ȍ��_�ł��B


�t���I��global_work_size��64,128,256�̔{���ɂł��Ȃ��Ƃ��́A�悭�l�����ق��������ł��B
global_work_size=10000������local_work_size=100���Ƃ���ƁA100=32+32+32+4�ƂȂ�4Warp�̂���1��Warp���s�����ɔ�����ɂȂ�܂��B
��������global_work_size��64�̔{���ł���10048�ɂ����������āA48�𖳌��������ق����܂��}�V�ł��B


*2:�������A�N�Z�X�ɔ������C�e���V������܂��B�v�Z�����������ɃA�N�Z�X����ق�������ۂǎ��Ԃ������邱�Ƃ������ł��B300cycle�Ƃ��B���̃������A�N�Z�X���C�e���V���B�����邽�߂ɁA1SM����20�`�Ȃǂ̑�����Warp�𗧂��グ�āA����Warp���������A�N�Z�X�ɂ��Ƃ܂��Ă���Œ��A�ʂ�Warp���ғ�������CUDA Core���̉��Z�ғ�����100%�ɋ߂Â��邱�Ƃ��d�v�ɂȂ�܂��B���̂��߂ɂȂ�ׂ�������Warp�𗧂��グ�Ă������ق����悢�ł��B�ő��1SM������ǂ̂��炢Warp���ғ��ł��邩��GPU���Ƃɏ�������܂��Ă���A���̂������ۂǂ̂��炢�ғ����Ă��邩��CUDA�p���Occupancy(��L��)�Ƃ�т܂��B


���A�[�L�e�N�`���܂Ƃ�
�Ō�ɁA�A�[�L�e�N�`���̖��O�ł͎������킩�Ȃ���������܂���̂ňꉞ�A

NVIDIA�ł�
GTX 580:Fermi
GTX 680:Kepler
GTX 980:Maxwell
GTX1080:Pascal
RTX2080:Turing
RTX3080:Ampare

�̊֌W�ł���A�T��1000�ԑ��Pascal�A2000�ԑ��Turing�Ƃ��������̗����ł悢�ł��B(��O������)

�e�A�[�L�e�N�`����1Warp�����T�C�N���Ŏ��s�ł��邩�͎��̃u���O�ɂ܂Ƃ߂Ă��܂��B
https://toropippi.livedoor.blog/archives/52485283.html

NVIDIA GPU�Ɋւ��ẮACUDA�v���O���~���O�K�C�h�̃I�����C���h�L�������g����[���T���Ɠ������Ƃ������Ă���܂��B
AMD GPU�͂��낢�����T���Ȃ��ƌ�����܂���BIntel�́E�E�E


�������͂Ȃ�
�ȏ�̐����͂����܂Ŏ��̍l�����܂Ƃ߂����̂Ȃ̂ŁAlocal_work_size�������ɂ��ׂ��A�Ƃ��������͂Ȃ����̂��Ƃ͎v���܂��B
���ɓI�ɂ�local_work_size��S�p�^�[�������čő��̂��̗p����̂��ǂ��ł��B



���g�p����
(1)
�ꕔ��GPU�ł́A�O���[�o�����[�N�T�C�Y�̓��[�J�����[�N�T�C�Y�Ő����ł��Ȃ���΂����܂���B(�����炭OpenCL 2.0������GPU)
dim globalsize,3
dim localsize,3
globalsize=2048,2048,7
localsize=8,8,4
�ł������ꍇ�Aglobalsize.2��localsize.2�Ŋ���؂�Ȃ����߂ɃG���[�ƂȂ�܂��B
�G���[�̏ꍇ
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
&	�|�C���^�Ƃ��ė��p
*	�|�C���^�Ƃ��ė��p
->	�Ԑڃ����o�Q�Ɖ��Z�q
�������E�E�E

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
a=(uint)b;//���̂ق����s���h����

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
https://pc.watch.impress.co.jp/docs/column/kaigai/318463.html


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
p4��event_id��-1�`65535�̒l���w��ł��܂��B�ȗ����f�t�H���g�ł�-1�ł��B

�����̖��߂��g���O��
OpenCL�S�̂̂��ڍׂȉ����HCLDoKernel���Q�Ɖ������B

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

�����̖��߂��g���O��
OpenCL�S�̂̂��ڍׂȉ����HCLDoKernel���Q�Ɖ������B

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

p4��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ�������邩�͎����Ō��肳��܂��B

�����̖��߂��g���O��
OpenCL�S�̂̂��ڍׂȉ����HCLDoKernel���Q�Ɖ������B

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

p5��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ�������邩�͎����Ō��肳��܂��B

�����̖��߂��g���O��
OpenCL�S�̂̂��ڍׂȉ����HCLDoKernel���Q�Ɖ������B

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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
�Ⴆ��HCLDoXi���߂ŁA�T�C�Y��256*4=1024byte��cl mem��p2�Ɏw�肵���ꍇ
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
int64 p1:[C]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[B]cl_mem_id			[in]
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
int64 p1:[C]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[B]cl_mem_id			[in]
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
int64 p1:cl_mem_id			[in]
int p2:�s(raw)�̐�			[in]
int p3:��(col)�̐�			[in]

%inst
cl mem�ɍs�A��̃T�C�Y��ݒ肵�܂��B
HCLBLAS_sgemm���߂�HCLBLAS_dgemm���߂��g���ۂɂ��炩���ߍs�A��𐳂����ݒ肵�Ă����K�v������܂��B
���̐ݒ肵���s�Ɨ�̒l��cl mem�ƈꏏ�Ƀv���O�C�������ɋL�^����AHCLBLAS_Get2DShape�Ŏ��o�����Ƃ��ł��܂��B


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
int64 p1:cl_mem_id			[in]
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
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���float�^�Ƃ��ĉ��߂��A�s��]�u�������̂�p2�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���float�^�Ƃ��ĉ��߂��A�s��]�u����������buffer���쐬��������id��Ԃ��܂��B
p2�͎w��ł��܂���B

%href
HCLBLAS_dT
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_dT
cl mem id��double�^�ōs��]�u

%prm
int64 p1,int64 p2
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���double�^�Ƃ��ĉ��߂��A�s��]�u�������̂�p2�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1���\�[�X�Ƃ���double�^�Ƃ��ĉ��߂��A�s��]�u����������buffer���쐬��������id��Ԃ��܂��B
p2�͎w��ł��܂���B

%href
HCLBLAS_sT
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_sgemv
sgemv�J�[�l�����s y=A*x

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[y]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[x]cl_mem_id			[in]

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
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_dgemv
dgemv�J�[�l�����s y=A*x

%prm
int64 p1,int64 p2,int64 p3,int p4,int p5,int p6
int64 p1:[y]cl_mem_id			[in]
int64 p2:[A]cl_mem_id			[in]
int64 p3:[x]cl_mem_id			[in]

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
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_sdot
x1�Ex2�̃h�b�g��(�x�N�g������)���v�Z

%prm
int64 p1,int64 p2,int64 p3
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]
int64 p3:cl_mem_id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2,p3��float�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1,p2��float�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p3�͎g���܂���B

%href
HCLBLAS_ddot
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_ddot
x1�Ex2�̃h�b�g��(�x�N�g������)���v�Z

%prm
int64 p1,int64 p2,int64 p3
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]
int64 p3:cl_mem_id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2,p3��double�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1,p2��double�^�̃x�N�g���Ƃ��ĉ��߂����όv�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p3�͎g���܂���B

%href
HCLBLAS_sdot
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_snrm2
�x�N�g��x��L2�m�������v�Z

%prm
int64 p1,int64 p2
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2��float�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1��float�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p2�͎g���܂���B

%href
HCLBLAS_dnrm2
HCLBLAS_Set2DShape
;--------
%index
HCLBLAS_dnrm2
�x�N�g��x��L2�m�������v�Z

%prm
int64 p1,int64 p2
int64 p1:cl_mem_id			[in]
int64 p2:cl_mem_id			[in]

%inst
�����߂Ƃ��Ďg�����ꍇ
p2��double�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂�p1�ɏ������݂܂��B
���֐��Ƃ��Ďg�����ꍇ
p1��double�^�̃x�N�g���Ƃ��ĉ��߂�L2�m�������v�Z�������̂̌��ʂ��i�[����Ă���mem id��Ԃ��܂��B
p2�͎g���܂���B

%href
HCLBLAS_snrm2
HCLBLAS_Set2DShape
;--------