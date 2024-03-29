--------------------------------------------------------------------------  
【  ソフト名   】HSPCL64.dll  
【 バージョン  】1.1  
【    作者     】toropippi  
【  必要環境１ 】Windows7 以降  
【  必要環境２ 】HSP Ver3.5以降  
【  必要環境３ 】OpenCL対応グラフィックボードまたはCPUまたはCellプロセッサー  
			GeForce 400 Series以降  
			RADEON HD 6xxx以降  
			HD Graphics 2500/4000以降(Ivy Bridge以降)  
【  取扱種別   】フリープラグイン  
【    内容     】HSP3(64bit)用OpenCLプラグイン  
【     HP      】http://toropippi.web.fc2.com/  
--------------------------------------------------------------------------  
  
|サンプル実行画面|サンプル実行画面|サンプル実行画面|
|---|---|---|
|![sample73](https://user-images.githubusercontent.com/44022497/121392033-f733c600-c989-11eb-95ba-ec36d5a29dd8.jpg)|![Sample50_result_simpleOverlap](https://user-images.githubusercontent.com/44022497/121392041-f8fd8980-c989-11eb-9a99-cd376b9306b7.png)|![sample70](https://user-images.githubusercontent.com/44022497/121392264-319d6300-c98a-11eb-95a4-5228bc492bb1.png)|
|![sample62](https://user-images.githubusercontent.com/44022497/121392331-3d892500-c98a-11eb-9770-768e0e3f1c16.png)|![sample57](https://user-images.githubusercontent.com/44022497/121392532-72957780-c98a-11eb-996e-af459b149cf9.png)|![sample26](https://user-images.githubusercontent.com/44022497/121392616-850fb100-c98a-11eb-81b2-63df8efe6564.png)|
|![sample03](https://user-images.githubusercontent.com/44022497/121392785-a7a1ca00-c98a-11eb-9ef1-6ea6c6fa637d.png)|![sample64](https://user-images.githubusercontent.com/44022497/121392817-b12b3200-c98a-11eb-812e-1e829c68a3e2.png)|![sample71](https://user-images.githubusercontent.com/44022497/121392856-ba1c0380-c98a-11eb-9f4a-e4b2dc18375c.png)|
|![sample55](https://user-images.githubusercontent.com/44022497/121392905-c607c580-c98a-11eb-876a-502b112be018.jpg)|![Sample52_result_NoOverlap](https://user-images.githubusercontent.com/44022497/121392936-cd2ed380-c98a-11eb-80d0-7a97ef16906b.png)|![Sample51_result_OverlapChain](https://user-images.githubusercontent.com/44022497/121392998-dc158600-c98a-11eb-9d64-96eb88c62a9c.png)|

## ■使用方法  
１、「HSPCL64.dll」をHSPインストールフォルダ「C:\hsp35」ないしは「C:\Program Files (x86)\hsp35」か「C:\Program Files\hsp35」へコピーして下さい。  
２、「hspcl64.as」をHSPインストールフォルダの「common」フォルダの中へ入れて下さい。  
３、ヘルプデータをコピーしたい場合は、「doclib」フォルダ自体をそのままHSPインストールフォルダの中へ上書きして下さい。  
  
  
## ■概要  
  OpenCLをHSPから簡単に触れるようにしたプラグインです。HSPは計算速度が遅いのが課題ですが、このプラグインがあればGPU上で計算(GPGPU)させることができ、とてつもない高速化が可能になります。  
  現在HSPCLシリーズは3種類あります。  
  
### HSPCL64
  ここで公開しているものです。  
  HSPCL32Nの64bit版です。  
  HSPCL32Nと比較し、GPU上で確保できるメモリサイズ4GBまでの制約がなくなりました。  
  ほかOpenCL関連の機能が沢山ありサンプルも70近く用意してます。  
  
### HSPCL32 ver2.0(HSPコンテスト2013) → HSPCL32Nへ改名  
  HSPCL32 ver2.0はOpenCL機能しかないプラグインです。  
  https://github.com/toropippi/HSPCL32N  
  youdaiさんによる修正を反映し下記点が更新されました。  
  ・cliniの返り値の cldevcount が stat へ変更  
  ・fdim が clfdim へ変更  
  ・float() が clfloat() へ変更  
  その後HSPCL64から命令を逆輸入して、互換性を保ちつつHSPCL64とほぼ同じような形で使えるようになりました。  
  今後さらに更新を続ける予定です。  
  
### HSPCL32 ver4.02  
  HSPコンテスト2014版はコチラ  
  http://dev.onionsoft.net/seed/info.ax?id=929  
  ただしこれは「varsize」関数がかち合ってhsp35以降ではエラーが出るようになりました。  
  
  そこでyoudaiさんによりhspcl32.asの中身を修正して頂いた安定バージョンが公開されました。  
  http://youdaizone.starfree.jp/hsp3/hspcl32m_42/index.html  
  現在はコチラを使用するのが良いでしょう。  
  なおver4.02以降更新の予定はございません。  
  
## ■インストール  
HSPインストールフォルダにHSPCL64.dllをコピー  
アンインストールはゴミ箱へ削除  
  
## ■注意点  
このプラグインではカーネルコードによるメモリアクセス違反に対して防護する機能がありません。  
メモリアクセス違反によるエラーがシステムに影響を及ぼすことがあります。  
  
最悪、ブルースクリーンになったり、GPUからの信号が途絶え画面が落ちたり、GPUがフリーズしたりなどの現象が起こります。  
これに関するいかなる損失も、責任を負えません。  
  
ただ私は100回以上ブルスクを出してきましたが、これでGPUが壊れたことは1回もありませんでした。  
  
## ■配布場所  
http://toropippi.web.fc2.com/(まだです)  
https://dev.onionsoft.net/seed/info.ax?id=2017  
  
## ■連絡先  
efghiqippi@yahoo.co.jp  
  
## ■免責  
このプラグインの使用により発生した如何なる問題について当方は一切の責任を負いません。  
商用問わず配布、転載、改造は無断かつ自由にして構いません（大歓迎）  
  
## ■License  
Copyright (c) 2021 toropippi  
Released under the MIT license  
see https://opensource.org/licenses/mit-license.php  

HSPで64bit int型が使える部分はinoviaさんから拝借いたしました。  
https://github.com/inovia/HSPInt64  
ここから流用した部分に関してはBSD-3-Clause Licenseに準拠しています。  
see https://opensource.org/licenses/BSD-3-Clause  
  
## TODO  
・Ver2.0ではZeroCopyためす  
  
## ■更新履歴  
	ver 1.1  
	float型実装  
	FloatToDouble削除  
	DoubleToFloat削除  
	HCLdim_fpFromBuffer命令実装  
	HCLReadIndex_fp,HCLWriteIndex_fp命令実装  
	HCLGetDeviceInfo_s,i,i64命令をモジュールからプラグインに埋め込み  
	HCLFillBuffer_i32,i64,dp系命令を1つにまとめ  
	HCLGetSize命令実装  
	HCLGetAllBufferSize命令実装  
	HCLGarbageCollectionNow命令実装  
	HCLIncRefcntCLBufferId,HCLDecRefcntCLBufferId命令実装  
	HCLCall2命令実装  
	HCLDoXc,i,l,f,d,uc,ui,ul系命令実装  
	HCLBLAS系命令実装  
	HCLBLASのgemmとgemvとsT,dTとdot,mrn命令を関数型でも使えるよう実装  
	HCLEventAutoProfilingStart,HCLEventAutoProfilingEnd()命令実装  
	HCLGetPluginVersion命令でプラグインバージョンを取得できるように  
	HCLGetProgramBinary,HCLCreateProgramWithBinary命令でバイナリ形式でプログラムの入出力対応  
	
	ver 1.0  
	HCLDokrn2,3実装  
	HCLdim_i64FromBuffer命令実装  
	HCLdim_i32FromBuffer命令実装  
	HCLdim_dpFromBuffer命令実装  
	ソースリファクタリング&若干の高速化  
	
	ver 0.9  
	HCLReadBufferやHCLWriteBufferのノンブロッキングモードがNVIDIA GPUでつかえないため、同命令のみ別スレッドを立ち上げて強制的にノンブロッキングできるよう命令追加  
	DoubleToFloat実装  
	FloatToDouble実装  
	HCLReadBufferやHCLWriteBufferでメモリアクセスチェックを行ってエラーを出すように  
	HCLFillBuffer系とReadIndex、WriteIndexの型指定(i32 i64 dp)を共通に  
	HCLFillBufferで引数省略できるよう修正  
	サンプル多数追加  
	他バグ多数修正  
	
	ver 0.3  
	HCLCreateBufferFrom,HCLFlushなど実装  
	HCLFillBuffer実装  
	  
	ver 0.2  
	2021/5/6  
	HCLCallを実装  
	  
	Ver 0.1  
	2020/2/14  
	HSPCL32からHSPCL64へ命令群を移行  
	OpenGL関連は全部削除  
	fdimは削除、それに伴いHSP側でfloat型が使えなくなった  
	clEvent関連を実装  
	CommandQueue関連を実装  