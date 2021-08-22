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

std::string CodeRefine(std::string sor, int typeflg,int* argt,int argcnt)
{
	std::string stype[8];
	stype[0] = "char";
	stype[1] = "int";
	stype[2] = "long";
	stype[3] = "float";
	stype[4] = "double";
	stype[5] = "uchar";
	stype[6] = "uint";
	stype[7] = "ulong";
	std::string Aa = "A";

	sor = " " + sor + "     ";
	int len = sor.size();

	int argcnt2 = 0;
	int globalnum[26];
	int privatenum[26];
	int C[10];
	int UC[10];
	int I[10];
	int UI[10];
	int L[10];
	int UL[10];
	int F[10];
	int D[10];
	int S[10];
	for (int i = 0; i < 26; i++) { globalnum[i] = 0; privatenum[i] = 0;}
	for (int i = 0; i < 10; i++) { C[i] = UC[i] = I[i] = UI[i] = L[i] = UL[i] = F[i] = D[i] = S[i] = 0; }

	for (int i = 1; i < len - 5; i++)
	{
		unsigned char c = sor[i];
		if (c >= 128) {
			i++;
			continue;
		}

		int ci = isupper_lower(c);
		if (ci == 1)
		{
			if (isupper_lower(sor[i - 1]) == 0)
			{
				if (isupper_lower(sor[i + 1]) == 0)
				{
					globalnum[c - 65]++;
				}
				else
				{
					// C??
					if (sor[i] == 'C') 
					{
						if ((isupper_lower(sor[i + 1]) == 4) &(isupper_lower(sor[i + 2]) == 0))
						{
							C[sor[i + 1] - 48]++;
						}
					}

					// I??
					if (sor[i] == 'I')
					{
						if ((isupper_lower(sor[i + 1]) == 4) & (isupper_lower(sor[i + 2]) == 0))
						{
							I[sor[i + 1] - 48]++;
						}
					}

					// L??
					if (sor[i] == 'L')
					{
						if ((isupper_lower(sor[i + 1]) == 4) & (isupper_lower(sor[i + 2]) == 0))
						{
							L[sor[i + 1] - 48]++;
						}
					}

					// F??
					if (sor[i] == 'F')
					{
						if ((isupper_lower(sor[i + 1]) == 4) & (isupper_lower(sor[i + 2]) == 0))
						{
							F[sor[i + 1] - 48]++;
						}
					}

					// D??
					if (sor[i] == 'D')
					{
						if ((isupper_lower(sor[i + 1]) == 4) & (isupper_lower(sor[i + 2]) == 0))
						{
							D[sor[i + 1] - 48]++;
						}
					}

					// S??
					if (sor[i] == 'S')
					{
						if ((isupper_lower(sor[i + 1]) == 4) & (isupper_lower(sor[i + 2]) == 0))
						{
							S[sor[i + 1] - 48]++;
						}
					}


					// U??
					if (sor[i] == 'U')
					{
						// UC??
						if (sor[i + 1] == 'C') 
						{
							if ((isupper_lower(sor[i + 2]) == 4) & (isupper_lower(sor[i + 3]) == 0))
							{
								UC[sor[i + 2] - 48]++;
							}
						}
						// UI??
						if (sor[i + 1] == 'I')
						{
							if ((isupper_lower(sor[i + 2]) == 4) & (isupper_lower(sor[i + 3]) == 0))
							{
								UI[sor[i + 2] - 48]++;
							}
						}
						// UL??
						if (sor[i + 1] == 'L')
						{
							if ((isupper_lower(sor[i + 2]) == 4) & (isupper_lower(sor[i + 3]) == 0))
							{
								UL[sor[i + 2] - 48]++;
							}
						}
					}
				}
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


	std::string header = "#define REP(j, n) for(int j = 0; j < (int)(n); j++)\n";
	header += "#define BARRIER barrier(CLK_LOCAL_MEM_FENCE);\n";
	header += "uint RND(uint s){s*=1847483629;s=(s^61)^(s>>16);s*=9;s=s^(s>>4);s*=0x27d4eb2d;s=s^(s>>15);return s;}\n";
	header += "__kernel void GenCode(";

	//大文字1文字処理
	for (int i = 0; i < 26; i++)
	{
		if (globalnum[i] != 0)
		{
			Aa[0] = 65 + i;
			header += "__global " + stype[typeflg] + "* " + Aa + " ,";
			argcnt2++;
		}
	}

	if (argcnt2 == 0)
	{
		MessageBox(NULL, "「A」などの大文字変数が一つもありません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}

	//大文字2文字以上処理 C D F I L UC UI UL 
	for (int i = 0; i < 10; i++)
	{
		if (C[i] != 0)
		{
			header += "__global char* C" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}
	for (int i = 0; i < 10; i++)
	{
		if (D[i] != 0)
		{
			header += "__global double* D" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}
	for (int i = 0; i < 10; i++)
	{
		if (F[i] != 0)
		{
			header += "__global float* F" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}
	for (int i = 0; i < 10; i++)
	{
		if (I[i] != 0)
		{
			header += "__global int* I" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}
	for (int i = 0; i < 10; i++)
	{
		if (L[i] != 0)
		{
			header += "__global long long* L" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}

	for (int i = 0; i < 10; i++)
	{
		if (UC[i] != 0)
		{
			header += "__global unssigned char* UC" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}
	for (int i = 0; i < 10; i++)
	{
		if (UI[i] != 0)
		{
			header += "__global unsigned int* UI" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}
	for (int i = 0; i < 10; i++)
	{
		if (UL[i] != 0)
		{
			header += "__global unsigned long long* UL" + std::to_string(i) + " ,";
			argcnt2++;
		}
	}


	//小文字処理
	privatenum[8] = 0;//i
	privatenum[9] = 0;//j
	privatenum[10] = 0;//k
	privatenum[23] = 0;//x
	privatenum[24] = 0;//y
	privatenum[25] = 0;//z
	for (int i = 0; i < 26; i++)
	{
		if (privatenum[i] != 0)
		{
			Aa[0] = 97 + i;
			if (argcnt2 >= 32) { argcnt2++; break; }
			header += "" + stype[argt[argcnt2]] + " " + Aa + " ,";
			argcnt2++;
		}
	}

	//念の為エラー処理
	if ((argcnt2 > 32) | (argcnt2 != argcnt))
	{
		if (argcnt2 > 32) MessageBox(NULL, "カーネルコード側で生成された引数の数が32を超えました", "エラー", 0);
		if (argcnt2 != argcnt) 
		{
			std::string errs = "カーネルコード側で生成された引数の数(" + std::to_string(argcnt2) + ")と\nHSP側で指定している引数の数(" + std::to_string(argcnt) + ")が異なります。";
			MessageBox(NULL, errs.c_str(), "エラー", 0);
		}
		std::string srrs = "";
		for (int i = 0; i < 26; i++) if (globalnum[i] != 0) { Aa[0] = 65 + i; srrs += Aa + ","; }
		for (int i = 0; i < 10; i++) if (C[i] != 0) { srrs += "C" + std::to_string(i) + ","; }
		for (int i = 0; i < 10; i++) if (D[i] != 0) { srrs += "D" + std::to_string(i) + ","; }
		for (int i = 0; i < 10; i++) if (F[i] != 0) { srrs += "F" + std::to_string(i) + ","; }
		for (int i = 0; i < 10; i++) if (I[i] != 0) { srrs += "I" + std::to_string(i) + ","; }
		for (int i = 0; i < 10; i++) if (L[i] != 0) { srrs += "L" + std::to_string(i) + ","; }
		for (int i = 0; i < 10; i++) if (UC[i] != 0) { srrs += "UC" + std::to_string(i) + ","; }
		for (int i = 0; i < 10; i++) if (UI[i] != 0) { srrs += "UI" + std::to_string(i) + ","; }
		for (int i = 0; i < 10; i++) if (UL[i] != 0) { srrs += "UL" + std::to_string(i) + ","; }
		for (int i = 0; i < 26; i++) if (privatenum[i] != 0) { Aa[0] = 97 + i; srrs += Aa + ","; }

		MessageBox(NULL, srrs.c_str(), "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}

	//global id埋め込み処理
	if (header[header.size() - 1] == ',')header[header.size() - 1] = ' ';
	header += ")\n{\nint i = get_global_id(0);\nint li = get_local_id(0);\n";

	//shared memory埋め込み
	for (int i = 0; i < 10; i++) 
	{
		if (S[i] != 0) 
		{
			header += "__local " + stype[typeflg] + " S" + std::to_string(i) + "[" + std::to_string(1 << i) + "];\n";
		}
	}

	return header + sor + "\n}";
}


static void HCLDoX(int typeflg)
{
	int sizelist[8];
	sizelist[0] = 1;
	sizelist[1] = 4;
	sizelist[2] = 8;
	sizelist[3] = 4;
	sizelist[4] = 8;
	sizelist[5] = 1;
	sizelist[6] = 4;
	sizelist[7] = 8;
	//まずは引数全部取得
	cl_int ret;
	char* c_source;
	c_source = code_gets();								// 文字列を取得
	std::string s_sourse = std::string(c_source);

	void* ppttr;
	int sizeofff;
	int chk;
	int type;

	int argt[32];
	int argcnt = 0;
	int argi32[32];
	INT64 argi64[32];
	double argdp[32];
	float argfp[32];
	for (int i = 0; i < 32; i++) {
		argt[i] = 0; argi32[i] = 0; argi64[i] = 0; argdp[i] = 0.0; argfp[i] = 0.0;
	}

	for (int i = 0; i < 32; i++) {
		chk = code_getprm();							// パラメーターを取得(型は問わない)
		if (chk <= PARAM_END) break;				// パラメーター省略時の処理
		type = mpval->flag;							// パラメーターの型を取得
		switch (type) {
		case HSPVAR_FLAG_DOUBLE:									// パラメーターが実数だった時
		{
			ppttr = (double*)mpval->pt;
			sizeofff = 8;
			argt[i] = 4;
			argcnt++;
			argdp[i] = *((double*)ppttr);
			break;
		}
		case HSPVAR_FLAG_INT:									// パラメーターが整数だった時
		{
			ppttr = (int*)mpval->pt;
			sizeofff = 4;
			argt[i] = 1;
			argcnt++;
			argi32[i] = *((int*)ppttr);
			break;
		}
		default:
			if (type == HspVarInt64_typeid()) // パラメーターがint64だった時
			{
				ppttr = (INT64*)mpval->pt;
				sizeofff = 8;
				argt[i] = 2;
				argcnt++;
				argi64[i] = *((INT64*)ppttr);
				break;
			}
			if (type == HspVarFloat_typeid()) // パラメーターがfloatだった時
			{
				ppttr = (float*)mpval->pt;
				sizeofff = 4;
				argt[i] = 3;
				argcnt++;
				argfp[i] = *((float*)ppttr);
				break;
			}
			puterror(HSPERR_TYPE_MISMATCH);			// サポートしていない型ならばエラー
			sizeofff = -1;
			break;
		}
	}
	//引数取得ここまで
	

	//一旦エラー処理
	cl_mem baseMem;
	if (sizeof(size_t) == 8)baseMem = (cl_mem)argi64[0];
	if (sizeof(size_t) == 4)baseMem = (cl_mem)argi32[0];
	if (baseMem == 0)
	{
		MessageBox(NULL, "第一引数が有効なcl_mem idではありません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}


	//コード生成して
	s_sourse = CodeRefine(s_sourse, typeflg, argt, argcnt);
	size_t h = KrnToHash(s_sourse);
	kernel = StrHashToKernel(s_sourse, h);

	//これでkernelまで求まった。あとは引数指定
	//global数を計算。Aに対応
	size_t global_size = GetMemSize(baseMem) / sizelist[typeflg];

	//引数
	for (int i = 0; i < argcnt; i++)
	{
		if (argt[i] == 1)ppttr = (int*)&argi32[i];
		if (argt[i] == 2)ppttr = (INT64*)&argi64[i];
		if (argt[i] == 3)ppttr = (float*)&argfp[i];
		if (argt[i] == 4)ppttr = (double*)&argdp[i];
		clSetKernelArg(kernel, i, sizelist[argt[i]], ppttr);
	}
	
	//あとは実行するだけ
	//outevent関連
	cl_event* outevent = EventOutChk2((size_t)kernel);
	//wait event list関連
	cl_event* ev_ = GetWaitEvlist();
	size_t local_size = 64;
	size_t p4_1 = (global_size / local_size) * local_size;//local_sizeで割り切れる数字に
	size_t p4_2 = global_size - p4_1;//問題の端数

	if (p4_1 != 0) {
		ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			kernel, 1, NULL, &p4_1, &local_size, num_event_wait_list, ev_, outevent);//1回目は無事終わる
		if (ret != CL_SUCCESS) { retmeserr(ret); }
	}

	if (p4_2 != 0) {
		local_size = p4_2;
		ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			kernel, 1, &p4_1, &p4_2, &local_size, num_event_wait_list, ev_, NULL);
		if (ret != CL_SUCCESS) { retmeserr(ret); }
	}
	num_event_wait_list = 0;
	return;
}


void HCLDoXc(void)
{
	HCLDoX(0);
}

void HCLDoXi(void)
{
	HCLDoX(1);
}

void HCLDoXl(void)
{
	HCLDoX(2);
}

void HCLDoXf(void)
{
	HCLDoX(3);
}

void HCLDoXd(void)
{
	HCLDoX(4);
}

void HCLDoXuc(void)
{
	HCLDoX(5);
}

void HCLDoXui(void)
{
	HCLDoX(6);
}

void HCLDoXul(void)
{
	HCLDoX(7);
}