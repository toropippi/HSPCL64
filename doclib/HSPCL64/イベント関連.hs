;------------------------
;   �C�x���g�֘A
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
OpenCL�C�x���g�֘A

%port
Win

;-------- ref --------

%index
HCLSetWaitEvent
event�҂��Ɏg��event��1�Z�b�g

%prm
int p1
int p1 : event id [in]

%inst
p1�Ɏ��s�������s������event id�����ĉ������B
���L���߂����Ɏ��s����ۂ݂̂ɁA����event�҂����s���܂��B

HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLFillBuffer_i32
HCLFillBuffer_i64
HCLFillBuffer_dp


�g����
HCLSetCommandQueue 0
HCLWriteBuffer memA,data,,,,0,0 //eventid=0
HCLSetCommandQueue 1
HCLSetWaitEvent 0
HCLDoKrn1 krnid,65536,256

����ŁAHCLWriteBuffer�̓]�����I���������Ƃ�krnid�̃J�[�l���̎��s���n�܂邱�Ƃ��ۏ؂���܂��B(HCLSetWaitEvent 0�����ĂȂ��Ɠ]���ƃJ�[�l�����s�������ɋN����\��������)

%href
HCLSetWaitEvents
;--------

%index
HCLSetWaitEvents
event�҂��Ɏg��event�𕡐��Z�b�g

%prm
array p1
array p1 : event id���i�[���ꂽint�^�z�� [in]

%inst
p1��event id���i�[���ꂽint�^�z������ĉ������B
���L���߂����Ɏ��s����ۂ݂̂ɁA����event�҂����s���܂��B

HCLDoKernel
HCLDoKrn1
HCLDoKrn1_sub
HCLDoKrn2
HCLDoKrn3
HCLCopyBuffer
HCLWriteBuffer
HCLReadBuffer
HCLWriteBuffer_NonBlocking
HCLReadBuffer_NonBlocking
HCLFillBuffer_i32
HCLFillBuffer_i64
HCLFillBuffer_dp


%href
HCLSetWaitEvent

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
#define global CL_COMMAND_NDRANGE_KERNEL                   0x11F0
#define global CL_COMMAND_TASK                             0x11F1
#define global CL_COMMAND_NATIVE_KERNEL                    0x11F2
#define global CL_COMMAND_READ_BUFFER                      0x11F3
#define global CL_COMMAND_WRITE_BUFFER                     0x11F4
#define global CL_COMMAND_COPY_BUFFER                      0x11F5
#define global CL_COMMAND_READ_IMAGE                       0x11F6
#define global CL_COMMAND_WRITE_IMAGE                      0x11F7
#define global CL_COMMAND_COPY_IMAGE                       0x11F8
#define global CL_COMMAND_COPY_IMAGE_TO_BUFFER             0x11F9
#define global CL_COMMAND_COPY_BUFFER_TO_IMAGE             0x11FA
#define global CL_COMMAND_MAP_BUFFER                       0x11FB
#define global CL_COMMAND_MAP_IMAGE                        0x11FC
#define global CL_COMMAND_UNMAP_MEM_OBJECT                 0x11FD
#define global CL_COMMAND_MARKER                           0x11FE
#define global CL_COMMAND_ACQUIRE_GL_OBJECTS               0x11FF
#define global CL_COMMAND_RELEASE_GL_OBJECTS               0x1200
#define global CL_COMMAND_READ_BUFFER_RECT                 0x1201
#define global CL_COMMAND_WRITE_BUFFER_RECT                0x1202
#define global CL_COMMAND_COPY_BUFFER_RECT                 0x1203
#define global CL_COMMAND_USER                             0x1204
#define global CL_COMMAND_BARRIER                          0x1205
#define global CL_COMMAND_MIGRATE_MEM_OBJECTS              0x1206
#define global CL_COMMAND_FILL_BUFFER                      0x1207
#define global CL_COMMAND_FILL_IMAGE                       0x1208
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
#define global CL_COMPLETE    0x0

����ȊO�̒l���Z�b�g����ꍇ�͉��L�Q�Ɖ������B
https://www.khronos.org/registry/OpenCL/sdk/2.2/docs/man/html/clSetUserEventStatus.html


%href
HCLCreateUserEvent
HCLSetWaitEvent
HCLSetWaitEvents
;--------