;------------------------
;   �J�[�l���֘A
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
GPGPU�p�v���O�C��

%group
OpenCL�J�[�l���֘A

%port
Win

;-------- ref --------

%index
HCLBuildProgram
�J�[�l���v���O�����̃r���h

%prm
str p1,var p2
str p1 : �J�[�l���\�[�X�t�@�C����  [in]
var p2 : �v���O����id����������[OUT]

%inst
p1�ɂ̓\�[�X�̃t�@�C���������ĉ������B
p2�̓R���p�C�����ꂽ�v���O����id���������܂��B

�R���p�C�����ꂽOpenCL�J�[�l���v���O�����́A���̃f�o�C�X��ł����g���܂���B
�Q�ȏ�̃f�o�C�X��œ����J�[�l�������s�������Ƃ��A���ꂼ��̃f�o�C�Xid��HCLSetDev�ŃZ�b�g���Ȃ�����HCLBuildProgram���Ă�ŉ������B


%href
HCLCreateProgramWithSource
HCLSetDev
HCLCreateKernel
HCLReleaseProgram

;-------- ref --------

%index
HCLCreateProgramWithSource
�J�[�l���v���O�����̃r���h

%prm
str p1,int p2,var p3
str p1 : �J�[�l���\�[�X������  [in]
int p2 : �J�[�l���\�[�X������T�C�Y  [in]
var p3 : �v���O����id����������[OUT]

%inst
p1�ɂ̓\�[�X�̃f�[�^�����ĉ������B
p2�ɂ̓\�[�X�̑傫�������Ă��������B
p3�ɂ̓R���p�C�����ꂽ�v���O����id���������܂��B

�R���p�C�����ꂽOpenCL�J�[�l���v���O�����́A���̃f�o�C�X��ł����g���܂���B
�Q�ȏ�̃f�o�C�X��œ����J�[�l�������s�������Ƃ��A���ꂼ��̃f�o�C�Xid��HCLSetDev�ŃZ�b�g���Ȃ�����HCLBuildProgram���Ă�ŉ������B


%href
HCLBuildProgram
HCLSetDev
HCLCreateKernel
HCLReleaseProgram

;--------

%index
HCLCreateKernel
�J�[�l���쐬

%prm
int p1,str p2,var p3
int p1 : �v���O����id          [in]
str p2 : �J�[�l���֐���        [in]
var p3 : �J�[�l��id����������[OUT]

%inst
�J�[�l���Ƃ����AOpenCL�̊֐������s����P�P�ʂ�o�^���܂��B


p2��p1�J�[�l���\�[�X���ɂ���u__kernel �v����n�܂�֐������u__kernel �v����̕�����Ŏw�肵�܂��B
�Ⴆ��p1�\�[�X���Ɂu__kernel void vector_add(__global float *A) {�v�Ƃ����s�������p2�� "vector_add" ���w�肵�܂��B
p3�ɂ̓J�[�l��id���o�͂���܂��B
�ȍ~�A�ϐ��̃Z�b�g��v�Z�͂��̃J�[�l��id�Ƃ����`�ŊǗ��A���s�ł��܂��B



%href
HCLBuildProgram
HCLCreateProgramWithSource
HCLSetDev
HCLReleaseKernel

;--------

%index
HCLSetKernel
�J�[�l���Z�b�g

%prm
int p1,int p2,p3,int p4
int p1 : �J�[�l��id			[in]
int p2 : �����̏���p(x)�̎w��		[in]
    p3 : �����ɓn������(�萔��mem_object)[in]
int p4 : ���[�J���������t���O		[in]
%inst
�J�[�l���̈������Ƀf�[�^��n���܂��B

HCLDoKernel�Ōv�Z����O�ɂ���ŃJ�[�l���̈�����\�߃Z�b�g���Ă����Ȃ���΂����܂���B


�Ⴆ�΃J�[�l�����̃\�[�X���u__kernel void vector_add(__global float *hairetu,float teisu) {�v�Ƃ������̂Ȃ�
HCLSetKernel p1,0,mem_object_A	//(��HCLCreateBuffer�ō쐬����mem_object id)	;�z��
HCLSetKernel p1,1,float(5.0)	//�萔
��2��ɓn��w�肵�܂��B

p2�́Avector_add�̈����̈�ԍ���0�Ƃ����ԍ��Ƃ��čl���܂��B

�P��Z�b�g����Ύ��Z�b�g�������܂œ����l���c��܂��B
p3�ɂ͕�����^�ϐ��Aint�^�ϐ��Afloat�^�ϐ��Adouble�^�ϐ����w��ł��A�܂�mem_object id���w��\�ł��B


p4��0�ȊO�ɂ���ƁA���̈����̓��[�J���������i���L�������j�Ƃ��ēo�^����܂��B���[�J���������̓O���[�o�����������e�ʂ����Ȃ��������ɃA�N�Z�X���\�ȏ����ǎ�\�������ł��B
��̃��[�N�O���[�v���ł����l��ێ��ł��܂���B�����l�͐ݒ�s��0�܂��͕s��ł��B
����v�Z���A���̃X���b�h�Ə������L�������Ƃ��Ɏg���܂��B�ȉ��Q�ƁB
p4��0�ȊO�̂Ƃ��Ap4�ɂ͊m�ۂ��������[�J���������T�C�Y(byte)��int�Ŏw�肵�ĉ������Bp3�͖�������܂��B


���[�J���������̎g�����͈ȉ��̂Ƃ���ł�

��
�J�[�l���R�[�h
__kernel void vector_add(__global double *A, __global double *B, __local double block[] , int bekii, int n) {
	block[0]=1;//���L��������0�Ԗڂ�1����
�E�E�E�E�E

�ɑ΂���HSP�X�N���v�g�ł�HCLSetKernel��
HCLSetKernel p1,0,mem_object_dpA
HCLSetKernel p1,1,mem_object_dpB
HCLSetKernel p1,2,0,64 (��p3�ɂ�0���w��Ap4��64byte�܂�double�^*8�̋��L�����������Ƃ����Ӗ��AOpenCL�J�[�l���\�[�X���ł�block[0]�`block[7]���������[�N�O���[�v���ŋ��L���Ďg����)
HCLSetKernel p1,3,10
HCLSetKernel p1,4,1024



%href
HCLSetDev
HCLCreateKernel
HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3

;--------

%index
HCLCall
�J�[�l����������s

%prm
str p1,int p2,array p3,array p4,array p5,array p6,array p7,array p8,array p9
str p1 : �J�[�l��������			[in]
int p2 :�O���[�o�����[�N�T�C�Y(1�������񏈗���)[in]
array p3:�J�[�l���ɓn������		[in]
array p4:�J�[�l���ɓn������		[in]
array p5:�J�[�l���ɓn������		[in]
array p6:�J�[�l���ɓn������		[in]
array p7:�J�[�l���ɓn������		[in]
array p8:�J�[�l���ɓn������		[in]
array p9:�J�[�l���ɓn������		[in]
%inst

HCLBuildProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer���������J�[�l������C�Ɏ��s���Ă��܂��܂��B
p2�ɂ̓O���[�o�����[�N�T�C�Y�i���s���������񏈗����j
p3�ȍ~�̓J�[�l���ɓn���������BHSP���Ŋm�ۂ����z��ϐ����w�肵�Ă��������B
p3�`p9�͈����̏ȗ����ł��Ȃ��̂ŁA�ȗ��������Ƃ��́uNULL�v���Z�b�g���Ă��������B

������HCLBuildProgram,HCLCreateKernel,HCLSetKernel,HCLCreateBuffer,HCLWriteBuffer,HCLReadBuffer,HCLReleaseKernel,HCLReleaseProgram,HCLReleaseMemObject,varsize���g�p���Ă��܂��B
���̖��߂Ŋm�ۂ���VRAM���́A���̖��߂��I���܂łɕK���j������܂��B
HCLDoKernel�ƈႢ�A�^�X�N����������܂Ŏ��̖��߂ɂ���܂���B


�����̖��߂��g���O��
���̖��߂�OpenCL�̓���p�Ƃ��āA�܂��ȈՂ�OpenCL�𗘗p�ł��邱�Ƃ�ړI�ɍ쐬�������߂ł��B
�iLV1_�ȒP�Ɉ�����j
�uHSP�ŗp�ӂ����z��ϐ���VRAM���Ɉڂ������A�Z�b�g�����v�Ȃǂ����������A��菉�S�҂��ȈՂɈ�����悤�ɂ��Ă���܂��B

���̖��߂𗘗p���邽�߂ɂ�

1.OpenCL�p�̖��߃\�[�X��ʌp�ӂ���B�i�ȈՂ�C����ɂĕ\�L�j
2.�����Ώۂ�HSP�̔z��ϐ���p�ӂ���B
3.HCLCall���s��AHCLCall�̈����Ƃ��ėp�ӂ����ϐ���OpenCL�ɂ���ď������ꂽ�`�Œl���Ԃ�B

OpenCL�̃J�[�l���֐���retrun�Ƃ����`��HSP�ɒl���A�����͂��܂���B
���ڕϐ�����Ēl��Ԃ��܂��B���̓_�ɒ��ӂ��ĉ������B

����Ă�����HCLDoKernel�AHCLDoKrn1,2,3�ւƃX�e�b�v�A�b�v���Ă��������B

���g�p����
���̖��߂��g���Ă�������x�����Ɍv�Z���s�����Ƃ��ł��܂����A�����\�[�X�ŉ��x���J��Ԃ��g�����̂ł͂���܂���B�v��ʃG���[�̌����ɂȂ�܂��B



%href
HCLDoKernel
;--------

%index
HCLDoKernel
�J�[�l�����s

%prm
int p1,int p2,array p3,array p4
int p1 : �J�[�l��id			[in]
int p2 : work_dim(1�`3)			[in]
array p3:global_work_size		[in]
array p4:local_work_size		[in]
%inst

p1�ɂ͎��s�������J�[�l��id
p2�ɂ�1�`3 (work dimension���O���[�o�����[�N�T�C�Y�ƃ��[�J�����[�N�T�C�Y�̎���)
p3�ɂ̓O���[�o�����[�N�T�C�Y(���񏈗���)���L������ϐ�
p4�ɂ̓��[�J�����[�N�T�C�Y���L������ϐ�
���w�肵�Ă��������B
p4�̕ϐ��̓��e��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B



�����̖��߂��g���O��
�{�v���O�C���̊�{�R���Z�v�g�͐��E��OpenCL���ȒP�Ɉ�����v���O�C����ڎw���ĊJ�����Ă���܂��B
���̂��ߓƓ��ȏ���������OpenCL�iGPGPU�j�̏���������⏕���邽�߂�
�����̃��x�����R�i�K�ɕ����Ă���܂��B

LV1	HCLCall		�𗘗p����OpenCL�i�ȒP�I�j
LV2	HCLDoKernel	�𗘗p����OpenCL�i�����炢�I�j
LV3	HCLDoKrn1�`3�𗘗p����OpenCL�i���ʁI�j

�����̊w�K�̗���x�ɕ����ď�ʂ̖��߂𗘗p���Ē�����΍K���ł��B
�i���R�������x��LV3�̕������R�����ł��B���������̂��߂̂�荂�x�ȃ������Ǘ��A�X���b�h�Ǘ��̒m�������K�v�ƂȂ�܂��j

OpenCL�iGPGPU�j�̎�Ȗ����̓z�X�g���iCPU���j�ƃf�o�C�X���i�O���{���j�̏����̋��n���ɂȂ�܂��B
����������ɂ̓������̊Ǘ��A�X���b�h�Ǘ��Ȃǂ��K�v�ƂȂ菈�����ώG�ɂȂ�܂����S�҂ɂ͗������h���ƍl���Ă���܂��B

���̂���OpenCL�����ꂩ�痘�p���悤�A�w�K���悤�Ƃ������
�g�p�҂̏������ȑf���ł���HCLCall����̗��p���I�X�X���������܂��B


��HCLDoKernel�ɂ���
���̖��߂�OpenCL�̓���p�Ƃ��āA�܂��ȈՂ�OpenCL�𗘗p�ł��邱�Ƃ�ړI�ɍ쐬�������߂ł��B
�iLV�Q�����炢�ȒP�Ɉ�����j
HCLCall�ł͎����I�ɏ������Ă����uHSP�ŗp�ӂ����z��ϐ���VRAM���Ɉڂ������v�u�X���b�h�̎����v��
����ݒ肵�Ȃ���΂Ȃ�܂���B
�������ݒ�ł��镔�������Ȃ�HCLCall�Ɣ�r���ď����̍��������s�������\�ɂȂ�܂��B



HSP���[�U�[�Ƃ���HCLDoKernel�iOpneCL�v���O�C���j�𗘗p���鎞�A�����̏���T���₷���_�����X�g�A�b�v���܂����B
���̂��߂�OpenCL�𗘗p�����ł̓Ɠ��ȏ�����������܂��B

	1.OpenCL�p�̖��߃\�[�X��ʌp�ӂ���K�v������B�i�ȈՂ�C����ɂĕ\�L�j
	�����Ă��̃\�[�X��HSP��ŌŗL�̖��߁iHCLBuildProgram�j�œǂݍ��݁B

	2.���̃\�[�X�̊֐����u�J�[�l���v�ƌ����閽�ߒP�ʂ�HSP��ŌŗL�̖��߁iHCLCreateKernel�j�ō쐬����B


	3.�J�[�l���֐��ւ̈������Z�b�g����ہA���̈����́@CL_mem_object id�Ƃ����ŗL�̃I�u�W�F�N�g�`���ł���K�v������B
	���̃I�u�W�F�N�g��p�ӂ���ɂ�HSP��ŌŗL�̖���HCLCreateBuffer�ɂč쐬����B
	�܂����̃I�u�W�F�N�g��HSP��ŗp�ӂ����ϐ�����ꍞ�݂�������HSP��ŌŗL�̖���HCLWriteBuffer�ɂē��ꍞ�ށB
�@
	4.��قǃJ�[�l���֐��ɓ��ꍞ�ނ��߂̈������ŗL�̃I�u�W�F�N�g�`���ɂėp�ӂ����B
	���̈������J�[�l���֐��Ɉ������Z�b�g����Ƃ��ŗL�̖��߁iHCLSetKernel�j���g�p���Ȃ���΂Ȃ�Ȃ��B 
	�i�܂����̈����̓J�[�l���̊֐��̈������R�������Ƃ��Ă���Â����Z�b�g�ł��Ȃ��B�j

	5.�����Ĉ������Z�b�g�����J�[�l�����ŗL�̖��߁iHCLDoKernel�j�Ŏ��s�B

	6.�����Ă��̌��ʂ��Q�Ƃ��鎞��HSP��̌ŗL�̖��߁iHCLReadBuffer�j�ň������Q�Ƃ���B

���̂悤�ȏ������K�v�ƂȂ�̂̓z�X�g���iCPU���j�ƃf�o�C�X���i�O���{���j�̏���/�������Ǘ����ʌƂȂ��Ă��邩��ł��B
���̊Ԃ̋��n�����s���̂�OpneCL�ł���A���̂��߂ɓƓ��ȏ������K�v�Ȃ��Ă���܂��B




���C���f�N�X��Ԃɂ���
GPGPU�v���O���~���O�ɂ����āA�O���[�o�����[�N�T�C�Y�⃍�[�J�����[�N�T�C�Y�͂ƂĂ��d�v�ȊT�O�ɂȂ��Ă��܂��B
OpenCL�����łȂ�CUDA�ł��l���������܂��B


html{
<img src="./doclib/HSPCL32/thumbs/d22.png">
}html


���̐}�S�̂�NDRange

NDRange �T�C�Y Gx��global_work_size[0]���O���[�o�����[�N�A�C�e��x�̃T�C�Y�����̐}����4
NDRange �T�C�Y Gy��global_work_size[1]���O���[�o�����[�N�A�C�e��y�̃T�C�Y�����̐}����6

���[�N�O���[�v�T�C�YSx��local_work_size[0]�����[�J�����[�N�A�C�e��x�̃T�C�Y�����̐}����2
���[�N�O���[�v�T�C�YSy��local_work_size[1]�����[�J�����[�N�A�C�e��y�̃T�C�Y�����̐}����3

���[�N�A�C�e�����X���b�h�����̐}�Ō�����24���鐅�F�̔��B

�Ԙg���̉��F���Ƃ���(�O���[�v��)�ŋ��L���������g���܂��B
�uVRAM�v�Ɓu���L�������v�͈Ⴂ�܂��B

VRAM���r�f�I�������[���f�o�C�X�������[���O���[�o���������[��GDDR5�i�A�N�Z�X��Ԓx���j���J�[�l���\�[�X��__global�Ŏw�肵���ϐ�
���L�������[���P���L���b�V�������[�J���������[�i���������j���J�[�l���\�[�X��__local�Ŏw�肵���ϐ�
�v���C�x�[�g�������[�����W�X�^�i��ԑ����j���J�[�l���\�[�X�ŉ����w�肵�Ȃ��������̕ϐ�(uint ic�@�Ƃ��͂���������Ă���)

�v���O���}��OpenCL�Ńf�[�^���񏈗����s�����߂ɃC���f�N�X��Ԃ̎������A���[�N�A�C�e���̑����A���[�N�O���[�v�T�C�Y���w�肷�邱�ƂŃC���f�N�X��Ԃ��`���Ȃ���΂Ȃ�܂���B


���C���f�N�X��Ԃɂ�����v�Z�ƃ��[�J�����[�N�T�C�Y�ɂ���
�܂��͂��߂ɁA�J�[�l���͈�̌v�Z�̗�����L�������̂ł��B
��̃X���b�h�ň�̃J�[�l�������s���܂��B
���̃X���b�h�����������������O���[�o�����[�N�T�C�Y�܂�p3�Ŏw�肵�܂��B
�����ŃO���[�o�����[�N�T�C�Y��10000�Ƃ��܂��B
�O���[�o�����[�N�T�C�Y�͑傫�Ȕ��ŁA�������؂�d�؂肪����Ƃ��܂��B
�d�؂�ŋ�؂�ꂽ�����́A���̑傫�������[�J�����[�N�T�C�Y�ƌĂт܂��傤�B
���̓��[�J�����[�N�T�C�Y�́u�K�؂Ȓl�v���Ƃ��܂��B

���Ă܂�4�R�A��CPU���C���[�W���Ă݂܂��傤�B
������1�R�A��������4�X���b�h���s�ł����Ƃ���Ƃ���CPU��1���16�X���b�h���s�ł��邱�ƂɂȂ�܂��B
�����čŏ���16�X���b�h�����񏈗�����c���9984�X���b�h���҂��Ă����ԂɂȂ�܂��B�i�ȒP�ɂ��Ă��邾���Ŏ��ۂ͂�����ƈႢ�܂����E�E�j
�X���b�h���J�[�l����������������΁A�܂����̃X���b�h�ւƂ����Ă����܂��B
���ꂪ625(=16/10000)��J��Ԃ���A���̃^�X�N���I���ƂȂ�܂��B
���̂��߁A�e�X���b�h�͂��ꂼ��o���o���̃^�C�~���O�Ōv�Z����n�߁A�I���̃^�C�~���O���Ⴄ�̂ŁA�X���b�h���m�Ńf�[�^�ʐM���邱�Ƃ͂ł��Ȃ��͂��ł��B
100�Ԗڂ̃X���b�h�̌v�Z���ʂ�1�Ԗڂ̃X���b�h�Ŏg�������ƌ����Ă������Ȃ̂ł��B
�t��1�Ԗڂ̃X���b�h�̌v�Z���ʂ�100�Ԗڂ��g�������Ƃ����̂������ł��B�Ȃ��Ȃ�K��1�Ԗڂ̃X���b�h���珇�ԂɌv�Z���n�߂Ă����Ƃ������̂ł͂Ȃ�����ł��B
�Ƃ��낪p4�̃��[�J�����[�N�T�C�Y�����܂��ݒ肷�邱�ƂŁA�X���b�h���m�̒ʐM���\�ɂȂ�ꍇ������܂��B
�����Ń��[�J�����[�N�T�C�Y��100�Ƃ��܂��B
��������10000�̃��[�N�T�C�Y�̂ƂĂ��傫�Ȕ����������̂ł����A������100�̕����ɕ������܂����B
��������̕����̒��ɂ̓J�[�l���Ƃ����A�C�e����100���݂��܂��B
CPU�́A���̕����P�ʂŏ������邱�Ƃ��ł��܂��B�Ƃ��������͂P�R�A�͂P�����P�ʂŏ������܂��B
�P�R�A���ꕔ�����̃J�[�l�������s���悤�Ƃ���Ƃ��ACPU�͂P�R�A�̒���100�X���b�h���Ă܂��B
�������v�Z���x�͏��4�X���b�h�̎����25����1�ɗ����邩������܂���B
�����Ă��̂Ƃ�100�̃X���b�h�͕K�������݂����낦�܂��B�����������̂Ȃ̂ł��B
�����ɗ��_������܂��B
�����̒��͕K�������ɏ�������Ă���̂ŁA1�Ԗڂ̃X���b�h��100�Ԗڂ̃X���b�h�����L����������ăf�[�^��ʐM���邱�Ƃ��ł���̂ł��B
�K�������ɂƂ����̂́A100�X���b�h���ׂĂ��\�[�X�R�[�h�̓����s�����s���Ă���ƌ������悤�Ȋ����ł��B
�����܂œ������Ă���΁A�����̒��ɂ���100�̃X���b�h�S�Ă���������f�[�^�����L���邱�Ƃ��ł���̂��[���ł��B

���Ă����ŁA���鏈���ɂ��100��1�����������������Ɏ��Ԃ��������Ă��܂����Ƃ��܂��B
�����100�X���b�h�͕K�������݂����낦�Ă���̂Ŏc��99�̃X���b�h�͑҂��ڂ�������炢�܂��B
�{���P�R�A4�X���b�h�܂Ŏ��s�ł���̂�1�X���b�h�����v�Z�ł��Ă��Ȃ����ƂɂȂ�܂��B
����͂P�R�A�̋@�\��3/4�����肵�Ă����ԂȂ̂ł��Ȃ薳�ʂł���ƌ����܂��B
���ꂪ���_�ł��B
����1�X���b�h�̏������I���΁A�c���99�X���b�h���I�����āACPU�R�A�͎��̕������������n�߂܂��B

���[�J�����[�N�T�C�Y��傫�����������ꍇ�̌��_�́A��̃X���b�h��������������Ǝc��̃X���b�h���҂��Ȃ��Ƃ����Ȃ��Ȃ邱�Ƃł��B
���������L���������g��Ȃ�����ƌ����ă��[�J�����[�N�T�C�Y��1�ɂ���ƁA�P�R�A�������ɏ����ł���̂��ꕔ�������Ȃ̂�
�ꕔ����������̂ɂP�X���b�h���ĂāA����ς�3/4�����ʂƂȂ��Ă��܂��܂��B
���̏ꍇ��Ԃ������[�J�����[�N�T�C�Y�́u�K�؂Ȓl�v��4�ƂȂ�܂��B

GPU�̏ꍇ�͂ǂ��ł��傤�B
AMD HD7970 �̏ꍇ�AGCN�Ƃ������Z��(�R�A)��32����܂��B
���GCN��64�X���b�h�܂œ����ɏ����ł���̂ł��̏ꍇ��Ԃ������[�J�����[�N�T�C�Y��64�ƂȂ�܂��B
���[�J�����[�N�T�C�Y��64���w�肵�����A32�̃R�A���e�X��64�̃X���b�h���������n�߂�̂ŁA������2048�̕��񏈗����\�Ƃ������ƂɂȂ�܂��B
���Ȃ݂Ɉꕔ��nVidia�̃O���{��1�̃R�A������192�X���b�h���������ł�����̂�����悤�ł��B

�܂胍�[�J�����[�N�T�C�Y�ɂ́A���Z�R�A�����肳���Ȃ����߂̓K�؂ȃX���b�h�����w�肵�Ȃ��ƁA�����������ł��Ȃ���Ƃ������Ƃł��B




�������ڍא���

p2��work_dim�ƌ����Aglobal_work_size��local_work_size�̎�����ݒ肵�܂��B1�`3���w��ł��܂��B
1�Ȃ�J�[�l���\�[�X��get_global_id(0)���g���܂��B
2�Ȃ�J�[�l���\�[�X��get_global_id(0),get_global_id(1)���g���܂��B
3�Ȃ�J�[�l���\�[�X��get_global_id(0),get_global_id(1),get_global_id(2)���g���܂��B
get_global_id�̓X���b�h�ԍ���߂��܂��B�Q�����X���b�h�Ȃ�get_global_id(0)��x�����̃X���b�h�ԍ��Aget_global_id(1)��y�����̃X���b�h�ԍ���߂��܂��B

p3�ɂ́A�J�[�l���������s�������������w�肵�܂��B���s���ɂ��̐��̕��������[�N�A�C�e������������܂��B
�����p2��work_dim�Ŏw�肵���l��2�ȏ�̏ꍇ�Ap3�͔z��ϐ��Ŏw�肵�Ȃ���΂����܂���(�v�f��work_dim��)
p4�̓��[�J�����[�N�T�C�Y�ƌ����A1�`256(�f�o�C�X�ɂ��)���w��ł��܂��B������p2��work_dim�Ŏw�肵���l��2�ȏ�̏ꍇ�A�z��ϐ��Ŏw�肵�Ȃ���΂����܂���(�v�f��work_dim��)
������p3�̊e�v�f��p4�̊e�v�f�Ŋ���؂�Ȃ���΂����܂���B
�܂�p4�̊e�v�f�̑S���̐ς�HCLGetDeviceInfo_i(CL_DEVICE_MAX_WORK_GROUP_SIZE,0)�œ���ꂽ���𒴂���ꍇ�G���[�ɂȂ�܂��B�����Ă�256��1024���炢�ł��B

�����قǂ̐����ʂ�Ap4��1���w�肷��Ɣ�����ɂȂ��Ă��܂����Ƃ������ł��B�Ƃ���GPU�ł͌����ł��B
CPU�ł́ASIMD���t���Ɏg�����Ȃ����߂�p4�̒l��1���4��8�ɂ����ق����ǂ��ꍇ������܂����������܂�֌W�Ȃ��A�J�[�l���\�[�X���Ɂufloat4�v��ufloat32�v���g�����v�Z����ꂽ�ق���SIMD���t���Ɏg����ł��傤�B
p4�ɑ傫���l��ݒ肵�Ă����x�I�ɕs���ɂȂ邱�Ƃ͊�{�I�ɂ͂���܂��񂪁A�e�X�̊��Ŋm���߂Ȃ��璲�߂��ĉ������B




�ȉ��Ƀ��[�N�O���[�v��O���[�o��id�Ȃǂ̗p���g�����̉�����ڂ��܂��B

��
work_dim=2
global_work_size=4,6
local_work_size=2,3
���w�肵���Ƃ��܂��B

html{
<img src="./doclib/HSPCL32/thumbs/d22.png">
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
<img src="./doclib/HSPCL32/thumbs/d2.png">
}html


���g�p����
�i�P�j
HCLCreateBuffer�ō쐬����VRAM�͈̔͊O�ɃJ�[�l���\�[�X���ŃA�N�Z�X���悤�Ƃ������A�t���[�Y�܂��̓u���[�X�N���[���ɂȂ錻�ۂ��m�F����Ă��܂��B

�i�Q�j
�ꕔ��NVidia�̃O���{�ł́A�O���[�o�����[�N�T�C�Y�̓��[�J�����[�N�T�C�Y�Ő����ł��Ȃ���΂����܂���B
dim globalsize,3
dim localsize,3
globalsize=2048,2048,7
localsize=8,8,4
�ł������ꍇ�Aglobalsize.2��localsize.2�Ŋ���؂�Ȃ����߂ɃG���[�ƂȂ�܂��B������AMD�̃O���{��ŐV��NVidia�̃O���{�A�ꕔ��CPU�ł̓G���[�ɂȂ�Ȃ����Ƃ�����܂��B�G���[�̏ꍇ
�uglobal_work_size��local_work_size �Ő����ł��Ȃ��A�܂���local_work_size[0]*local_work_size[1]*local_work_size[2]���A��̃��[�N�O���[�v���̃��[�N�A�C�e�����̍ő�l�𒴂����v
�Ƃ������b�Z�[�W���o�܂��B

�i�R�j
�������ɂ���
�uHCLDoKernel�v�̓G���[�`�F�b�N�����@�\�������work_dim���򏈗������Ă��邽�߁A�I�[�o�[�w�b�h���C�ɂȂ���́uHCLDoKrn1�v�uHCLDoKrn2�v�uHCLDoKrn3�v��
�G���[�`�F�b�N�Ȃ��̓��������s�Ȃ��܂��B����łł��鍂�����Ƃ����Ă����Ɍy���Ȃ��̂ł��B���b�J�[�l�����s���߂�1000��Ăяo�����x���ō��������Ă��܂��B
(2014/10/8 �ꕔ�̃G���[�`�F�b�N���uHCLDoKrn1�v�uHCLDoKrn2�v�uHCLDoKrn3�v�ɒǉ������̂ŏ������S�������܂�܂����B)

�i�S�j
���̖��߂̓J�[�l�������s����킯�ł͂Ȃ��J�[�l�����L���[�ɓ���邾���Ȃ̂ŁA���̖��߂����s�������ƂɌv�Z���I�����Ă���킯�ł͂���܂���B�^�X�N�̊m���ȏI���ɂ�HCLWaitTask���g���Ă��������B������HCLWaitTask���g��Ȃ��Ă��AHCLDoKernel�̌�HCLReadBuffer�Ōv�Z���ʂ̃f�[�^��ǂݏo�����Ƃ����ꍇ�AHCLReadBuffer�����s�������_�ŕK��HCLDoKernel�ő������J�[�l���̏������I������悤�Ȏd�l�ɂȂ��Ă���ꍇ������܂�(�@��ɂ��)�B���̏ꍇHCLWaitTask���g��Ȃ��Ă��K���v�Z���ʂ�HCLReadBuffer�œǂݏo����Ƃ������Ƃł��B
���X�ʓ|�Ȏd�l�ł����A�J�[�l�����L���[�ɓ��ꂽ��͂����Ɏ��̖��߂Ɉڂ�܂��̂ŁACPU�����ʂȎ��Ԃ�҂��Ƃ͂Ȃ��Ƃ��������b�g������܂��B

���J�[�l���\�[�X�ɂ���
�i�P�j
�萔�́uconst�v���udefine�v���g�����ق��������ł��B

�i�Q�j
�uclamp�v�֐��͌Â��O���{�ł̓R���p�C���G���[�ɂȂ�܂��B

�i�R�j
�umad24�v��umul24�v�֐��ł́A�����̌^��K�������ĉ������B�f�o�C�X�ɂ���Ă̓R���p�C�����ʂ�����ʂ�Ȃ������肵�ăo�O�̌����ƂȂ�܂��B

�i�S�j
for()�����g���Ƃ��A�R���p�C�������[�v�W�J����ꍇ������܂��B���[�v�񐔂����܂�ɑ����ꍇ�A���߃R�[�h�ŃL���b�V�����������ꐳ�����v�Z���ł��Ȃ����Ƃ�����܂��B

�i�T�j
�g�p���ӂł��������܂������������A�N�Z�X�ᔽ�ɏ\�����ӂ��ĉ������B�u���[�X�N���[���ɂȂ�܂��B

�i�U�j
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

�i�V�j
�g�����\�I�ȕϐ��^
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

�i�W�j
�^�ϊ�
uint a;
uchar b=1;
a=b;//����ł�������
a=(uint)b;//���̂ق����G���[��h����

������
float ftmp;
int i0=123;
ftmp=(float)i0;//ftmp�ɂ�123.0000����������

�i�X�j
�֐�
�u__global �v��VRAM��̕ϐ����g���Ƃ����Ӗ�
�u__local�v�̓��[�J����������̕ϐ����g���Ƃ����Ӗ�

�i�P�O�j
�g����֐��A���߁A���Z�q�ȂǏڍׂɒm�肽������
https://www.khronos.org/files/opencl-quick-reference-card.pdf
��

�i�P�P�j
double�^�͕W���ŃT�|�[�g���Ă��܂���B
�g�������ꍇ�̓J�[�l���\�[�X�̐擪��

#ifdef cl_khr_fp64
  #pragma OPENCL EXTENSION cl_khr_fp64 : enable
#elif defined(cl_amd_fp64)
  #pragma OPENCL EXTENSION cl_amd_fp64 : enable
#else
  #error Double precision floating point not supported by OpenCL implementation.
#endif

������Ă��������B


���Ō��
���ꂾ���ł͂܂������s���ŁA����������Ǝv���܂����A�{�v���O�C���t���̃T���v���̃R�����g��A�h�L�������g���ǂ�ł�����������ȂƎv���܂��B
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
;--------

%index
HCLDoKrn1
�ꎟ���ŃJ�[�l�����s

%prm
int p1,int p2,int p3
int p1 : �J�[�l��id			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]

%inst
work_dim��1�̏ꍇ��HCLDoKernel�Ɠ����ł��B

p3��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B

�����̖��߂��g���O��
LV3	HCLDoKrn1�`3�𗘗p����OpenCL
OpenCL�iGPGPU�j�̏���������⏕���邽�߂Ƀ��x�����R�i�K�ɕ����Ă���܂�����
HCLDoKrn1�`3��LV3�ƂȂ��Ă���܂��B

���̒i�K�Œʏ��OpenCL�Ɠ������x���̏������s���܂��B
���̒i�K�܂ł���ꂽ�ꍇ�͒ʏ�̃T�C�g�Ȃǂ��Q�l�Ȃ���悤���肢�v���܂��B



%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3

;--------


;--------

%index
HCLDoKrn1_sub
�ꎟ���ŃJ�[�l�����s

%prm
int p1,int p2,int p3
int p1 : �J�[�l��id			[in]
int p2 : global_work_size		[in]
int p3 : local_work_size		[in]

%inst

���̖��߂ł�global_work_size��local_work_size�Ŋ���؂�Ȃ��ꍇ�A�G���[���o�����ɃJ�[�l����2��ɓn����s������̂ł��B

HCLDoKrn1�ł�global_work_size��local_work_size�Ŋ���؂�Ȃ���΂����܂���ł����B
����local_work_size��0���w�肵��OpenCL�����ɂ܂����Ă��Aglobal_work_size���f���̏ꍇlocal_work_size��1�ɂ���Ă��܂����Ƃ�����A���̏ꍇ�v�Z��������ɂȂ��Ă��܂��܂��B

���̖��߂ł�1��ڂ�local_work_size�Ŋ���؂�镪������global_work_size�����s���A2��ڂɂ��܂�̒[����local_work_size��global_work_size�Ƃ��Ď��s���܂��B���̂Ƃ��uget_global_id(0)�v����������n�܂�悤�ɂȂ��Ă��܂��B
�������uget_group_id(0)�v�̒l��0�ɂȂ��Ă��܂��܂��B

p3��0�͎w��ł��܂���B

%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3

;--------




%index
HCLDoKrn2
�j�����ŃJ�[�l�����s

%prm
int p1,int p2,int p3,int p4,int p5
int p1 : �J�[�l��id			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : local_work_size.0		[in]
int p5 : local_work_size.1		[in]
%inst
work_dim��2�̏ꍇ��HCLDoKernel�Ɠ����ł��B

p4��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B

%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn3

;--------

%index
HCLDoKrn3
�O�����ŃJ�[�l�����s

%prm
int p1,int p2,int p3,int p4,int p5,int p6,int p7
int p1 : �J�[�l��id			[in]
int p2 : global_work_size.0		[in]
int p3 : global_work_size.1		[in]
int p4 : global_work_size.2		[in]
int p5 : local_work_size.0		[in]
int p6 : local_work_size.1		[in]
int p7 : local_work_size.2		[in]

%inst
work_dim��3�̏ꍇ��HCLDoKernel�Ɠ����ł��B

p5��0�̏ꍇ�A�O���[�o�����[�N�A�C�e�����ǂ̂悤�Ƀ��[�N�O���[�v�ɕ������邩�� OpenCL ���������肵�܂��B

%href
HCLDoKernel
HCLSetDev
HCLSetKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2

;--------

%index
HCLWaitTask
�^�X�N�҂�

%prm

%inst

HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer(�u���b�L���O���[�hoff�̏ꍇ)
HCLReadBuffer(�u���b�L���O���[�hoff�̏ꍇ)
�̖��߂ɂăL���[�ɂ��܂����^�X�N���S�ďI���܂ŁACPU�͎��̖��߂Ɉڂ�܂���B


%href
HCLDoKernel
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
;--------

%index
HCLReleaseKernel
�J�[�l���j��

%prm
int p1
int p1 : �J�[�l��id			[in]

%inst

�o�^�J�[�l����j�����܂��B

%href
HCLCreateKernel
;--------

%index
HCLReleaseProgram
�v���O�����j��

%prm
int p1
int p1 : �v���O����id			[in]
%inst

�o�^�R���p�C���ς݃v���O������j�����܂��B

%href
HCLBuildProgram
;--------