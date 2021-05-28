char bugchar[1024 * 1024];
void retmeserr(cl_int ret);//clEnqueueNDRangeKernel で失敗した時出すエラーメッセージをまとめた関数
void retmeserr2(cl_int ret);//clReadで失敗した時出すエラーメッセージをまとめた関数
void retmeserr3(cl_int ret);//clCreateCommandQueueで失敗した時出すエラーメッセージをまとめた関数
void retmeserr4(cl_int ret);//clCreateContextで失敗した時出すエラーメッセージをまとめた関数
void retmeserr5(cl_int ret);//HCLGetEventStartTimeで失敗した時出すエラーメッセージをまとめた関数
void retmeserr6(cl_int ret); //clWaitForEventsで失敗した時出すエラーメッセージをまとめた関数
void retmeserr7(cl_device_id d_id, cl_program program);//HCLCreateProgramで失敗した時出すエラーメッセージをまとめた関数
void retmeserr8(cl_int ret);//clCreateKernelで失敗した時出すエラーメッセージをまとめた関数
void retmeserr9(cl_int ret);//clCreateBufferで失敗した時出すエラーメッセージをまとめた関数
void retmeserr10(cl_int ret);//clFinishで失敗した時出すエラーメッセージをまとめた関数
void retmeserr11(cl_int ret);//clFlushで失敗した時出すエラーメッセージをまとめた関数
void retmeserr12(cl_int ret);//clGetMemObjectInfoで失敗した時出すエラーメッセージをまとめた関数
void retmeserr13(cl_int ret);//clCreateUserEventで失敗した時出すエラーメッセージをまとめた関数
void retmeserr14(cl_int ret);//clSetUserEventStatusで失敗した時出すエラーメッセージをまとめた関数







void retmeserr(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_PROGRAM_EXECUTABLE:
		MessageBox(NULL, "デバイス上で実行可能な、正常にビルドされたプログラムが一つもありません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "デバイスidが無効なデバイスになっています", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "カーネルidが間違っています", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "カーネルidが違うデバイスidで登録されています、あるいは第一引数と event_wait_list 内のイベントと関連付けられたデバイスが同じでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL_ARGS:
		MessageBox(NULL, "カーネル引数が指定されていません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_WORK_SIZE:
		MessageBox(NULL, "global_work_size が NULL です。あるいは、global_work_sizeの配列のどれかが0です。もしくはカーネルを実行するデバイス上でのglobal_work_sizeが上限値を超えている", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_OFFSET:
		MessageBox(NULL, "CL_INVALID_GLOBAL_OFFSET - global_work_offset が NULL でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_DIMENSION:
		MessageBox(NULL, "work_dim が適切な値でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_GROUP_SIZE:
		MessageBox(NULL, "global_work_sizeがlocal_work_size で整除できない、またはlocal_work_size[0]*local_work_size[1]*local_work_size[2]が、一つのワークグループ内のワークアイテム数の最大値を超えた", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_ITEM_SIZE:
		MessageBox(NULL, "local_work_size[0], ... local_work_size[work_dim - 1] で指定したワークアイテム数が対応する CL_DEVICE_MAX_WORK_ITEM_SIZES[0], ... CL_DEVICE_MAX_WORK_ITEM_SIZES[work_dim - 1] の値こえている、または0を指定した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "kernel の引数に指定されたバッファ/イメージオブジェクトに関連付けられたデータ保存のためのメモリ領域の確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT_WAIT_LIST:
		MessageBox(NULL, "event_wait_list が NULL で num_events_in_wait_list が 0 より大きいとき。あるいは event_wait_list が NULL でなく num_events_in_wait_list が 0 のとき。あるいは event_wait_list 内のイベントオブジェクトが有効なものでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}




void retmeserr2(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "command_queue is not a valid command-queue", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "メモリオブジェクトが別のデバイスで作成された可能性があります", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_MEM_OBJECT:
		MessageBox(NULL, "メモリオブジェクトの実体がありません。メモリオブジェクトが別のデバイスで作成された可能性があります。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "アドレスアクセス違反です。読み込み領域がはみ出してます。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_COPY_OVERLAP:
		MessageBox(NULL, "アドレスアクセス違反です。書き込み領域か読み込み領域がはみ出してます。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "data store のためにallocate memoryするのを失敗しました", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス(GPU)上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト(CPU)上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);

}

void retmeserr3(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "CL_INVALID_CONTEXT:if context is not a valid context.\\nコンテキストが有効なコンテキストでない場合", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_DEVICE:
		MessageBox(NULL, "CL_INVALID_DEVICE:if device is not a valid device or is not associated with context\\nデバイスが有効なデバイスではない場合、またはコンテキストに関連付けられていない場合", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE: if values specified in properties are not valid.\\nプロパティで指定された値が無効な場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_QUEUE_PROPERTIES:
		MessageBox(NULL, "CL_INVALID_QUEUE_PROPERTIES:if values specified in properties are valid but are not supported by the device.プロパティで指定された値は有効であるが、デバイスでサポートされていない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.\\nホスト上のOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}

void retmeserr4(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_PLATFORM:
		MessageBox(NULL, "CL_INVALID_PLATFORM:if properties is NULL and no platform could be selected or if platform value specified in properties is not a valid platform.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE:CL_INVALID_VALUE if context property name in properties is not a supported property name; if devices is NULL; if num_devices is equal to zero; or if pfn_notify is NULL but user_data is not NULL.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_DEVICE:
		MessageBox(NULL, "CL_INVALID_DEVICE: if devices contains an invalid device or are not associated with the specified platform.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_DEVICE_NOT_AVAILABLE:
		MessageBox(NULL, "CL_DEVICE_NOT_AVAILABLE if a device in devices is currently not available even though the device was returned by clGetDeviceIDs.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}


void retmeserr5(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_PROFILING_INFO_NOT_AVAILABLE:
		MessageBox(NULL, " コマンドキュー に CL_QUEUE_PROFILING_ENABLE フラグが設定されていないとき。あるいは、event と関連付けられたコマンドの実行状態が CL_COMPLETE でないとき。あるいは、event がユーザイベントオブジェクトのとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT:
		MessageBox(NULL, "event が有効なイベントオブジェクトでないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, " param_name がサポートされている値でない、あるいは、param_value_size で指定されたサイズが上記の表で指定されている戻り値型のサイズより小さくかつ param_value が NULL でないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗したとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗したとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}



void retmeserr6(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_EVENT:
		MessageBox(NULL, "event_list が有効なイベントオブジェクトでないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "num_events が 0 あるいは event_list が NULL のとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "event_list 内のイベントが関連付けられているOpenCLコンテキストが同じでないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST:
		MessageBox(NULL, "event_list 内のイベントのうちいずれかの実行状態が負の値のとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗したとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗したとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}


void retmeserr7(cl_device_id d_id,cl_program program)
{
	size_t len;
	clGetProgramBuildInfo(program, d_id,CL_PROGRAM_BUILD_LOG, sizeof(bugchar), bugchar, &len);
	MessageBox(NULL, (LPCSTR)bugchar, "Error on OpenCL code", MB_OK);
	puterror(HSPERR_UNKNOWN_CODE);
}



void retmeserr8(cl_int ret)
{

	switch (ret) {							//分岐

	case CL_INVALID_PROGRAM:
		MessageBox(NULL, "program が有効なプログラムオブジェクトでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_PROGRAM_EXECUTABLE:
		MessageBox(NULL, "program に正常にビルドされた実行可能プログラムがない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_KERNEL_NAME:
		MessageBox(NULL, "kernel_name が program 内に見つからない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_KERNEL_DEFINITION:
		MessageBox(NULL, "kernel_name が与える、引数や引数の型といった __kernel 関数の関数定義が、program がビルドされたすべてのデバイスで同じでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_VALUE:
		MessageBox(NULL, "kernel_name が NULL", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}



void retmeserr9(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "context が有効なOpenCLコンテキストでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "読み書き専用メモリが用意できませんでした", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "size が 0 のとき。もしくは size が context 内のデバイスの CL_DEVICE_MAX_MEM_ALLOC_SIZE の値より大きい", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_HOST_PTR:
		MessageBox(NULL, "host_ptr が NULL で CL_MEM_USE_HOST_PTR もしくは CL_MEM_COPY_HOST_PTR が flags に指定されているとき。もしくは、CL_MEM_COPY_HOST_PTR や CL_MEM_USE_HOST_PTR が設定されていないのに host_ptr が NULL でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "バッファオブジェクトのメモリを確保するのに失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}


void retmeserr10(cl_int ret) 
{

	switch (ret) {							//分岐

	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "CL_INVALID_COMMAND_QUEUE　第一引数が有効な値ではありません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "第一引数と event_wait_list 内のイベントと関連付けられたデバイスが同じでない\ncontext が有効なOpenCLコンテキストでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT:
		MessageBox(NULL, "event_listのイベントオブジェクトが不正", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_VALUE:
		MessageBox(NULL, "読み書き専用メモリが用意できませんでした", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "size が 0 のとき。もしくは size が context 内のデバイスの CL_DEVICE_MAX_MEM_ALLOC_SIZE の値より大きい", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_HOST_PTR:
		MessageBox(NULL, "host_ptr が NULL で CL_MEM_USE_HOST_PTR もしくは CL_MEM_COPY_HOST_PTR が flags に指定されているとき。もしくは、CL_MEM_COPY_HOST_PTR や CL_MEM_USE_HOST_PTR が設定されていないのに host_ptr が NULL でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "バッファオブジェクトのメモリを確保するのに失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);

}


void retmeserr11(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "CL_INVALID_COMMAND_QUEUE: if command_queue is not a valid command-queue", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);

}


void retmeserr12(cl_int ret)
{
	switch (ret)
	{							//分岐
	case CL_INVALID_VALUE:
		MessageBox(NULL, "param_name がサポートされている値でない、あるいは、param_value_size で指定されたサイズが上記の表で指定されている戻り値型のサイズより小さくかつ param_value が NULL でないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_MEM_OBJECT:
		MessageBox(NULL, "memobj が有効なメモリオブジェクトでないとき", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗したとき", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗したとき", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}


void retmeserr13(cl_int ret)
{
	switch (ret)
	{							//分岐
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "if context is not a valid context.\nコンテキストが有効なコンテキストでない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "if there is a failure to allocate resources required by the OpenCL implementation on the device.\nデバイスでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "if there is a failure to allocate resources required by the OpenCL implementation on the host\nホストでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}



void retmeserr14(cl_int ret)
{
	switch (ret)
	{							//分岐
	case CL_INVALID_EVENT:
		MessageBox(NULL, "if event is not a valid user event.\nイベントが有効なユーザーイベントでない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "if the execution_status is not CL_COMPLETE or a negative integer value.\nexecute_statusがCL_COMPLETEまたは負の整数値でない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_OPERATION:
		MessageBox(NULL, "if the execution_status for event has already been changed by a previous call to clSetUserEventStatus.\nイベントのexecution_statusが、clSetUserEventStatusへの以前の呼び出しによってすでに変更されている場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "if there is a failure to allocate resources required by the OpenCL implementation on the device.\nデバイスでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "if there is a failure to allocate resources required by the OpenCL implementation on the host.\nホストでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}



 
 
 
 