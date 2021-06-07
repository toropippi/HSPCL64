;------------------------
;  �f�o�C�X���֘A
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
OpenCL�f�o�C�X���Ǘ�

%port
Win

;-------- ref --------

%index
HCLinit
HSPCL64��������

%prm

%inst
HSPCL64�����������܂��B
hspcl64.as���C���N���[�h�������ƂɎ��s���ĉ������B

%href
HCLGetDeviceCount
_ExHCLSetCommandQueueMax
_ExHCLSetCommandQueueProperties
_ExHCLSetEventMax
;--------

%index
HCLGetDeviceCount
OpenCL�f�o�C�X���擾

%prm
()

%inst
OpenCL�f�o�C�X�Ƃ��ĔF�������f�o�C�X�����Ԃ�܂��B
HCLSetDevice�Ŏw��ł���ԍ���0�`HCLGetDeviceCount()-1�͈̔͂ƂȂ�܂��B

%href
HCLinit
HCLSetDevice

;--------


%index
HCLSetDevice
�f�o�C�X�Z�b�g

%prm
int p1
int p1	�f�o�C�Xid [in]

%inst

�J�[�l�����߂�J�[�l���o�^�A�������m�ۂ����s����f�o�C�X���w�肵�܂��B
�ȉ��̖��߂͐ݒ肵���f�o�C�X�݂̂Ɏ��s����܂��B

HCLGetSettingDevice
HCLCreateProgram
HCLCreateProgramWithSource
HCLCreateKernel
HCLCreateBuffer
HCLCreateBufferFrom
HCLWriteBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer_i32
HCLFillBuffer_i64
HCLFillBuffer_dp
HCLdim_i32FromBuffer
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLCall
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLFinish
HCLFlush
HCLSetCommandQueue


HCLSetDevice�����s���Ă��Ȃ��ꍇ�́A�J�����g�f�o�C�X�̓f�o�C�X0�ł��B

%href
HCLGetSettingDevice
HCLCreateProgram
HCLCreateProgramWithSource
HCLCreateKernel
HCLCreateBuffer
HCLCreateBufferFrom
HCLWriteBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer_i32
HCLFillBuffer_i64
HCLFillBuffer_dp
HCLdim_i32FromBuffer
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLCall
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLFinish
HCLFlush
HCLSetCommandQueue
;--------

%index
HCLGetSettingDevice
�Z�b�g�f�o�C�Xno�擾

%prm
()

%inst
HCLSetDevice�Ŏw�肵���f�o�C�X��id���Ԃ�܂��B

%href
HCLSetDevice
;--------

%index
HCLGetDeviceInfo_s
�f�o�C�X���擾

%prm
(int p1)
int p1 �F param_name [in]

%inst
HCLSetDevice�ŃZ�b�g�����f�o�C�X�̏��𕶎���Ŏ擾���܂��B
p1��param_name���w�肵�ĉ������B�߂�l�͕�����ɂȂ�܂��B

p1�͉��L��URL�̕\�ɂ���l����ЂƂI��Ŏw��ł��܂��B
���{��T�C�g�Fhttp://wiki.tommy6.net/wiki/clGetDeviceInfo
�p��T�C�g�Fhttps://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i
HCLGetDeviceInfo_i64
;--------

%index
HCLGetDeviceInfo_i
�f�o�C�X���擾

%prm
(int p1,int p2)
int p1 �F param_name [in]
int p2 �F index [in]

%inst
HCLSetDevice �ŃZ�b�g�����f�o�C�X�̏��𕶎���Ŏ擾���܂��B
p1��param_name���w�肵�ĉ������B�߂�l��int�^�̐����ɂȂ�܂��B
�߂�l�̐��l���z��̏ꍇ�́Ap2��index���w�肷�邱�ƂŁAp2�Ԗڂ̗v�f�̏��𓾂邱�Ƃ��ł��܂��B

p1�͉��L��URL�̕\�ɂ���l����ЂƂI��Ŏw��ł��܂��B
���{��T�C�g�Fhttp://wiki.tommy6.net/wiki/clGetDeviceInfo
�p��T�C�g�Fhttps://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i64
HCLGetDeviceInfo_s
;--------

%index
HCLGetDeviceInfo_i64
�f�o�C�X���擾

%prm
(int p1,int p2)
int p1 �F param_name [in]
int p2 �F index [in]

%inst
HCLSetDevice �ŃZ�b�g�����f�o�C�X�̏��𕶎���Ŏ擾���܂��B
p1��param_name���w�肵�ĉ������B�߂�l��64bit int�^�̐����ɂȂ�܂��B
�߂�l�̐��l���z��̏ꍇ�́Ap2��index���w�肷�邱�ƂŁAp2�Ԗڂ̗v�f�̏��𓾂邱�Ƃ��ł��܂��B

p1�͉��L��URL�̕\�ɂ���l����ЂƂI��Ŏw��ł��܂��B
���{��T�C�g�Fhttp://wiki.tommy6.net/wiki/clGetDeviceInfo
�p��T�C�g�Fhttps://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/clGetDeviceInfo.html

%href
HCLGetDeviceInfo_i
HCLGetDeviceInfo_s
;--------

%index
_ExHCLSetCommandQueueMax
�R�}���h�L���[�̍ő吔���Z�b�g

%prm
int p1
int p1	�R�}���h�L���[�̍ő吔 [in]


%inst
HCLInit�̎��s�O�Ɏw�肷�邱�ƂŁA1�̃f�o�C�X������̃R�}���h�L���[�̍ő�𑝂₷���Ƃ��ł��܂��B
�f�t�H���g�ł�1�̃f�o�C�X������̃R�}���h�L���[��0�`3�܂ł����܂��B

%href
_ExHCLSetCommandQueueProperties
_ExHCLSetEventMax
;--------

%index
_ExHCLSetCommandQueueProperties
�R�}���h�L���[�v���p�e�B�̃Z�b�g

%prm
int p1
int p1	properties [in]

%inst
HCLInit�̎��s�O�Ɏw�肷�邱�ƂŁAOpenCL�̃R�}���h�L���[�̃v���p�e�B�̐ݒ��ς��邱�Ƃ��ł��܂��B
�R�}���h�L���[�v���p�e�B�̓f�t�H���g�ł�CL_QUEUE_PROFILING_ENABLE���w�肳��Ă��܂��B
http://wiki.tommy6.net/wiki/clCreateCommandQueue
���Q�l�ɂ��ĉ������B

%href
_ExHCLSetCommandQueueMax
_ExHCLSetEventMax
;--------

%index
_ExHCLSetEventMax
�C�x���g�̍ő吔���Z�b�g

%prm
int p1
int p1	�C�x���g�̍ő吔 [in]

%inst
HCLInit�̎��s�O�Ɏw�肷�邱�ƂŁA�L�^�\�C�x���g�̍ő�𑝂₷���Ƃ��ł��܂��B
�f�t�H���g�ŃC�x���gid��0�`65535�Ԃ܂ł����܂��B

%href
_ExHCLSetCommandQueueMax
_ExHCLSetCommandQueueProperties
;--------