;------------------------
;   �������֘A
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
OpenCL����������

%port
Win

;-------- ref --------

%index
HCLCreateBuffer
VRAM�쐬

%prm
(int64 p1)
int64 p1 : �m�ۂ���byte��	[in]

%inst
HCLSetDevice�Ŏw�肳�ꂽ�O���t�B�b�N�{�[�h�Ȃǂ̃f�o�C�X��Ƀ��������m�ۂ��܂��B
CL_mem_object id���Ԃ�܂��B
�����64bit int�^�ł��B
���GDDR5,6�Ȃǂ̃������̂���O���{��ɁA�w�肵���T�C�Y�̃��������m�ۂ���邱�ƂɂȂ�܂��B
HCLReleaseBuffer�ŉ�����邱�Ƃ��ł��܂��B

����CL_mem_object id������O�Ƀ��X�g����ƁAGPU���̃������ɃA�N�Z�X�ł��Ȃ����ƂɂȂ�A���������[�N�ɋ߂���ԂɂȂ��Ă��܂��܂��B
CL_mem_object id��ϐ��ŕێ����Ă���ꍇ�㏑���ɂ͂����Ӊ������B


%href
HCLSetDevice
HCLReleaseBuffer
;--------

%index
HCLReleaseBuffer
VRAM�j��

%prm
int64 p1
int64 p1 : CL_mem_object id			[in]
%inst
�f�o�C�X��̃�������������܂��B

%href
HCLCreateBuffer
;--------

%index
HCLWriteBuffer
HSP�z�����VRAM�ɏ���

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : �R�s�[��CL_mem_object id		[in]
array p2:�R�s�[���z��ϐ�			[in]
int64 p3 : �R�s�[�T�C�Ybyte,�ȗ���		[in]
int64 p4 : �R�s�[��̃I�t�Z�b�g,�ȗ���		[in]
int64 p5 : �R�s�[���̃I�t�Z�b�g,�ȗ���		[in]
int p6 : �u���b�L���O���[�hoff,�ȗ���		[in]
int p7 : event_id,�ȗ���			[in]

%inst
�z�X�g(CPU)����HCLSetDevice�Ŏw�肵���f�o�C�X(GPU)���Ƀf�[�^��]�����܂��B
p3�͏ȗ����A�R�s�[��ƃR�s�[���̔z��̂��������������̗p����܂��B
p4,p5�͏ȗ���0�ł��B
p3,p4,p5�̒P�ʂ�byte�ł��B
p6�̃u���b�L���O���[�h��0���w�肷���off�ɂȂ�A�]�����������Ȃ������Ɏ��̖��߂Ɉڂ�܂��B
p6�͏ȗ����f�t�H���g��1�ł��B�܂�u���b�L���O���[�h��on�ɂȂ��Ă���A�]�����I���܂ł��̖��߂̎��s���I���܂���B


%href
HCLCreateBuffer
HCLReadBuffer
HCLFillBuffer
;--------

%index
HCLReadBuffer
VRAM����HSP�z����ɓǍ�

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : �R�s�[��CL_mem_object id		[in]
array p2:�R�s�[��z��ϐ�			[out]
int64 p3 : �R�s�[�T�C�Ybyte,�ȗ���		[in]
int64 p4 : �R�s�[���̃I�t�Z�b�g,�ȗ���		[in]
int64 p5 : �R�s�[��̃I�t�Z�b�g,�ȗ���		[in]
int p6 : �u���b�L���O���[�hoff,�ȗ���		[in]
int p7 : event_id,�ȗ���			[in]

%inst
HCLSetDevice�Ŏw�肵���f�o�C�X(GPU)����z�X�g(CPU)���Ƀf�[�^��]�����܂��B
p3�͏ȗ����A�R�s�[��ƃR�s�[���̔z��̂��������������̗p����܂��B
p4,p5�͏ȗ���0�ł��B
p3,p4,p5�̒P�ʂ�byte�ł��B
p6�̃u���b�L���O���[�h��0���w�肷���off�ɂȂ�A�]�����������Ȃ������Ɏ��̖��߂Ɉڂ�܂��B
p6�͏ȗ����f�t�H���g��1�ł��B�܂�u���b�L���O���[�h��on�ɂȂ��Ă���A�]�����I���܂ł��̖��߂̎��s���I���܂���B


%href
HCLCreateBuffer
HCLWriteBuffer
HCLFillBuffer
;--------

%index
HCLCopyBuffer
VRAM���m�R�s�[

%prm
int64 p1,int64 p2,int64 p3,int64 p4,int64 p5,int p6
int64 p1 : �R�s�[��CL_mem_object id		[in]
int64 p2 : �R�s�[��CL_mem_object id		[in]
int64 p3 : �R�s�[�T�C�Ybyte,�ȗ���		[in]
int64 p4 : �R�s�[��̃I�t�Z�b�g,�ȗ���		[in]
int64 p5 : �R�s�[���̃I�t�Z�b�g,�ȗ���		[in]
int p6 : event_id,�ȗ���			[in]

%inst
HCLSetDevice�Ŏw�肵���f�o�C�X��̃������ԂŃR�s�[�����܂��B
p3�͏ȗ����A�R�s�[��ƃR�s�[���̔z��̂��������������̗p����܂��B
p4,p5�͏ȗ���0�ł��B
p3,p4,p5�̒P�ʂ�byte�ł��B


%href
HCLCreateBuffer
HCLWriteBuffer
HCLReadBuffer

;--------
%index
HCLCreateBufferFrom
VRAM�쐬(HSP�z��ϐ�����)

%prm
(array p1)
array p1 : HSP���̔z��ϐ�		[in]

%inst
dim���߂ȂǂŊm�ۂ���HSP�̔z��ϐ����A���̂܂܃R�s�[����VRAM�̍쐬�����܂��B
CL_mem_object id���Ԃ�܂��B
�����64bit int�^�ł��B

%href
HCLCreateBuffer
;--------

%index
HCLWriteBuffer_NonBlocking
HSP�z�����VRAM�ɏ����A�����m���u���b�L���O���[�h

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : �R�s�[��CL_mem_object id		[in]
array p2:�R�s�[���z��ϐ�			[in]
int64 p3 : �R�s�[�T�C�Ybyte,�ȗ���		[in]
int64 p4 : �R�s�[��̃I�t�Z�b�g,�ȗ���		[in]
int64 p5 : �R�s�[���̃I�t�Z�b�g,�ȗ���		[in]
int p6 : �u���b�L���O���[�hoff,�ȗ���		[in]
int p7 : event_id,�ȗ���			[in]

%inst

�z�X�g(CPU)����HCLSetDevice�Ŏw�肵���f�o�C�X(GPU)���Ƀf�[�^��]�����܂��B

��HCLWriteBuffer�Ƃ̈Ⴂ
HCLWriteBuffer�̃m���u���b�L���O���[�h�w���NVIDIA GPU�ł͖����Ȃ悤�ŁA�K���u���b�L���O��on�ɂȂ��Ă��܂��܂��B
�]�����I���܂ő҂������̂��ǂ����Ă�����ꍇ�A����HCLWriteBuffer_NonBlocking���߂��g�p���Ă��������B
�v���O�C�������ł�
std::thread
�ŕʃX���b�h�𗧂��グ�A���̒���clEnqueueWriteBuffer�����s���Ă��܂��B
���̂Ƃ��A�ʃX���b�h�����ǂ̃^�C�~���O�Ŏ��s����邩�͂킩��Ȃ����Ƃɒ��ӂ��Ă��������B

�Ⴆ��HCLWriteBuffer_NonBlocking�̓]�����I���܂ő҂������ꍇHCLFinish�����s���Ă��AclEnqueueWriteBuffer���̂̎��s���܂��̉\��������܂��B
���̏ꍇ�]�����I���O��HCLFinish�̎��s���������Ă��܂��Ƃ������Ƃ��N����܂��B

���̂��߂�HCLGet_NonBlocking_Status�Ƃ������߂�����A���ꂪ0�ɂȂ��Ă���Ίm����HCLWriteBuffer_NonBlocking�̏������I����Ă��邱�Ƃ��ۏ؂���܂��B


%href
HCLWriteBuffer
HCLReadBuffer_NonBlocking
HCLGet_NonBlocking_Status
;--------

%index
HCLReadBuffer_NonBlocking
VRAM����HSP�z����ɓǍ��A�����m���u���b�L���O���[�h

%prm
int64 p1,array p2,int64 p3,int64 p4,int64 p5,int p6,int p7
int64 p1 : �R�s�[��CL_mem_object id		[in]
array p2:�R�s�[��z��ϐ�			[out]
int64 p3 : �R�s�[�T�C�Ybyte,�ȗ���		[in]
int64 p4 : �R�s�[���̃I�t�Z�b�g,�ȗ���		[in]
int64 p5 : �R�s�[��̃I�t�Z�b�g,�ȗ���		[in]
int p6 : �u���b�L���O���[�hoff,�ȗ���		[in]
int p7 : event_id,�ȗ���			[in]

%inst

HCLSetDevice�Ŏw�肵���f�o�C�X(GPU)����z�X�g(CPU)���Ƀf�[�^��]�����܂��B

��HCLReadBuffer�Ƃ̈Ⴂ
HCLReadBuffer�̃m���u���b�L���O���[�h�w���NVIDIA GPU�ł͖����Ȃ悤�ŁA�K���u���b�L���O��on�ɂȂ��Ă��܂��܂��B
�]�����I���܂ő҂������̂��ǂ����Ă�����ꍇ�A����HCLReadBuffer_NonBlocking���߂��g�p���Ă��������B
�v���O�C�������ł�
std::thread
�ŕʃX���b�h�𗧂��グ�A���̒���clEnqueueReadBuffer�����s���Ă��܂��B
���̂Ƃ��A�ʃX���b�h�����ǂ̃^�C�~���O�Ŏ��s����邩�͂킩��Ȃ����Ƃɒ��ӂ��Ă��������B

�Ⴆ��HCLReadBuffer_NonBlocking�̓]�����I���܂ő҂������ꍇHCLFinish�����s���Ă��AclEnqueueReadBuffer���̂̎��s���܂��̉\��������܂��B
���̏ꍇ�]�����I���O��HCLFinish�̎��s���������Ă��܂��Ƃ������Ƃ��N����܂��B

���̂��߂�HCLGet_NonBlocking_Status�Ƃ������߂�����A���ꂪ0�ɂȂ��Ă���Ίm����HCLReadBuffer_NonBlocking�̏������I����Ă��邱�Ƃ��ۏ؂���܂��B

%href
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLGet_NonBlocking_Status
;--------


%index
HCLGet_NonBlocking_Status
NonBlocking���s�󋵎擾

%prm
()

%inst

HCLReadBuffer_NonBlocking��HCLWriteBuffer_NonBlocking�̎��s�󋵂��ǂ��Ȃ��Ă��邩���擾���܂��B
�ȍ~����2��NonBlocking���߂ƌ����܂��B
�܂�NonBlocking���߂��Ăяo�������Ƃ̓v���O�C��������thread_start�ϐ����C���N�������g����܂��B
���̌�ʃX���b�h�������オ��ANonBlocking���ߓ�����clEnqueueReadBuffer,clEnqueueWriteBuffer�����s����A���̖��߂�ʂ�߂������thread_start�ϐ����f�N�������g����܂��B
������clEnqueueReadBuffer,clEnqueueWriteBuffer���͓̂]�����L���[�ɓ���邾���̖��߂ł��邱�Ƃɒ��ӂ��K�v�ŁA(�u���b�L���O���[�hoff)����(NVIDIA��GPU�łȂ�)�ꍇ�ɓ]�����I���O��thread_start���f�N�������g����Ă��邱�Ƃ����邱�Ƃ��l�����Ă��������B

����HCLGet_NonBlocking_Status���߂�thread_start�̐��l���擾���閽�߂ł��B

NVIDIA GPU�̏ꍇ�ANonBlocking���߂ɂ��f�[�^�]����������Ɏg�����Ƃ��ł��܂��B
�܂�NonBlocking���߂�event id���w�肵���ꍇ�A�v���O�C��������clEnqueueReadBuffer,clEnqueueWriteBuffer�̍s��ʂ肷���Ȃ���event���̎擾�ł��Ȃ�����(�G���[�ɂȂ�)�Aevent�擾�\����ɂ��g�����Ƃ��ł��܂��B

%href
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
;--------

%index
HCLReadIndex_i32
VRAM����int�^��1�v�f�ǂݍ���

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]

%inst
GPU��VRAM���璼��1�̒l���Ƃ肾���Ԃ��܂��B
p1��CL mem obj id
p2�͓ǂݏo���C���f�b�N�X���w�肵�ĉ������B
�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

VRAM�̓��e��int�^4�̔z��ϐ��@(100,400,500,700)
�������ꍇ
HCLReadIndex_i32(memid,3)�@�́@700
��Ԃ��܂��B

%href
HCLReadIndex_dp
HCLReadIndex_fp
HCLReadIndex_i64
;--------

%index
HCLReadIndex_i64
VRAM����64bit int�^��1�v�f�ǂݍ���

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]

%inst
GPU��VRAM���璼��1�̒l���Ƃ肾���Ԃ��܂��B
p1��CL mem obj id
p2�͓ǂݏo���C���f�b�N�X���w�肵�ĉ������B
�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

VRAM�̓��e��64bit int�^4�̔z��ϐ��@(10000000000,40000000000,50000000000,70000000000)
�������ꍇ
HCLReadIndex_i64(memid,3)�@�́@70000000000
��Ԃ��܂��B

%href
HCLReadIndex_i32
HCLReadIndex_dp
HCLReadIndex_fp
;--------

%index
HCLReadIndex_dp
VRAM����double�^��1�v�f�ǂݍ���

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]

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
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_fp
;--------

%index
HCLReadIndex_fp
VRAM����float�^��1�v�f�ǂݍ���

%prm
(int64 p1,int64 p2)

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]

%inst
GPU��VRAM���璼��1�̒l���Ƃ肾���Ԃ��܂��B
p1��CL mem obj id
p2�͓ǂݏo���C���f�b�N�X���w�肵�ĉ������B
�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

VRAM�̓��e��float�^4�̔z��ϐ��@(100.0,400.0,500.0,700.0)
�������ꍇ
HCLReadIndex_d(memid,3)�@�́@700.0
��Ԃ��܂��B

%href
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
;--------

%index
HCLWriteIndex_i32
VRAM��1�v�f��������

%prm
int64 p1,int64 p2,int p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]
int p3 : ���e				[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��int�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

%href
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLWriteIndex_fp
;--------

%index
HCLWriteIndex_i64
VRAM��1�v�f��������

%prm
int64 p1,int64 p2,int64 p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]
int64 p3 : ���e				[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��64bit int�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B

%href
HCLWriteIndex_i32
HCLWriteIndex_dp
HCLWriteIndex_fp
;--------

%index
HCLWriteIndex_dp
VRAM��1�v�f��������

%prm
int64 p1,int64 p2,double p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]
double p3: ���e				[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��double�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B


%href
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_fp
;--------
%index
HCLWriteIndex_fp
VRAM��1�v�f��������

%prm
int64 p1,int64 p2,float p3

int64 p1 : CL_mem_object id		[in]
int64 p2 : �z��̗v�f(index)		[in]
float p3: ���e				[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)�̓��e��p3�l���������݂܂��B
�������݃C���f�b�N�X��p2�Ŏw�肵�܂��B
���̂Ƃ�VRAM��float�^�̔z��ϐ��Ƃ��čl���܂��B

�u���b�L���O���[�h�̓I��(�]�������܂ő҂�)�ł��B


%href
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
;--------
%index
HCLFillBuffer
VRAM���w��̌^�Ɛ��l�Ŗ��߂�

%prm
int64 p1,var p2,int64 p3,int64 p4,int p5

int64 p1 : CL_mem_object id		[in]
var p2 : pattern			[in]
int64 p3 : offset,�ȗ���		[in]
int64 p4 : size,�ȗ���			[in]
int p5 : event_id,�ȗ���		[in]

%inst
p1�Ŏw�肵��VRAM(CL mem obj id)��p2�̒l���������݂܂��B
p2�̌^��int�^�Ȃ�4byte�����Afloat�^�ł�4byte�����Adouble�^��int64�^�Ȃ�8byte�u���ɒl���������܂�܂��B
�ȗ���p3=0,p4=�������T�C�Y
�ƂȂ�܂��B

���̖��ߎ��͎̂��s����������܂ő҂��߂ł͂Ȃ��AOpenCL�R�}���h���L���[�ɓ���邾���ł���A���ۂ̃J�[�l���̎��s�I����҂ɂ�event���g����HCLFinish���ő҂��ƂɂȂ�܂��B

%href
HCLReadBuffer
HCLWriteBuffer
;--------

%index
HCLdim_i32FromBuffer
HSP�z��ϐ��m�ۂ�VRAM����R�s�[

%prm
array p1,int64 p2
array p1 : HSP���̔z��ϐ�			[out]
int64 p2 : �R�s�[��CL_mem_object id		[in]

%inst
p1�Ŏw�肵���ϐ���int�^�z��ϐ��Ƃ��ď��������A���e��p2����R�s�[���܂��B
�T�C�Y�͎����Ō��肳��܂��B
�Ȃ�HSP�̎d�l��A�m�ۂł���T�C�Y�̏����1GB�܂łł��B


%href
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
;--------
%index
HCLdim_i64FromBuffer
HSP�z��ϐ��m�ۂ�VRAM����R�s�[

%prm
array p1,int64 p2
array p1 : HSP���̔z��ϐ�			[out]
int64 p2 : �R�s�[��CL_mem_object id		[in]

%inst
p1�Ŏw�肵���ϐ���64bit int�^�z��ϐ��Ƃ��ď��������A���e��p2����R�s�[���܂��B
�T�C�Y�͎����Ō��肳��܂��B
�Ȃ�HSP�̎d�l��A�m�ۂł���T�C�Y�̏����1GB�܂łł��B


%href
HCLdim_i32FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
;--------
%index
HCLdim_dpFromBuffer
HSP�z��ϐ��m�ۂ�VRAM����R�s�[

%prm
array p1,int64 p2
array p1 : HSP���̔z��ϐ�			[out]
int64 p2 : �R�s�[��CL_mem_object id		[in]

%inst
p1�Ŏw�肵���ϐ���double�^�z��ϐ��Ƃ��ď��������A���e��p2����R�s�[���܂��B
�T�C�Y�͎����Ō��肳��܂��B
�Ȃ�HSP�̎d�l��A�m�ۂł���T�C�Y�̏����1GB�܂łł��B


%href
HCLdim_i64FromBuffer
HCLdim_i32FromBuffer
HCLdim_fpFromBuffer
;--------
%index
HCLdim_fpFromBuffer
HSP�z��ϐ��m�ۂ�VRAM����R�s�[

%prm
array p1,int64 p2
array p1 : HSP���̔z��ϐ�			[out]
int64 p2 : �R�s�[��CL_mem_object id		[in]

%inst
p1�Ŏw�肵���ϐ���float�^�z��ϐ��Ƃ��ď��������A���e��p2����R�s�[���܂��B
�T�C�Y�͎����Ō��肳��܂��B
�Ȃ�HSP�̎d�l��A�m�ۂł���T�C�Y�̏����1GB�܂łł��B


%href
HCLdim_i64FromBuffer
HCLdim_i32FromBuffer
HCLdim_dpFromBuffer

;----------------
%index
HCLGetAllBufferSize
VRAM���T�C�Y�擾

%prm
()

%inst
HCLCreateBuffer���ō쐬����buffer�̑��T�C�Y���擾���܂��B
���̖��߂�GPU��CPU�ł̃������g�p�ʂ��擾���閽�߂ł͂Ȃ��A�����܂�HSPCL64�̃v���O�C�����g�����v���Z�X���̃f�o�C�Xbuffer�m�ۃT�C�Y�ł��邱�Ƃɒ��ӂ��Ă��������B


%href
HCLCreateBuffer
HCLCreateBufferFrom
HCLGetSize
;----------------
%index
HCLGetSize
�������T�C�Y�擾

%prm
(int64 p1)
int64 p1 : CL_mem_object id		[in]

%inst
HCLCreateBuffer���ō쐬����buffer�̃T�C�Y��byte�ŕԂ��܂��B


%href
HCLCreateBuffer
HCLCreateBufferFrom
HCLGetAllBufferSize

;----------------
%index
HCLGarbageCollectionNow
VRAM�ꊇ���

%prm
int64 p1,int64 p2,int64 p3�E�E�E�E
int64 p1 : ���OCL_mem_object id,�ȗ���	[in]
int64 p2 : ���OCL_mem_object id,�ȗ���	[in]
int64 p3 : ���OCL_mem_object id,�ȗ���	[in]
int64 p4 : �E�E�E�E

%inst
HCLCreateBuffer���ō쐬����buffer��������܂��B

HCLCreateBuffer��HCLCreateBufferFrom�Ȃ�cl mem object�𐶐������
�����I��HCLReleaseBuffer�ŉ�����Ȃ�����v���Z�X���I������܂Ŏc�葱���܂��B
�����R�[�h����cl mem id�����X�g���Ă��܂��Ɖ�����邱�Ƃ��ł��Ȃ��Ȃ��Ă��܂��܂��B

�����Ńv���O�C�����őS�č쐬����cl mem id���o���Ă����A�[���I��GC���s�Ȃ����ƂŁA����Ȃ��Ȃ���cl mem������ł���悤�ɂ����̂�HCLGarbageCollectionNow���߂ł��B
�������������̎Q�ƃJ�E���^�������ł��Ȃ��̂Ŏ蓮�ŃJ�E���^���񂵂Ē����K�v������܂��B

HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId

���߂ŎQ�ƃJ�E���^�𑝌��ł��܂��B
�f�t�H���g�ŎQ�ƃJ�E���^��0�ł��B
�Q�ƃJ�E���^��1�ȏ�̂��̂͂��̖��߂Ŕj������܂���B

�܂��Q�ƃJ�E���^��0�ȉ��̂��̂ł�
p1,p2�E�E�E��mem id���w�肷�邱�ƂŁA���̖��ߎ��s���Ƀ�������������Ȃ��悤�ɂ��邱�Ƃ��ł��܂��B

%href
HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId

;----------------
%index
HCLIncRefcntCLBufferId
VRAM�Q�ƃJ�E���^�C���N�������g

%prm
int64 p1
int64 p1 : CL_mem_object id	[in]

%inst
������id�̎Q�ƃJ�E���^��1���₵�܂��B
����͊�{�I��
HCLGarbageCollectionNow
���߂ƃZ�b�g�Ŏg���܂��B
�֋X��Q�ƃJ�E���^�Ɠǂ�ł��܂����A����HSP������ǂꂾ���Q�Ƃ���Ă��悤���A���̃J�E���^�͂����̃J�E���^�Ƃ��Ă����@�\���Ă��炸�A
���ۂ̎Q�Ə󋵂𑪂�Ă�����̂ł͂���܂���B

%href
HCLGarbageCollectionNow
HCLDecRefcntCLBufferId

;----------------
%index
HCLDecRefcntCLBufferId
VRAM�Q�ƃJ�E���^�f�N�������g

%prm
int64 p1
int64 p1 : CL_mem_object id	[in]

%inst
������id�̎Q�ƃJ�E���^��1���炵�܂��B
����͊�{�I��
HCLGarbageCollectionNow
���߂ƃZ�b�g�Ŏg���܂��B
�֋X��Q�ƃJ�E���^�Ɠǂ�ł��܂����A����HSP������ǂꂾ���Q�Ƃ���Ă��悤���A���̃J�E���^�͂����̃J�E���^�Ƃ��Ă����@�\���Ă��炸�A
���ۂ̎Q�Ə󋵂𑪂�Ă�����̂ł͂���܂���B

%href
HCLGarbageCollectionNow
HCLIncRefcntCLBufferId
