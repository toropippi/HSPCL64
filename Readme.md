--------------------------------------------------------------------------  【  ソフト名   】HSPCL64.dll  【 バージョン  】0.2  【    作者     】toropippi  【  必要環境１ 】Windows7 以降  【  必要環境２ 】HSP Ver3.5以降  【  必要環境３ 】OpenCL対応グラフィックボードまたはCPUまたはCellプロセッサー  			GeForce 400 Series以降  			RADEON HD 6xxx以降  			HD Graphics 2500/4000以降(Ivy Bridge以降)  【  取扱種別   】フリープラグイン  【    内容     】HSP3用GPGPUプラグイン  【     HP      】http://toropippi.web.fc2.com/  --------------------------------------------------------------------------    ■使用方法  １、「HSPCL64.dll」をHSPインストールフォルダ「C:\hsp35」ないしは「C:\Program Files (x86)\hsp35」か「C:\Program Files\hsp35」へコピーして下さい。  ２、「hspcl64.as」をHSPインストールフォルダの「common」フォルダの中へ入れて下さい。  ３、ヘルプデータをコピーしたい場合は、「doclib」フォルダ自体をそのままHSPインストールフォルダの中へ上書きして下さい。      ■概要  これはHSP3から簡単にOpenCLを扱うことができるプラグインです。  最短で2つの命令で、OpenCLによる計算を行うことができます。  これを導入することにより、すぐにGPGPUで高速演算を楽しむことができるようになります。  またHSP3プログラムソース内でlong long int型も扱えるようになります。    ■インストール  HSPインストールフォルダにHSPCL64.dllをコピー  アンインストールはゴミ箱へ削除    ■注意点  このプラグインでは速度を優先したためメモリアクセス違反に対して防護する機能がありません。  よって、アクセス違反によるエラーがシステムに影響を及ぼすことがあります。    最悪、ブルースクリーンになったり、グラボ(GPU)からの信号が途絶え画面が落ちたり、グラボ(GPU)がフリーズしたりなどの現象が起こります。  サンプルに陥りやすいエラーサンプルを用意したので、それを参考になるべくコードミスはないように気をつけて下さい。  これに関するいかなる損失も、当方は責任を負えません。    ただ私は100回以上ブルスクを出してきましたが、これでGPUが壊れたことは1回もありませんでした。    ■配布場所  http://toropippi.web.fc2.com/  他HSPコンテストのページになる予定・・・    ■連絡先  efghiqippi@yahoo.co.jp    ■免責  このプラグインの使用により発生した如何なる問題について当方は一切の責任を負いません。  商用問わず配布、転載、改造は無断かつ自由にして構いません（大歓迎）    ■License  HSPCL64 Copyright (c) 2021 toropippi  Released under the Apache License, Version 2.0  see https://opensource.org/licenses/Apache-2.0    HSPで64bit int型が使える部分はinoviaさんから拝借いたしました。  https://github.com/inovia/HSPInt64  ここから流用した部分に関してはBSD-3-Clause Licenseに準拠しています。  see https://opensource.org/licenses/BSD-3-Clause      ■更新履歴      ver 0.2  	2021/5/6  	HCLCallを実装  	      Ver 0.1  	2020/2/14  	HSPCL32からHSPCL64へ命令群を移行  	OpenGL関連は全部削除  	fdimは削除、それに伴いHSP側でfloat型が使えなくなった  	clEvent関連を実装  	CommandQueue関連を実装