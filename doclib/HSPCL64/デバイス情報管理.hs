;------------------------
;  �f�o�C�X���֘A
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
HCLGetPluginVersion
HSPCL64�o�[�W�����擾

%prm
()

%inst
HSPCL64�v���O�C���̃o�[�W������double�^�ŕԂ�܂��B

%href
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
HCLSetDevice�Ŏw��ł���ԍ���0�`HCLGetDeviceCount()-1�͈̔͂ƂȂ�܂��B
�Ⴆ��GPU��2���ȏ㓋�ڂ��Ă���PC�ŁA���ꂼ���GPU�őS���قȂ�v���O���������s����邱�Ƃ��ł��܂��B

�ȉ��̖��߂͐ݒ肵���f�o�C�X�݂̂Ŏ��s����܂��B


HCLGetDeviceInfo_s
HCLGetDeviceInfo_i
HCLGetDeviceInfo_i64
HCLGetSettingDevice
HCLCreateProgram
HCLCreateProgramWithSource
HCLReleaseProgram
HCLGetProgramBinary
HCLCreateProgramWithBinary
HCLCreateKernel
HCLSetKernel
HCLSetKrns
HCLGetKernelName
HCLReleaseKernel
HCLCreateBuffer
HCLCreateBufferFrom
HCLWriteBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer
HCLReadBuffer_NonBlocking
HCLGet_NonBlocking_Status
HCLCopyBuffer
HCLFillBuffer
HCLReleaseBuffer
HCLdim_i32FromBuffer
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
HCLGetSize
HCLGetAllBufferSize
HCLGarbageCollectionNow
HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
HCLReadIndex_fp
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLWriteIndex_fp
HCLCall
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLFinish
HCLFlush
HCLWaitForEvent
HCLWaitForEvents
HCLBLAS_Set2DShape
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

HCLSetDevice�����s���Ă��Ȃ��ꍇ�́A�J�����g�f�o�C�X�̓f�o�C�X0�ł��B

%href
HCLGetDeviceInfo_s
HCLGetDeviceInfo_i
HCLGetDeviceInfo_i64
HCLGetSettingDevice
HCLCreateProgram
HCLCreateProgramWithSource
HCLReleaseProgram
HCLGetProgramBinary
HCLCreateProgramWithBinary
HCLCreateKernel
HCLSetKernel
HCLSetKrns
HCLGetKernelName
HCLReleaseKernel
HCLCreateBuffer
HCLCreateBufferFrom
HCLWriteBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer
HCLReadBuffer_NonBlocking
HCLGet_NonBlocking_Status
HCLCopyBuffer
HCLFillBuffer
HCLReleaseBuffer
HCLdim_i32FromBuffer
HCLdim_i64FromBuffer
HCLdim_dpFromBuffer
HCLdim_fpFromBuffer
HCLGetSize
HCLGetAllBufferSize
HCLGarbageCollectionNow
HCLIncRefcntCLBufferId
HCLDecRefcntCLBufferId
HCLReadIndex_i32
HCLReadIndex_i64
HCLReadIndex_dp
HCLReadIndex_fp
HCLWriteIndex_i32
HCLWriteIndex_i64
HCLWriteIndex_dp
HCLWriteIndex_fp
HCLCall
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLFinish
HCLFlush
HCLWaitForEvent
HCLWaitForEvents
HCLBLAS_Set2DShape
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
HCLinit�̎��s�O�Ɏw�肷�邱�ƂŁA1�̃f�o�C�X������̃R�}���h�L���[�̍ő�𑝂₷���Ƃ��ł��܂��B
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
HCLinit�̎��s�O�Ɏw�肷�邱�ƂŁAOpenCL�̃R�}���h�L���[�̃v���p�e�B�̐ݒ��ς��邱�Ƃ��ł��܂��B
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
HCLinit�̎��s�O�Ɏw�肷�邱�ƂŁA�L�^�\�C�x���g�̍ő�𑝂₷���Ƃ��ł��܂��B
�f�t�H���g�ŃC�x���gid��0�`65535�Ԃ܂ł����܂��B

%href
_ExHCLSetCommandQueueMax
_ExHCLSetCommandQueueProperties
;--------