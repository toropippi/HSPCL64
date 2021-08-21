#pragma once

// XMM�n���W�X�^��ۑ��p
typedef union _XMM				// max = 128bit
{
	BYTE val[16];				// 128bit
	double val_d;				//  64bit
	float val_f;				//  32bit
} XMM;

// �R�[���o�b�N���\����
// 8byte�P�ʂɂ��Ă܂�
typedef struct _CallbackData
{
	int args_count;				// �����̐� [IN]
	int padding0;				// padding0

	INT64 rcx;					// ��1���� [OUT]
	INT64 rdx;					// ��2���� [OUT]
	INT64 r8;					// ��3���� [OUT]
	INT64 r9;					// ��4���� [OUT]

	XMM xmm0;					// ��1���� [OUT]
	XMM xmm1;					// ��2���� [OUT]
	XMM xmm2;					// ��3���� [OUT]
	XMM xmm3;					// ��4���� [OUT]

	INT64* args;				// ��5�����ȏ� [IN/OUT]
								// �����̐���5�ȏ�̏ꍇ�̓������m�ەK�{�B

	void* internal_call;		// �����R�[���֐�  [IN]
	void* proc_call;			// �������ꂽ�R�[���o�b�N�R�[�h [IN]
	size_t proc_call_size;		// �������ꂽ�R�[���o�b�N�R�[�h�̃T�C�Y

	INT64 ret;					// �߂�l [IN]
	INT64 padding1;				// padding1 - �߂�l XMM���W�X�^��128bit�B�ɏ՗p�B

	unsigned short* label;		// label(HSP��)

	DWORD flOldProtect;			// VirtualProtect�̌��̕ی�̒l�i�v��Ȃ������j
	DWORD padding2;				// padding2

} CallbackData, *PCallbackData, **PPCallbackData;

// CallbackData�̃������͊֐����ō쐬�����
PCallbackData callback64_new(int args_count);
void callback64_free(PCallbackData ptr);

// CallbackData�̃������͊֐��O�ō���Ă��炤��
bool callback64_new2(PCallbackData cData,int args_count);
void callback64_free2(PCallbackData ptr);
