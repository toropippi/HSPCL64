--------------------------------------------------------------------------  
�y  �\�t�g��   �zHSPCL64.dll  
�y �o�[�W����  �z1.1  
�y    ���     �ztoropippi  
�y  �K�v���P �zWindows7 �ȍ~  
�y  �K�v���Q �zHSP Ver3.5�ȍ~  
�y  �K�v���R �zOpenCL�Ή��O���t�B�b�N�{�[�h�܂���CPU�܂���Cell�v���Z�b�T�[  
			GeForce 400 Series�ȍ~  
			RADEON HD 6xxx�ȍ~  
			HD Graphics 2500/4000�ȍ~(Ivy Bridge�ȍ~)  
�y  �戵���   �z�t���[�v���O�C��  
�y    ���e     �zHSP3(64bit)�pOpenCL�v���O�C��  
�y     HP      �zhttp://toropippi.web.fc2.com/  
--------------------------------------------------------------------------  
  
|�T���v�����s���|�T���v�����s���|�T���v�����s���|
|---|---|---|
|![sample73](https://user-images.githubusercontent.com/44022497/121392033-f733c600-c989-11eb-95ba-ec36d5a29dd8.jpg)|![Sample50_result_simpleOverlap](https://user-images.githubusercontent.com/44022497/121392041-f8fd8980-c989-11eb-9a99-cd376b9306b7.png)|![sample70](https://user-images.githubusercontent.com/44022497/121392264-319d6300-c98a-11eb-95a4-5228bc492bb1.png)|
|![sample62](https://user-images.githubusercontent.com/44022497/121392331-3d892500-c98a-11eb-9770-768e0e3f1c16.png)|![sample57](https://user-images.githubusercontent.com/44022497/121392532-72957780-c98a-11eb-996e-af459b149cf9.png)|![sample26](https://user-images.githubusercontent.com/44022497/121392616-850fb100-c98a-11eb-81b2-63df8efe6564.png)|
|![sample03](https://user-images.githubusercontent.com/44022497/121392785-a7a1ca00-c98a-11eb-9ef1-6ea6c6fa637d.png)|![sample64](https://user-images.githubusercontent.com/44022497/121392817-b12b3200-c98a-11eb-812e-1e829c68a3e2.png)|![sample71](https://user-images.githubusercontent.com/44022497/121392856-ba1c0380-c98a-11eb-9f4a-e4b2dc18375c.png)|
|![sample55](https://user-images.githubusercontent.com/44022497/121392905-c607c580-c98a-11eb-876a-502b112be018.jpg)|![Sample52_result_NoOverlap](https://user-images.githubusercontent.com/44022497/121392936-cd2ed380-c98a-11eb-80d0-7a97ef16906b.png)|![Sample51_result_OverlapChain](https://user-images.githubusercontent.com/44022497/121392998-dc158600-c98a-11eb-9d64-96eb88c62a9c.png)|

## ���g�p���@  
�P�A�uHSPCL64.dll�v��HSP�C���X�g�[���t�H���_�uC:\hsp35�v�Ȃ����́uC:\Program Files (x86)\hsp35�v���uC:\Program Files\hsp35�v�փR�s�[���ĉ������B  
�Q�A�uhspcl64.as�v��HSP�C���X�g�[���t�H���_�́ucommon�v�t�H���_�̒��֓���ĉ������B  
�R�A�w���v�f�[�^���R�s�[�������ꍇ�́A�udoclib�v�t�H���_���̂����̂܂�HSP�C���X�g�[���t�H���_�̒��֏㏑�����ĉ������B  
  
  
## ���T�v  
  OpenCL��HSP����ȒP�ɐG���悤�ɂ����v���O�C���ł��BHSP�͌v�Z���x���x���̂��ۑ�ł����A���̃v���O�C���������GPU��Ōv�Z(GPGPU)�����邱�Ƃ��ł��A�ƂĂ��Ȃ����������\�ɂȂ�܂��B  
  ����HSPCL�V���[�Y��3��ނ���܂��B  
  
### HSPCL64
  �����Ō��J���Ă�����̂ł��B  
  HSPCL32N��64bit�łł��B  
  HSPCL32N�Ɣ�r���AGPU��Ŋm�ۂł��郁�����T�C�Y4GB�܂ł̐��񂪂Ȃ��Ȃ�܂����B  
  �ق�OpenCL�֘A�̋@�\����R����T���v����70�߂��p�ӂ��Ă܂��B  
  
### HSPCL32 ver2.0(HSP�R���e�X�g2013) �� HSPCL32N�։���  
  HSPCL32 ver2.0��OpenCL�@�\�����Ȃ��v���O�C���ł��B  
  https://github.com/toropippi/HSPCL32N  
  youdai����ɂ��C���𔽉f�����L�_���X�V����܂����B  
  �Eclini�̕Ԃ�l�� cldevcount �� stat �֕ύX  
  �Efdim �� clfdim �֕ύX  
  �Efloat() �� clfloat() �֕ύX  
  ���̌�HSPCL64���疽�߂��t�A�����āA�݊�����ۂ���HSPCL64�Ƃقړ����悤�Ȍ`�Ŏg����悤�ɂȂ�܂����B  
  ���コ��ɍX�V�𑱂���\��ł��B  
  
### HSPCL32 ver4.02  
  HSP�R���e�X�g2014�ł̓R�`��  
  http://dev.onionsoft.net/seed/info.ax?id=929  
  ����������́uvarsize�v�֐�������������hsp35�ȍ~�ł̓G���[���o��悤�ɂȂ�܂����B  
  
  ������youdai����ɂ��hspcl32.as�̒��g���C�����Ē���������o�[�W���������J����܂����B  
  http://youdaizone.webcrow.jp/hsp3/hspcl32_fix.html  
  ���݂̓R�`�����g�p����̂��ǂ��ł��傤�B  
  �Ȃ�ver4.02�ȍ~�X�V�̗\��͂������܂���B  
  
## ���C���X�g�[��  
HSP�C���X�g�[���t�H���_��HSPCL64.dll���R�s�[  
�A���C���X�g�[���̓S�~���֍폜  
  
## �����ӓ_  
���̃v���O�C���ł̓J�[�l���R�[�h�ɂ�郁�����A�N�Z�X�ᔽ�ɑ΂��Ėh�삷��@�\������܂���B  
�������A�N�Z�X�ᔽ�ɂ��G���[���V�X�e���ɉe�����y�ڂ����Ƃ�����܂��B  
  
�ň��A�u���[�X�N���[���ɂȂ�����AGPU����̐M�����r�₦��ʂ���������AGPU���t���[�Y������Ȃǂ̌��ۂ��N����܂��B  
����Ɋւ��邢���Ȃ鑹�����A�ӔC�𕉂��܂���B  
  
��������100��ȏ�u���X�N���o���Ă��܂������A�����GPU����ꂽ���Ƃ�1�������܂���ł����B  
  
## ���z�z�ꏊ  
http://toropippi.web.fc2.com/(�܂��ł�)  
https://dev.onionsoft.net/seed/info.ax?id=2017  
  
## ���A����  
efghiqippi@yahoo.co.jp  
  
## ���Ɛ�  
���̃v���O�C���̎g�p�ɂ�蔭�������@���Ȃ���ɂ��ē����͈�؂̐ӔC�𕉂��܂���B  
���p��킸�z�z�A�]�ځA�����͖��f�����R�ɂ��č\���܂���i�劽�}�j  
  
## ��License  
The source for HSPCL64 is licensed under the Apache License, Version 2.0  
see https://opensource.org/licenses/Apache-2.0  
  
HSP��64bit int�^���g���镔����inovia���񂩂�q�؂������܂����B  
https://github.com/inovia/HSPInt64  
�������痬�p���������Ɋւ��Ă�BSD-3-Clause License�ɏ������Ă��܂��B  
see https://opensource.org/licenses/BSD-3-Clause  
  
## TODO  
�EVer2.0�ł�ZeroCopy���߂�  
  
## ���X�V����  
	ver 1.1  
	float�^����  
	FloatToDouble�폜  
	DoubleToFloat�폜  
	HCLdim_fpFromBuffer���ߎ���  
	HCLReadIndex_fp,HCLWriteIndex_fp���ߎ���  
	HCLGetDeviceInfo_s,i,i64���߂����W���[������v���O�C���ɖ��ߍ���  
	HCLFillBuffer_i32,i64,dp�n���߂�1�ɂ܂Ƃ�  
	HCLGetSize���ߎ���  
	HCLGetAllBufferSize���ߎ���  
	HCLGarbageCollectionNow���ߎ���  
	HCLIncRefcntCLBufferId,HCLDecRefcntCLBufferId���ߎ���  
	HCLCall2���ߎ���  
	HCLDoXc,i,l,f,d,uc,ui,ul�n���ߎ���  
	HCLBLAS�n���ߎ���  
	HCLBLAS��gemm��gemv��sT,dT��dot,mrn���߂��֐��^�ł��g����悤����  
	HCLEventAutoProfilingStart,HCLEventAutoProfilingEnd()���ߎ���  
	HCLGetPluginVersion���߂Ńv���O�C���o�[�W�������擾�ł���悤��  
	HCLGetProgramBinary,HCLCreateProgramWithBinary���߂Ńo�C�i���`���Ńv���O�����̓��o�͑Ή�  
	
	ver 1.0  
	HCLDokrn2,3����  
	HCLdim_i64FromBuffer���ߎ���  
	HCLdim_i32FromBuffer���ߎ���  
	HCLdim_dpFromBuffer���ߎ���  
	�\�[�X���t�@�N�^�����O&�኱�̍�����  
	
	ver 0.9  
	HCLReadBuffer��HCLWriteBuffer�̃m���u���b�L���O���[�h��NVIDIA GPU�ł����Ȃ����߁A�����߂̂ݕʃX���b�h�𗧂��グ�ċ����I�Ƀm���u���b�L���O�ł���悤���ߒǉ�  
	DoubleToFloat����  
	FloatToDouble����  
	HCLReadBuffer��HCLWriteBuffer�Ń������A�N�Z�X�`�F�b�N���s���ăG���[���o���悤��  
	HCLFillBuffer�n��ReadIndex�AWriteIndex�̌^�w��(i32 i64 dp)�����ʂ�  
	HCLFillBuffer�ň����ȗ��ł���悤�C��  
	�T���v�������ǉ�  
	���o�O�����C��  
	
	ver 0.3  
	HCLCreateBufferFrom,HCLFlush�Ȃǎ���  
	HCLFillBuffer����  
	  
	ver 0.2  
	2021/5/6  
	HCLCall������  
	  
	Ver 0.1  
	2020/2/14  
	HSPCL32����HSPCL64�֖��ߌQ���ڍs  
	OpenGL�֘A�͑S���폜  
	fdim�͍폜�A����ɔ���HSP����float�^���g���Ȃ��Ȃ���  
	clEvent�֘A������  
	CommandQueue�֘A������  