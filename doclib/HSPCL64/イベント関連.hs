;------------------------
;   �C�x���g�֘A
;------------------------

;-------- header --------
%dll
HSPCL64.dll

%ver
1.1

%date
2023/02/06

%author
toropippi

%note
hspcl64.as ���C���N���[�h���Ă��������B

%type
64bit�����^�C��GPGPU�p�v���O�C��

%group
OpenCL�C�x���g�֘A

%port
Win

;-------- ref --------
;--------
%index
event�ڍ�

%inst
HSPCL32N,64�ň�����event�̊T�O�ɂ��ďڂ����������܂��B

��event
event�́A1�̃f�[�^�]�����߂܂��̓J�[�l�����s���߂ɕR�Â��Ă��܂��B
event���g�����ƂŎ�Ɉȉ���4��ނ̂��Ƃ��s�Ȃ��܂��B
1.�f�[�^�]����J�[�l�����s�J�n���ԁA�I�����ԂȂǂ̏����擾���邱�Ƃ��ł��܂��BHCLGetEventLogs���߂�����ɂ�����܂��B
2.�f�[�^�]����J�[�l�������ݎ��s�����Ƃ����������擾���邱�Ƃ��ł��܂��BHCLGetEventStatus���߂�����ɂ�����܂��B
3.�f�[�^�]����J�[�l���̏I���҂����s�Ȃ��܂��BHCLWaitForEvent��HCLWaitForEvents���߂�����ɂ�����܂��B
4.�f�[�^�]����J�[�l�����I������܂ŁA���̃J�[�l���̎��s��҂����邱�Ƃ��ł��܂��BHCLSetWaitEvent��HCLSetWaitEvents���߂�����ɂ�����܂��B

�Ⴆ��HCLDoKrn1���߂�1�̃J�[�l�������s���A���̎��Ԃ��v���������Ƃ��܂��B���̂Ƃ���HCLDoKrn1���߂̈����ɔC�ӂ�event ID�����[�U�[���w�肵�A����ID��HCLGetEventLogs���߂Ŏw�肷�邱�ƂŎ��Ԃ��擾�ł��܂��B
����event ID�̓f�t�H���g��0�`65535��int�^�������g���܂��B����ȏ�L�^�������ꍇ��_ExHCLSetEventMax���߂ŋL�^�\event���𑝂₷���Ƃ��ł��܂��B���̂���菭�������z�X�g���̃���������ʂ������܂��B

�f�[�^�]�����߂�J�[�l�����s���߂�event ID��R�Â������ꍇ�A���߂̍Ō�̈�����event ID����͂ł���Ƃ��낪���邽�߁A�����Ɏw�肵�Ă��������B
�ȉ��̖��߂́A�C�ӂ�event ID�ƕR�Â��邱�Ƃ��ł��܂��B

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub


�������A�󋵂ɂ���Ă͂����������߂̈�����event id���w�肷��̂��ʓ|�ł���ƍl���ȉ���2�̖��߂�ǉ����܂����B
HCLEventAutoProfilingStart
HCLEventAutoProfilingEnd
����start�`end�̊ԂɎ��s���ꂽ�f�[�^�]�����߂�J�[�l�����s����(�ȉ��Q��)�́Aevent id�����͂ł��閽�߂ł����Ă�������0�ȏ�̐��l���w�肵�Ȃ�����A�����I��event id 0�Ԃ�����s���ɕR�Â�����Ă����܂��BHCLEventAutoProfilingEnd�܂łɋL�^�����C�x���g����HCLEventAutoProfilingEnd���߂Ŏ擾�ł���悤�ɂȂ��Ă��܂��B
����start�`end�̊Ԃɂ͂��ނ��Ƃ�event�ƕR�Â��邱�Ƃ��ł��閽�߂͈ȉ��ɂȂ�܂��B

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul

�Ȃ��Aevent id�����͂ł��閽�߂ł���A������0�ȏ�̐��l���w�肵���ꍇ�A�w�肳�ꂽ���l���D��I�Ɣ��f����܂��B


��user event
�������user event�Ƃ����T�O������܂��B(��������OpenCL API��user event����������Ă���A���̖��߂����̂܂܎����Ă��Ă���`�ł��B)
user event�̓f�[�^�]�����߂�J�[�l�����s���߂Ɗ֌W�Ȃ��A���[�U�[���쐬�ł���event�ɂȂ�܂��B
user event�łȂ�event�Ƃ̈Ⴂ��1�`3�̕����ł���
1.event id���g���āA�I�����ԂȂǂ̏����擾���ł��܂���B
2.event id���g���Č��ݎ��s�����Ƃ����������擾���邱�Ƃł��܂���B
3.event id���g���ďI���҂����s�Ȃ��܂���B
4.event id���g���āA���̃J�[�l���̎��s��҂����邱�Ƃ��ł��܂��B
�ƂȂ��Ă���܂��B���[�U�[���쐬����user event�́A�f�[�^�]����J�[�l���ƕR�Â��Ă���킯�ł͂Ȃ����߁A�����������s�󋵂���s�I���҂����s����킯�ł͂���܂���B4�̎g�����ɂ̂ݎg���܂��B
����user event��event�͊T�O�Ƃ��ĈႤ���̂ł����Aevent id�͋��ʂȂ̂Œ��ӂ��Ă��������B
�ڍׂ�HCLCreateUserEvent�ƃT���v�����Q�Ƃ��������B



%href
HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul
HCLSetWaitEvent
HCLSetWaitEvents
HCLGetEventLogs
HCLSetUserEventStatus
HCLWaitForEvent
HCLWaitForEvents
HCLCreateUserEvent
_ExHCLSetEventMax

;--------
%index
HCLSetWaitEvent
event�҂��Ɏg��event��1�Z�b�g

%prm
int p1
int p1 : event id [in]

%inst
p1�Ɏ��s�������s�������J�[�l���ɕR�Â���event id�����ĉ������B
���L���߂����Ɏ��s����ۂɁA����event�����ׂďI������܂Ŏ��s�҂����s���܂��B

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul


�g����
HCLSetCommandQueue 0
HCLWriteBuffer memA,data,,,,0,0 //eventid=0
HCLSetCommandQueue 1
HCLSetWaitEvent 0
HCLDoKrn1 krnid,65536,256

����ŁAHCLWriteBuffer�̓]�����I���������Ƃ�krnid�̃J�[�l���̎��s���n�܂邱�Ƃ��ۏ؂���܂��B(HCLSetWaitEvent 0�����ĂȂ��Ɠ]���ƃJ�[�l�����s�������ɋN����\��������)

%href
HCLSetWaitEvents
event�ڍ�
;--------

%index
HCLSetWaitEvents
event�҂��Ɏg��event�𕡐��Z�b�g

%prm
array p1
array p1 : event id���i�[���ꂽint�^�z�� [in]

%inst
p1��event id���i�[���ꂽint�^�z������ĉ������B
���L���߂����Ɏ��s����ۂɁA����event�����ׂďI������܂Ŏ��s�҂����s���܂��B

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul


%href
HCLSetWaitEvent
event�ڍ�
;--------

%index
HCLGetEventLogs
event���擾

%prm
(int p1.int p2)
int p1 �F event id	[in]
int p2 �F parameter	[in]

%inst
p1��event id���w�肵��p2��0�`7�̃p�����[�^�[���w�肷�邱�Ƃŉ��L�����擾�ł��܂��B
�Ԃ�l�͕K��64bit int�ł��B

0:event�ƕR�t���Ă���OpenCL�R�}���h�̎��
CL_COMMAND_NDRANGE_KERNEL                   0x11F0
CL_COMMAND_TASK                             0x11F1
CL_COMMAND_NATIVE_KERNEL                    0x11F2CL_COMMAND_READ_BUFFER                      0x11F3
CL_COMMAND_WRITE_BUFFER                     0x11F4
CL_COMMAND_COPY_BUFFER                      0x11F5
CL_COMMAND_READ_IMAGE                       0x11F6
CL_COMMAND_WRITE_IMAGE                      0x11F7
CL_COMMAND_COPY_IMAGE                       0x11F8
CL_COMMAND_COPY_IMAGE_TO_BUFFER             0x11F9
CL_COMMAND_COPY_BUFFER_TO_IMAGE             0x11FA
CL_COMMAND_MAP_BUFFER                       0x11FB
CL_COMMAND_MAP_IMAGE                        0x11FC
CL_COMMAND_UNMAP_MEM_OBJECT                 0x11FD
CL_COMMAND_MARKER                           0x11FE
CL_COMMAND_ACQUIRE_GL_OBJECTS               0x11FF
CL_COMMAND_RELEASE_GL_OBJECTS               0x1200
CL_COMMAND_READ_BUFFER_RECT                 0x1201
CL_COMMAND_WRITE_BUFFER_RECT                0x1202
CL_COMMAND_COPY_BUFFER_RECT                 0x1203
CL_COMMAND_USER                             0x1204
CL_COMMAND_BARRIER                          0x1205
CL_COMMAND_MIGRATE_MEM_OBJECTS              0x1206
CL_COMMAND_FILL_BUFFER                      0x1207
CL_COMMAND_FILL_IMAGE                       0x1208
����event��CL_COMMAND_NDRANGE_KERNEL���������ACL_COMMAND_WRITE_BUFFER���������ACL_COMMAND_Read_BUFFER���������̔���ɂ����܂��B

1:kernel_id���R�s�[�T�C�Y
����event��CL_COMMAND_NDRANGE_KERNEL�Ȃ�kernel_id���A
CL_COMMAND_WRITE_BUFFER��CL_COMMAND_Read_BUFFER��CL_COMMAND_FILL_BUFFER��CL_COMMAND_COPY_BUFFER�Ȃ�R�s�[�T�C�Y��byte�ŕԂ�܂��B

2:����event�����s����device �ԍ�

3:����event�����s����CommandQueue �ԍ�

4:CL_PROFILING_COMMAND_QUEUED�̎���
�P�ʂ̓i�m�Z�J���h(ns)

5:CL_PROFILING_COMMAND_SUBMIT�̎���
�P�ʂ̓i�m�Z�J���h(ns)

6:CL_PROFILING_COMMAND_START�̎���
�P�ʂ̓i�m�Z�J���h(ns)

7:CL_PROFILING_COMMAND_END�̎���
�P�ʂ̓i�m�Z�J���h(ns)

%href
HCLGetEventStatus
event�ڍ�
;--------

%index
HCLGetEventStatus
�C�x���g���s��Ԏ擾

%prm
(int p1)
int p1 �F event id [in]

%inst

event �Ɗ֘A�t����ꂽ�R�}���h�̎��s��Ԃ�int�^�ŕԂ��܂��B
�ȉ��̒l�̂����ЂƂ��Ԃ���܂��B
CL_QUEUED - �R�}���h���R�}���h�L���[�ɑ}�����ꂽ�B
CL_SUBMITTED - �R�}���h�L���[�Ɋ֘A�t����ꂽ�f�o�C�X�ɑ΂��A�}�����ꂽ�R�}���h���z�X�g���瑗��ꂽ�B
CL_RUNNING - ���݃f�o�C�X���R�}���h�����s���B
CL_COMPLETE - �R�}���h�����������B
���̂ق��ɁA���̐����l�̃G���[�R�[�h���Ԃ���邱�Ƃ�����܂��i���̂��郁�����A�N�Z�X�ȂǂŃR�}���h���ُ�I�������Ƃ��Ȃǁj�B

�ڍׂ�
http://wiki.tommy6.net/wiki/clGetEventInfo
������
CL_EVENT_COMMAND_EXECUTION_STATUS
���Q�Ƃ��ĉ������B

%href
event�ڍ�
;--------

%index
HCLWaitForEvent
event�����҂�

%prm
int p1
int p1 �F event id [in]

%inst
event�̎��s������҂��܂��B

%href
HCLWaitForEvents
event�ڍ�
;--------
%index
HCLWaitForEvents
event�����҂�

%prm
array p1
array p1 �F event id��int�^�z�� [in]

%inst
event�̎��s������҂��܂��B

%href
HCLWaitForEvent
event�ڍ�
;--------

%index
HCLCreateUserEvent
UserEvent�쐬

%prm
int p1
int p1 �F event id [in]

%inst
p1�Ŏw�肵��event�ԍ������[�U�[�C�x���g�Ƃ��ēo�^���܂��B
HCLSetUserEventStatus��HCLSetWaitEvent���Ƒg�ݍ��킹�Ďg���܂��B
HCLSetUserEventStatus�ŔC�ӂ̃^�C�~���O�Ń��[�U�[�C�x���g��CL_COMPLETE���Z�b�g���邱�Ƃ�
HCLSetWaitEvent�ɂ��A����OpenCL�R�}���h�̎��s�J�n�𐧌䂷�邱�Ƃ��ł��܂��B

������Ԃł�CL_SUBMITTED���Z�b�g����Ă��܂��B
���ӂƂ��Ă�HCLGetEventLogs���߂�UserEvent�������Ȃ����Ƃł��B

%href
HCLSetUserEventStatus
HCLSetWaitEvent
HCLSetWaitEvents
event�ڍ�
;--------

%index
HCLSetUserEventStatus
UserEvent�ɏ�Ԃ��Z�b�g

%prm
int p1,int p2
int p1 �F user event id		[in]
int p2 �F parameter		[in]

%inst
p1�Ŏw�肵��UserEvent��p2���Z�b�g���܂��B
p2�͊�{�I��CL_COMPLETE(*)���w�肵�܂��B

(*)
CL_COMPLETE    0x0

����ȊO�̒l���Z�b�g����ꍇ�͉��L�Q�Ɖ������B
https://www.khronos.org/registry/OpenCL/sdk/2.2/docs/man/html/clSetUserEventStatus.html


%href
HCLCreateUserEvent
HCLSetWaitEvent
HCLSetWaitEvents
event�ڍ�
;--------

%index
HCLEventAutoProfilingStart
Event�̎����L�^�J�n

%prm

%inst
HCLEventAutoProfilingEnd�Ƒ΂Ŏg���܂��B
����start�`end�̊ԂɎ��s���ꂽ�f�[�^�]�����߂�J�[�l�����s����(�ȉ��Q��)�́Aevent id�����͂ł��閽�߂ł����Ă�������0�ȏ�̐��l���w�肵�Ȃ�����A�����I��event id 0�Ԃ�����s���ɕR�Â�����Ă����܂��BHCLEventAutoProfilingEnd�܂łɋL�^�����C�x���g����HCLEventAutoProfilingEnd���߂Ŏ擾�ł���悤�ɂȂ��Ă��܂��B
����start�`end�̊Ԃɂ͂��ނ��Ƃ�event�ƕR�Â��邱�Ƃ��ł��閽�߂͈ȉ��ɂȂ�܂��B

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul

�Ȃ��Aevent id�����͂ł��閽�߂ł���A������0�ȏ�̐��l���w�肵���ꍇ�A�w�肳�ꂽ���l���D��I�Ɣ��f����܂��B

%href
HCLEventAutoProfilingEnd
event�ڍ�
;--------
%index
HCLEventAutoProfilingEnd
Event�̎����L�^�I��

%prm
()

%inst
HCLEventAutoProfilingStart�Ƒ΂Ŏg���܂��B
����start�`end�̊ԂɎ��s���ꂽ�f�[�^�]�����߂�J�[�l�����s����(�ȉ��Q��)�́Aevent id�����͂ł��閽�߂ł����Ă�������0�ȏ�̐��l���w�肵�Ȃ�����A�����I��event id 0�Ԃ�����s���ɕR�Â�����Ă����܂��BHCLEventAutoProfilingEnd�܂łɋL�^�����C�x���g����HCLEventAutoProfilingEnd���߂Ŏ擾�ł���悤�ɂȂ��Ă��܂��B
����start�`end�̊Ԃɂ͂��ނ��Ƃ�event�ƕR�Â��邱�Ƃ��ł��閽�߂͈ȉ��ɂȂ�܂��B

HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLCopyBuffer
HCLFillBuffer
HCLDoKrn1
HCLDoKrn2
HCLDoKrn3
HCLDoKernel
HCLDoKrn1_sub
HCLCall2
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
HCLDoXc
HCLDoXi
HCLDoXl
HCLDoXf
HCLDoXd
HCLDoXuc
HCLDoXui
HCLDoXul

�Ȃ��Aevent id�����͂ł��閽�߂ł���A������0�ȏ�̐��l���w�肵���ꍇ�A�w�肳�ꂽ���l���D��I�Ɣ��f����܂��B

%href
HCLEventAutoProfilingStart
event�ڍ�