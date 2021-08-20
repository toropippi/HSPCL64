void HCLDoXc(void);
void HCLDoXi(void);
void HCLDoXl(void);
void HCLDoXf(void);
void HCLDoXd(void);




int isupper_lower(unsigned char c)
{
	if ((c >= 65) & (c <= 90)) return 1;
	if ((c >= 97) & (c <= 122)) return 2;
	if (c == 95) return 3;
	if ((c >= 48) & (c <= 57)) return 4;
	return 0;
}

std::string CodeRefine(std::string sor, int typeflg,int* argt)
{
	std::string stype[5];
	stype[0] = "uchar";
	stype[1] = "uint";
	stype[2] = "ulong";
	stype[3] = "float";
	stype[4] = "double";
	std::string Aa = "A";

	sor = " " + sor + " ";
	int len = sor.size();

	int globalnum[26];
	int privatenum[26];

	for (int i = 0; i < len; i++)
	{
		unsigned char c = sor[i];
		if (c >= 128) {
			i++;
			continue;
		}

		int ci = isupper_lower(c);
		if (ci == 1)
		{
			if ((isupper_lower(sor[i - 1]) == 0) & (isupper_lower(sor[i + 1]) == 0))
			{
				globalnum[c - 65]++;
			}
		}
		if (ci == 2)
		{
			if ((isupper_lower(sor[i - 1]) == 0) & (isupper_lower(sor[i + 1]) == 0))
			{
				privatenum[c - 97]++;
			}
		}
	}


	std::string header = "__kernel void GenCode(";

	int oomjc = 0;
	//�啶������
	for (int i = 0; i < 26; i++)
	{
		if (globalnum[i] != 0)
		{
			oomjc++;
			Aa[0] = 65 + i;
			header += "__global " + stype[typeflg] + "* " + Aa + " ,";
		}
	}

	if (oomjc == 0)
	{
		MessageBox(NULL, "�uA�v�Ȃǂ̑啶���ϐ����������܂���", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}

	//����������
	int kmjc = 0;
	privatenum[8] = 0;//i
	for (int i = 0; i < 26; i++)
	{
		if (privatenum[i] != 0)
		{
			Aa[0] = 97 + i;
			typeflg = argt[kmjc + oomjc];
			header += "" + stype[typeflg] + " " + Aa + " ,";
			kmjc++;
		}
	}

	//�c����
	header += "uint raw ,uint col";
	
	//���ߍ��ݏ���
	header += ")\n{\nint i = get_global_id(0);\n";
	return header + sor + "\n}";
}


static void HCLDoX(int typeflg)
{
	int sizelist[5];
	sizelist[0] = 1;
	sizelist[1] = 4;
	sizelist[2] = 8;
	sizelist[3] = 4;
	sizelist[4] = 8;
	//�܂��͈����S���擾
	cl_int ret;
	char* c_source;
	c_source = code_gets();								// ��������擾
	std::string s_sourse = std::string(c_source);

	void* ppttr;
	int sizeofff;
	int chk;
	int type;

	int argt[32];
	int argi32[32];
	INT64 argi64[32];
	double argdp[32];
	for (int i = 0; i < 32; i++) {
		argt[i] = -1; argi32[i] = -1; argi64[i] = -1; argdp[i] = -1.0;
	}

	for (int i = 0; i < 32; i++) {
		chk = code_getprm();							// �p�����[�^�[���擾(�^�͖��Ȃ�)
		if (chk <= PARAM_END) break;				// �p�����[�^�[�ȗ����̏���
		type = mpval->flag;							// �p�����[�^�[�̌^���擾
		switch (type) {
		case HSPVAR_FLAG_DOUBLE:									// �p�����[�^�[��������������
		{
			ppttr = (double*)mpval->pt;
			sizeofff = 8;
			argt[i] = 4;
			argdp[i] = *((double*)ppttr);
			break;
		}
		case 8:								// �p�����[�^�[��int64��������
		{
			ppttr = (INT64*)mpval->pt;
			sizeofff = 8;
			argt[i] = 2;
			argi64[i] = *((INT64*)ppttr);
			break;
		}
		case HSPVAR_FLAG_INT:									// �p�����[�^�[��������������
		{
			ppttr = (int*)mpval->pt;
			sizeofff = 4;
			argt[i] = 1;
			argi32[i] = *((int*)ppttr);
			break;
		}
		default:
			puterror(HSPERR_TYPE_MISMATCH);			// �T�|�[�g���Ă��Ȃ��^�Ȃ�΃G���[
		}
	}
	//�����擾�����܂�

	//��U�G���[����
	if (argi64[0] == -1) 
	{
		MessageBox(NULL, "���������L����cl_mem id�ł͂���܂���", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}

	//�R�[�h��������
	s_sourse = CodeRefine(s_sourse, typeflg, argt);//, argi32, argi64, argdp
	size_t h = KrnToHash(s_sourse);
	auto itr = codemap.find(h);// h ���ݒ肳��Ă��邩�H
	if (itr != codemap.end()) {
		//�ݒ肳��Ă���ꍇ�̏���
		kernel = codemap[h];
	}
	else
	{
		//�ݒ肳��Ă��Ȃ��ꍇ�̏���
		program = WithSource_func(context[clsetdev], s_sourse, "");
		ret = clCreateKernelsInProgram(program, 1, &kernel, NULL);//�v���O�����̒��̍ŏ��ɂłĂ���J�[�l�����擾
		if (ret != CL_SUCCESS)retmeserr8(ret);
		codemap[h] = kernel;
	}

	//�����kernel�܂ŋ��܂����B���Ƃ͈����w��
	// 
	//global�����v�Z�BA�ɑΉ�
	INT64 global_size = GetMemSize((cl_mem)argi64[0]) / sizelist[typeflg];

	//����
	for (int i = 0; i < 32; i++) 
	{
		if (argt[i] == -1)break;
		if (argt[i] == 1)ppttr = (int*)&argi32[i];
		if (argt[i] == 2)ppttr = (INT64*)&argi64[i];
		if (argt[i] == 4)ppttr = (double*)&argdp[i];
		clSetKernelArg(kernel, i, sizelist[argt[i]], ppttr);
	}
	
	//���Ƃ͎��s���邾��

	//outevent�֘A
	//cl_event* outevent = EventOutChk(prm2);
	//wait event list�֘A
	cl_event* ev_ = GetWaitEvlist();

	size_t local_size = 64;
	size_t p4_1 = (global_size / local_size) * local_size;//local_size�Ŋ���؂�鐔����
	size_t p4_2 = global_size - p4_1;//���̒[��

	if (p4_1 != 0) {
		ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			kernel, 1, NULL, &p4_1, &local_size, num_event_wait_list, ev_, NULL);//1��ڂ͖����I���
		if (ret != CL_SUCCESS) { retmeserr(ret); }
	}
	if (p4_2 != 0) {
		local_size = p4_2;
		ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			kernel, 1, &p4_1, &p4_2, &local_size, num_event_wait_list, ev_, NULL);
		if (ret != CL_SUCCESS) { retmeserr(ret); }
	}
	num_event_wait_list = 0;
}

static void HCLDoXc(void)
{
	HCLDoX(0);
}


static void HCLDoXi(void)
{
	HCLDoX(1);
}

static void HCLDoXl(void)
{
	HCLDoX(2);
}

static void HCLDoXf(void)
{
	HCLDoX(3);
}

static void HCLDoXd(void)
{
	HCLDoX(4);
}
