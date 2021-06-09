void _ConvRGBtoBGR(void);
void _ConvRGBAtoRGB(void);
void _ConvRGBtoRGBA(void);
void mes(const char* strc, int val);


static void _ConvRGBtoBGR(void)
{
	PVal* pval1;
	APTR aptr1;	//�z��ϐ��̎擾
	aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc* phvp1;
	void* ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B


	PVal* pval2;
	APTR aptr2;	//�z��ϐ��̎擾
	aptr2 = code_getva(&pval2);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc* phvp2;
	void* ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr2 = phvp2->GetPtr(pval2);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	p3 = code_getdi(0);

	char* dmptr1 = (char*)ptr1;
	char* dmptr2 = (char*)ptr2;

	for (int i = 0; i < p3; i += 3) {
		dmptr2[i + 2] = dmptr1[i];
		dmptr2[i + 1] = dmptr1[i + 1];
		dmptr2[i] = dmptr1[i + 2];
	}
}
static void _ConvRGBAtoRGB(void)
{
	PVal* pval1;
	APTR aptr1;	//�z��ϐ��̎擾
	aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc* phvp1;
	void* ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	PVal* pval2;
	APTR aptr2;	//�z��ϐ��̎擾
	aptr2 = code_getva(&pval2);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc* phvp2;
	void* ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr2 = phvp2->GetPtr(pval2);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	p3 = code_getdi(0) / 4;

	char* dmptr1 = (char*)ptr1;
	char* dmptr2 = (char*)ptr2;
	int idx1 = 0;
	int idx2 = 0;

	for (int i = 0; i < p3; i++) {
		idx1 = i * 3;
		idx2 = i * 4;
		dmptr2[idx1] = dmptr1[idx2];
		dmptr2[idx1 + 1] = dmptr1[idx2 + 1];
		dmptr2[idx1 + 2] = dmptr1[idx2 + 2];
	}
}
static void _ConvRGBtoRGBA(void)
{
	PVal* pval1;
	APTR aptr1;	//�z��ϐ��̎擾
	aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc* phvp1;
	void* ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	PVal* pval2;
	APTR aptr2;	//�z��ϐ��̎擾
	aptr2 = code_getva(&pval2);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc* phvp2;
	void* ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr2 = phvp2->GetPtr(pval2);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	p3 = code_getdi(0) / 3;


	int toumeiflg = code_getdi(0);
	char toumei_r = code_getdi(0);
	char toumei_g = code_getdi(0);
	char toumei_b = code_getdi(0);


	char* dmptr1 = (char*)ptr1;
	char* dmptr2 = (char*)ptr2;
	int idx1 = 0;
	int idx2 = 0;
	char tmpr = 0;
	char tmpg = 0;
	char tmpb = 0;

	if (toumeiflg == 0) {
		for (int i = 0; i < p3; i++) {
			idx1 = i * 4;
			idx2 = i * 3;
			tmpr = dmptr1[idx2];
			tmpg = dmptr1[idx2 + 1];
			tmpb = dmptr1[idx2 + 2];
			dmptr2[idx1] = tmpr;
			dmptr2[idx1 + 1] = tmpg;
			dmptr2[idx1 + 2] = tmpb;
			dmptr2[idx1 + 3] = (char)-1;
		}
	}
	else {
		for (int i = 0; i < p3; i++) {
			idx1 = i * 4;
			idx2 = i * 3;
			tmpr = dmptr1[idx2];
			tmpg = dmptr1[idx2 + 1];
			tmpb = dmptr1[idx2 + 2];
			dmptr2[idx1] = tmpr;
			dmptr2[idx1 + 1] = tmpg;
			dmptr2[idx1 + 2] = tmpb;
			dmptr2[idx1 + 3] = (char)-1;
			if (toumei_r == tmpr) { if (toumei_g == tmpg) { if (toumei_b == tmpb) { dmptr2[idx1 + 3] = 0; } } }
		}
	}
}







void mes(const char* strc, int val)
{
	char c[10];
	c[0] = val % 1000000000 / 100000000 + 48;
	c[1] = val % 100000000 / 10000000 + 48;
	c[2] = val % 10000000 / 1000000 + 48;
	c[3] = val % 1000000 / 100000 + 48;
	c[4] = val % 100000 / 10000 + 48;
	c[5] = val % 10000 / 1000 + 48;
	c[6] = val % 1000 / 100 + 48;
	c[7] = val % 100 / 10 + 48;
	c[8] = val % 10 + 48;
	c[9] = 0;
	MessageBox(NULL, c, strc, 0);
}
