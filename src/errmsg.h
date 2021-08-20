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
		MessageBox(NULL, "CL_INVALID_PROGRAM_EXECUTABLE\nデバイス上で実行可能な、正常にビルドされたプログラムが一つもありません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "CL_INVALID_COMMAND_QUEUE\nデバイスidが無効なデバイスになっています", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "CL_INVALID_KERNEL\nカーネルidが間違っています", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "CL_INVALID_CONTEXT\nカーネルidが違うデバイスidで登録されています、あるいは第一引数と event_wait_list 内のイベントと関連付けられたデバイスが同じでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL_ARGS:
		MessageBox(NULL, "CL_INVALID_KERNEL_ARGS\nカーネル引数が指定されていません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_WORK_SIZE:
		MessageBox(NULL, "CL_INVALID_GLOBAL_WORK_SIZE\nglobal_work_size が NULL です。あるいは、global_work_sizeの配列のどれかが0です。もしくはカーネルを実行するデバイス上でのglobal_work_sizeが上限値を超えている", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_OFFSET:
		MessageBox(NULL, "CL_INVALID_GLOBAL_OFFSET\nCL_INVALID_GLOBAL_OFFSET - global_work_offset が NULL でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_DIMENSION:
		MessageBox(NULL, "CL_INVALID_WORK_DIMENSION\nwork_dim が適切な値でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_GROUP_SIZE:
		MessageBox(NULL, "CL_INVALID_WORK_GROUP_SIZE\nglobal_work_sizeがlocal_work_size で整除できない、またはlocal_work_size[0]*local_work_size[1]*local_work_size[2]が、一つのワークグループ内のワークアイテム数の最大値を超えた", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_ITEM_SIZE:
		MessageBox(NULL, "CL_INVALID_WORK_ITEM_SIZE\nlocal_work_size[0], ... local_work_size[work_dim - 1] で指定したワークアイテム数が対応する CL_DEVICE_MAX_WORK_ITEM_SIZES[0], ... CL_DEVICE_MAX_WORK_ITEM_SIZES[work_dim - 1] の値こえている、または0を指定した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "CL_MEM_OBJECT_ALLOCATION_FAILURE\nkernel の引数に指定されたバッファ/イメージオブジェクトに関連付けられたデータ保存のためのメモリ領域の確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT_WAIT_LIST:
		MessageBox(NULL, "CL_INVALID_EVENT_WAIT_LIST\nevent_wait_list が NULL で num_events_in_wait_list が 0 より大きいとき。あるいは event_wait_list が NULL でなく num_events_in_wait_list が 0 のとき。あるいは event_wait_list 内のイベントオブジェクトが有効なものでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト上でのリソース確保に失敗した", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_COMMAND_QUEUE\ncommand_queue is not a valid command-queue", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "CL_INVALID_CONTEXT\nメモリオブジェクトが別のデバイスで作成された可能性があります", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_MEM_OBJECT:
		MessageBox(NULL, "CL_INVALID_MEM_OBJECT\nメモリオブジェクトの実体がありません。メモリオブジェクトが別のデバイスで作成された可能性があります。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\nアドレスアクセス違反です。読み込み領域がはみ出してます。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_COPY_OVERLAP:
		MessageBox(NULL, "CL_MEM_COPY_OVERLAP\nアドレスアクセス違反です。書き込み領域か読み込み領域がはみ出してます。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "CL_MEM_OBJECT_ALLOCATION_FAILURE\ndata store のためにallocate memoryするのを失敗しました", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス(GPU)上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト(CPU)上でのリソース確保に失敗した", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_CONTEXT\nCL_INVALID_CONTEXT:if context is not a valid context.\\nコンテキストが有効なコンテキストでない場合", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_DEVICE:
		MessageBox(NULL, "CL_INVALID_DEVICE\nCL_INVALID_DEVICE:if device is not a valid device or is not associated with context\\nデバイスが有効なデバイスではない場合、またはコンテキストに関連付けられていない場合", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\nCL_INVALID_VALUE: if values specified in properties are not valid.\\nプロパティで指定された値が無効な場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_QUEUE_PROPERTIES:
		MessageBox(NULL, "CL_INVALID_QUEUE_PROPERTIES\nCL_INVALID_QUEUE_PROPERTIES:if values specified in properties are valid but are not supported by the device.プロパティで指定された値は有効であるが、デバイスでサポートされていない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nCL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.\\nホスト上のOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_PLATFORM\nCL_INVALID_PLATFORM:if properties is NULL and no platform could be selected or if platform value specified in properties is not a valid platform.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\nCL_INVALID_VALUE:CL_INVALID_VALUE if context property name in properties is not a supported property name; if devices is NULL; if num_devices is equal to zero; or if pfn_notify is NULL but user_data is not NULL.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_DEVICE:
		MessageBox(NULL, "CL_INVALID_DEVICE\nCL_INVALID_DEVICE: if devices contains an invalid device or are not associated with the specified platform.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_DEVICE_NOT_AVAILABLE:
		MessageBox(NULL, "CL_DEVICE_NOT_AVAILABLE\nCL_DEVICE_NOT_AVAILABLE if a device in devices is currently not available even though the device was returned by clGetDeviceIDs.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nCL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.", "エラー", 0);
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
		MessageBox(NULL, "CL_PROFILING_INFO_NOT_AVAILABLE\nコマンドキュー に CL_QUEUE_PROFILING_ENABLE フラグが設定されていないとき。あるいは、event と関連付けられたコマンドの実行状態が CL_COMPLETE でないとき。あるいは、event がユーザイベントオブジェクトのとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT:
		MessageBox(NULL, "CL_INVALID_EVENT\nevent が有効なイベントオブジェクトでないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\nparam_name がサポートされている値でない、あるいは、param_value_size で指定されたサイズが上記の表で指定されている戻り値型のサイズより小さくかつ param_value が NULL でないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス上でのリソース確保に失敗したとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト上でのリソース確保に失敗したとき。", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_EVENT\nevent_list が有効なイベントオブジェクトでないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\nnum_events が 0 あるいは event_list が NULL のとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "CL_INVALID_CONTEXT\nevent_list 内のイベントが関連付けられているOpenCLコンテキストが同じでないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST:
		MessageBox(NULL, "CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST\nevent_list 内のイベントのうちいずれかの実行状態が負の値のとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス上でのリソース確保に失敗したとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト上でのリソース確保に失敗したとき。", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_PROGRAM\nprogram が有効なプログラムオブジェクトでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_PROGRAM_EXECUTABLE:
		MessageBox(NULL, "CL_INVALID_PROGRAM_EXECUTABLE\nprogram に正常にビルドされた実行可能プログラムがない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_KERNEL_NAME:
		MessageBox(NULL, "CL_INVALID_KERNEL_NAME\nkernel_name が program 内に見つからない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_KERNEL_DEFINITION:
		MessageBox(NULL, "CL_INVALID_KERNEL_DEFINITION\nkernel_name が与える、引数や引数の型といった __kernel 関数の関数定義が、program がビルドされたすべてのデバイスで同じでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\nkernel_name が NULL", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;

	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト上でのリソース確保に失敗した", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_CONTEXT\ncontext が有効なOpenCLコンテキストでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\n読み書き専用メモリが用意できませんでした", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "CL_INVALID_KERNEL\nsize が 0 のとき。もしくは size が context 内のデバイスの CL_DEVICE_MAX_MEM_ALLOC_SIZE の値より大きい", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_HOST_PTR:
		MessageBox(NULL, "CL_INVALID_HOST_PTR\nhost_ptr が NULL で CL_MEM_USE_HOST_PTR もしくは CL_MEM_COPY_HOST_PTR が flags に指定されているとき。もしくは、CL_MEM_COPY_HOST_PTR や CL_MEM_USE_HOST_PTR が設定されていないのに host_ptr が NULL でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "CL_MEM_OBJECT_ALLOCATION_FAILURE\nバッファオブジェクトのメモリを確保するのに失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト上でのリソース確保に失敗した", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_COMMAND_QUEUE\nCL_INVALID_COMMAND_QUEUE　第一引数が有効な値ではありません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "CL_INVALID_CONTEXT\n第一引数と event_wait_list 内のイベントと関連付けられたデバイスが同じでない\ncontext が有効なOpenCLコンテキストでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT:
		MessageBox(NULL, "CL_INVALID_EVENT\nevent_listのイベントオブジェクトが不正", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\n読み書き専用メモリが用意できませんでした", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "CL_INVALID_KERNEL\nsize が 0 のとき。もしくは size が context 内のデバイスの CL_DEVICE_MAX_MEM_ALLOC_SIZE の値より大きい", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_HOST_PTR:
		MessageBox(NULL, "CL_INVALID_HOST_PTR\nhost_ptr が NULL で CL_MEM_USE_HOST_PTR もしくは CL_MEM_COPY_HOST_PTR が flags に指定されているとき。もしくは、CL_MEM_COPY_HOST_PTR や CL_MEM_USE_HOST_PTR が設定されていないのに host_ptr が NULL でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "CL_MEM_OBJECT_ALLOCATION_FAILURE\nバッファオブジェクトのメモリを確保するのに失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス上でのリソース確保に失敗した", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_COMMAND_QUEUE\nCL_INVALID_COMMAND_QUEUE: if command_queue is not a valid command-queue", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nCL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_VALUE\nparam_name がサポートされている値でない、あるいは、param_value_size で指定されたサイズが上記の表で指定されている戻り値型のサイズより小さくかつ param_value が NULL でないとき。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_MEM_OBJECT:
		MessageBox(NULL, "CL_INVALID_MEM_OBJECT\nmemobj が有効なメモリオブジェクトでないとき", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nデバイス上でのリソース確保に失敗したとき", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nホスト上でのリソース確保に失敗したとき", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_CONTEXT\nif context is not a valid context.\nコンテキストが有効なコンテキストでない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nif there is a failure to allocate resources required by the OpenCL implementation on the device.\nデバイスでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nif there is a failure to allocate resources required by the OpenCL implementation on the host\nホストでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
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
		MessageBox(NULL, "CL_INVALID_EVENT\nif event is not a valid user event.\nイベントが有効なユーザーイベントでない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE\nif the execution_status is not CL_COMPLETE or a negative integer value.\nexecute_statusがCL_COMPLETEまたは負の整数値でない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_OPERATION:
		MessageBox(NULL, "CL_INVALID_OPERATION\nif the execution_status for event has already been changed by a previous call to clSetUserEventStatus.\nイベントのexecution_statusが、clSetUserEventStatusへの以前の呼び出しによってすでに変更されている場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "CL_OUT_OF_RESOURCES\nif there is a failure to allocate resources required by the OpenCL implementation on the device.\nデバイスでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY\nif there is a failure to allocate resources required by the OpenCL implementation on the host.\nホストでのOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}




std::string SGEMM_SOURCE0 = R"EOB(#define TSN 128
#define TSM 128
#define TSK 16
#define WPTN 8
#define WPTM 8
#define RTSN (TSN/WPTN)
#define RTSM (TSM/WPTM)
#define LPTA ((TSK*TSN)/(RTSN*RTSM))
#define LPTB ((TSK*TSM)/(RTSN*RTSM))

//[numthreads(16, 16, 1)]
//C=A*B  only k%16!=0 n>=128 m>=128
__kernel void SGEMM_a(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN * blockIdxx + tidn; // Work-group offset
int offsetM = TSM * blockIdxy + tidm; // Work-group offset
if (blockIdxy == M / 128) offsetM -= 128 - M % 128;
if (blockIdxx == N / 128) offsetN -= 128 - N % 128;
int Boffset = tidm / 2 * N + (tidm % 2) * 64 + offsetN;
int Aoffset = tidn + offsetM * K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN * WPTM];

// Initialise the accumulation registers
for (int wn = 0; wn < WPTN; wn++) {
for (int wm = 0; wm < WPTM; wm++) {
acc[wn * 8 + wm] = 0.0f;
}
}


// Loop over all tiles
int numTiles = K / TSK;
for (int t = 0; t < numTiles; t++) {
// Load one tile of A and B into local memory
float4 dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset+=16*K;
Asub[tidm][tidn]=dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset-=112*K-16;
Asub[tidm+16][tidn]=dt;

dt.x=B[Boffset];
dt.y=B[Boffset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];Boffset+=8*N;
Bsub[tidm][tidn]=dt;
dt.x=B[Boffset];
dt.y=B[Boffset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];
Bsub[tidm+16][tidn]=dt;
Boffset+=8*N;


// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_M)EOB";

std::string SGEMM_SOURCE1 = R"EOB(EM_FENCE);

// Loop over the values of a single tile
for (int k = 0; k < TSK; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];
// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8 + 0] += Areg.y * Breg[0].x;
acc[8 + 1] += Areg.y * Breg[0].y;
acc[8 + 2] += Areg.y * Breg[0].z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;

Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}

// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

/////////////////////////////////////////////////////////
int km = K % 16;
int maxAidx = M * K - 1;
int maxBidx = N * K - 1;

int BoffsetDmy=min(Boffset, maxBidx);
Areg.x = A[Aoffset]; Aoffset += 16 * K;
Breg[0].x = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 16, maxBidx);
Areg.y = A[Aoffset]; Aoffset += 16 * K;
Breg[0].y = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 32, maxBidx);
Areg.z = A[Aoffset]; Aoffset += 16 * K;
Breg[0].z = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 48, maxBidx);
Areg.w = A[Aoffset]; Aoffset += 16 * K;
Breg[0].w = B[BoffsetDmy]; Boffset = min(Boffset + 8 * N, maxBidx);

Asub[tidm][tidn]=Areg;
Bsub[tidm][tidn]=Breg[0];

Areg.x = A[Aoffset]; Aoffset += 16 * K;
Breg[0].x = B[Boffset]; BoffsetDmy = min(Boffset + 16, maxBidx);
Areg.y = A[Aoffset]; Aoffset += 16 * K;
Breg[0].y = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 32, maxBidx);
Areg.z = A[Aoffset]; Aoffset = min(Aoffset + 16 * K, maxAidx);
Breg[0].z = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 48, maxBidx);
Areg.w = A[Aoffset];
Breg[0].w = B[BoffsetDmy];

Asub[tidm+16][tidn]=Areg;
Bsub[tidm+16][tidn]=Breg[0];
barrier(CLK_LOCAL_MEM_FENCE);


for (int k = 0; k < km; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];
// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] +)EOB";

std::string SGEMM_SOURCE2 = R"EOB(g.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}

// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

/////////////////////////////////////////////////////////
int km = K % 16;
int maxAidx = M * K - 1;
int maxBidx = N * K - 1;

int BoffsetDmy=min(Boffset, maxBidx);
Areg.x = A[Aoffset]; Aoffset += 16 * K;
Breg[0].x = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 16, maxBidx);
Areg.y = A[Aoffset]; Aoffset += 16 * K;
Breg[0].y = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 32, maxBidx);
Areg.z = A[Aoffset]; Aoffset += 16 * K;
Breg[0].z = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 48, maxBidx);
Areg.w = A[Aoffset]; Aoffset += 16 * K;
Breg[0].w = B[BoffsetDmy]; Boffset = min(Boffset + 8 * N, maxBidx);

Asub[tidm][tidn]=Areg;
Bsub[tidm][tidn]=Breg[0];

Areg.x = A[Aoffset]; Aoffset += 16 * K;
Breg[0].x = B[Boffset]; BoffsetDmy = min(Boffset + 16, maxBidx);
Areg.y = A[Aoffset]; Aoffset += 16 * K;
Breg[0].y = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 32, maxBidx);
Areg.z = A[Aoffset]; Aoffset = min(Aoffset + 16 * K, maxAidx);
Breg[0].z = B[BoffsetDmy]; BoffsetDmy = min(Boffset + 48, maxBidx);
Areg.w = A[Aoffset];
Breg[0].w = B[BoffsetDmy];

Asub[tidm+16][tidn]=Areg;
Bsub[tidm+16][tidn]=Breg[0];
barrier(CLK_LOCAL_MEM_FENCE);


for (int k = 0; k < km; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];
// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8 + 0] += Areg.y * Breg[0].x;
acc[8 + 1] += Areg.y * Breg[0].y;
acc[8 + 2] += Areg.y * Breg[0].z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;

Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}
////////////////////////////////////////////////////////

// Store the final results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}


//[numthreads(16, 16, 1)]
//C=A*B  only k%16==0 n>=128 m>=128
__kernel void SGEMM_k(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN*blockIdxx+tidn; // Work-group offset
int offsetM = TSM*blockIdxy+tidm; // Work-group offset
if (blockIdxy==M/128) offsetM-=128-M%128;
if (blockIdxx==N/128) offsetN-=128-N%128;
int Boffset=tidm/2*N+(tidm%2)*64+offsetN;
int Aoffset=tidn+offsetM*K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN*WPTM];

// Initialise the accumulation registers
for (int wn=0; wn<WPTN; wn++) {
for (int wm=0; wm<WPTM; wm++) {
acc[wn*8+wm] = 0.0f;
}
}

// Loop over all tiles
int numTiles = K/TSK;
int tid = tidm*16 + tidn;
for (int t=0; t<numTiles; t++) {
// Load one tile of A and B into local memory
float4 dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset+=16*K;
Asub[tidm][tidn]=dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset-=112*K-16;
Asub[tidm+16][tidn]=dt;

dt.x=B[Boffset];
dt.y=B[Boffset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];Boffset+=8*N;
Bsub[tidm][tidn]=dt;
dt.x=B[Boffset];
dt.y=B[B)EOB";

std::string SGEMM_SOURCE3 = R"EOB(= Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8 + 0] += Areg.y * Breg[0].x;
acc[8 + 1] += Areg.y * Breg[0].y;
acc[8 + 2] += Areg.y * Breg[0].z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;

Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}
////////////////////////////////////////////////////////

// Store the final results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}


//[numthreads(16, 16, 1)]
//C=A*B  only k%16==0 n>=128 m>=128
__kernel void SGEMM_k(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN*blockIdxx+tidn; // Work-group offset
int offsetM = TSM*blockIdxy+tidm; // Work-group offset
if (blockIdxy==M/128) offsetM-=128-M%128;
if (blockIdxx==N/128) offsetN-=128-N%128;
int Boffset=tidm/2*N+(tidm%2)*64+offsetN;
int Aoffset=tidn+offsetM*K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN*WPTM];

// Initialise the accumulation registers
for (int wn=0; wn<WPTN; wn++) {
for (int wm=0; wm<WPTM; wm++) {
acc[wn*8+wm] = 0.0f;
}
}

// Loop over all tiles
int numTiles = K/TSK;
int tid = tidm*16 + tidn;
for (int t=0; t<numTiles; t++) {
// Load one tile of A and B into local memory
float4 dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset+=16*K;
Asub[tidm][tidn]=dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset-=112*K-16;
Asub[tidm+16][tidn]=dt;

dt.x=B[Boffset];
dt.y=B[Boffset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];Boffset+=8*N;
Bsub[tidm][tidn]=dt;
dt.x=B[Boffset];
dt.y=B[Boffset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];
Bsub[tidm+16][tidn]=dt;
Boffset+=8*N;

// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_MEM_FENCE);

int tidnk=tidn;
//int tidmk=tidm*16;
// Loop over the values of a single tile
for (int k=0; k<TSK; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];
// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8+0] += Areg.y * Breg[0].x;
acc[8+1] += Areg.y * Breg[0].y;
acc[8+2] += Areg.y * Breg[0].z;
acc[8+3] += Areg.y * Breg[0].w;
acc[8+4] += Areg.y * Breg[1].x;
acc[8+5] += Areg.y * Breg[1].y;
acc[8+6] += Areg.y * Breg[1].z;
acc[8+7] += Areg.y * Breg[1].w;

acc[16+0] += Areg.z * Breg[0].x;
acc[16+1] += Areg.z * Breg[0].y;
acc[16+2] += Areg.z * Breg[0].z;
acc[16+3] += Areg.z * Breg[0].w;
acc[16+4] += Areg.z * Breg[1].x;
acc[16+5] += Areg.z * Breg[1].y;
acc[16+6] += Areg.z * Breg[1].z;
acc[16+7] += Areg.z * Breg[1].w;

acc[24+0] += Areg.w * Breg[0].x;
acc[24+1] += Areg.w * Breg[0].y;
acc[24+2] += Areg.w * Breg[0].z;
acc[24+3] += Areg.w * Breg[0].w;
acc[24+4] += Areg.w * Breg[1].x;
acc[24+5] += Areg.w * Breg[1].y;
acc[24+6] += Areg.w * Breg[1].z;
acc[24+7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32+0] += Areg.x * Breg[0].x;
acc[32+1] += Areg.x * Breg[0].y;
acc[32+2] += Areg.x * Breg[0].z;
acc[32+3] += Areg.x * Breg[0].w;
acc[32+4] += Areg.x * Breg[1].x;
acc[32+5] += Areg.x * Breg[1].y;
acc[32+6] += Areg.x * Breg[1].z;
acc[32+7] += Areg.x * Breg[1].w;

acc[40+0] += Areg.y * Breg[0].x;
acc[40+1] += Areg.y * Breg[0].y;
acc[40+2] += Areg.y * Breg[0].z;
acc[40+3] += Areg.y * Breg[0].w;
acc[40+4] += Areg.y * Breg[1].x;
acc[40+5] += Areg.y * Breg[1].y;
acc[40+6] += Areg.y * Breg[1].z;
acc[40+7] += Areg.y * Breg[1].w;

acc[48+0] += Areg.z * Breg[0].x;
acc[48+1] += Areg.z * Breg[0].y;
acc[48+2] += Areg.z * Breg[0].z;
acc[48+3] += Areg.z * Breg[0].w;
acc[48+4] += Areg.z * Breg[1].x;
acc[48+5] += Areg.z * Breg[1].y;
acc[48+6] += Areg.z * Breg[1].z;
acc[48+7] += Areg.z * Breg[1].w;

acc[56+0] += Areg.w * Breg[0].x;
acc[56+1] += Areg.w * Breg[0].y;
acc[56+2] += Areg.w * Breg[0].z;
acc[56+3] += Areg.w * Breg[0].w;
acc[56+4] += Areg.w * Breg[1].x;
acc[56+5] += Areg.w * Breg[1].y;
acc[56+6] += Areg.w * Breg[1].z;
acc[56+7] += Areg.w * Breg[1].w;
}
// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn=0; wn<8; wn++) {
int globalCol = offsetN + wn*RTSN;
for (int wm=0; wm<8; wm++) {
int globalRow = offsetM + wm*RTSM;
C[globalRow*N + globalCol] = acc[wm*8+wn];
}
}
}

//[numthreads(16, 16, 1)]
//C=A*B  only n<128 or m<128
__kernel void SGEMM_small(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN * blockIdxx + tidn; // Work-group offset
int offsetM = TSM * blockIdxy + tidm; // Work-group offset
int Boffset = tidm / 2 * N + (tidm % 2) * 64 + offsetN;
int Aoffset = tidn + offsetM * K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN * WPTM];

// Initialise the accumulation registers
for (int wn = 0; wn < WPTN; wn++) {
for (int wm = 0; wm < WPTM; wm++) {
acc[wn * 8 + wm] = 0.0f;
}
}

// Loop over all tiles
int maxAidx = M * K - 1;
int maxBidx = N * K - 1;
int nowAoffset = min(Aoffset, maxAidx);
int nowBoffset = min(Boffset, maxBidx);
for (int t = 0; t < K; t += 16) {
// Load on)EOB";

std::string SGEMM_SOURCE4 = R"EOB([1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}
////////////////////////////////////////////////////////

// Store the final results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}


//[numthreads(16, 16, 1)]
//C=A*B  only k%16==0 n>=128 m>=128
__kernel void SGEMM_k(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN*blockIdxx+tidn; // Work-group offset
int offsetM = TSM*blockIdxy+tidm; // Work-group offset
if (blockIdxy==M/128) offsetM-=128-M%128;
if (blockIdxx==N/128) offsetN-=128-N%128;
int Boffset=tidm/2*N+(tidm%2)*64+offsetN;
int Aoffset=tidn+offsetM*K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN*WPTM];

// Initialise the accumulation registers
for (int wn=0; wn<WPTN; wn++) {
for (int wm=0; wm<WPTM; wm++) {
acc[wn*8+wm] = 0.0f;
}
}

// Loop over all tiles
int numTiles = K/TSK;
int tid = tidm*16 + tidn;
for (int t=0; t<numTiles; t++) {
// Load one tile of A and B into local memory
float4 dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset+=16*K;
Asub[tidm][tidn]=dt;
dt.x=A[Aoffset];Aoffset+=16*K;
dt.y=A[Aoffset];Aoffset+=16*K;
dt.z=A[Aoffset];Aoffset+=16*K;
dt.w=A[Aoffset];Aoffset-=112*K-16;
Asub[tidm+16][tidn]=dt;

dt.x=B[Boffset];
dt.y=B[Boffset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];Boffset+=8*N;
Bsub[tidm][tidn]=dt;
dt.x=B[Boffset];
dt.y=B[Boffset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];
Bsub[tidm+16][tidn]=dt;
Boffset+=8*N;

// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_MEM_FENCE);

int tidnk=tidn;
//int tidmk=tidm*16;
// Loop over the values of a single tile
for (int k=0; k<TSK; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];
// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8+0] += Areg.y * Breg[0].x;
acc[8+1] += Areg.y * Breg[0].y;
acc[8+2] += Areg.y * Breg[0].z;
acc[8+3] += Areg.y * Breg[0].w;
acc[8+4] += Areg.y * Breg[1].x;
acc[8+5] += Areg.y * Breg[1].y;
acc[8+6] += Areg.y * Breg[1].z;
acc[8+7] += Areg.y * Breg[1].w;

acc[16+0] += Areg.z * Breg[0].x;
acc[16+1] += Areg.z * Breg[0].y;
acc[16+2] += Areg.z * Breg[0].z;
acc[16+3] += Areg.z * Breg[0].w;
acc[16+4] += Areg.z * Breg[1].x;
acc[16+5] += Areg.z * Breg[1].y;
acc[16+6] += Areg.z * Breg[1].z;
acc[16+7] += Areg.z * Breg[1].w;

acc[24+0] += Areg.w * Breg[0].x;
acc[24+1] += Areg.w * Breg[0].y;
acc[24+2] += Areg.w * Breg[0].z;
acc[24+3] += Areg.w * Breg[0].w;
acc[24+4] += Areg.w * Breg[1].x;
acc[24+5] += Areg.w * Breg[1].y;
acc[24+6] += Areg.w * Breg[1].z;
acc[24+7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32+0] += Areg.x * Breg[0].x;
acc[32+1] += Areg.x * Breg[0].y;
acc[32+2] += Areg.x * Breg[0].z;
acc[32+3] += Areg.x * Breg[0].w;
acc[32+4] += Areg.x * Breg[1].x;
acc[32+5] += Areg.x * Breg[1].y;
acc[32+6] += Areg.x * Breg[1].z;
acc[32+7] += Areg.x * Breg[1].w;

acc[40+0] += Areg.y * Breg[0].x;
acc[40+1] += Areg.y * Breg[0].y;
acc[40+2] += Areg.y * Breg[0].z;
acc[40+3] += Areg.y * Breg[0].w;
acc[40+4] += Areg.y * Breg[1].x;
acc[40+5] += Areg.y * Breg[1].y;
acc[40+6] += Areg.y * Breg[1].z;
acc[40+7] += Areg.y * Breg[1].w;

acc[48+0] += Areg.z * Breg[0].x;
acc[48+1] += Areg.z * Breg[0].y;
acc[48+2] += Areg.z * Breg[0].z;
acc[48+3] += Areg.z * Breg[0].w;
acc[48+4] += Areg.z * Breg[1].x;
acc[48+5] += Areg.z * Breg[1].y;
acc[48+6] += Areg.z * Breg[1].z;
acc[48+7] += Areg.z * Breg[1].w;

acc[56+0] += Areg.w * Breg[0].x;
acc[56+1] += Areg.w * Breg[0].y;
acc[56+2] += Areg.w * Breg[0].z;
acc[56+3] += Areg.w * Breg[0].w;
acc[56+4] += Areg.w * Breg[1].x;
acc[56+5] += Areg.w * Breg[1].y;
acc[56+6] += Areg.w * Breg[1].z;
acc[56+7] += Areg.w * Breg[1].w;
}
// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn=0; wn<8; wn++) {
int globalCol = offsetN + wn*RTSN;
for (int wm=0; wm<8; wm++) {
int globalRow = offsetM + wm*RTSM;
C[globalRow*N + globalCol] = acc[wm*8+wn];
}
}
}

//[numthreads(16, 16, 1)]
//C=A*B  only n<128 or m<128
__kernel void SGEMM_small(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN * blockIdxx + tidn; // Work-group offset
int offsetM = TSM * blockIdxy + tidm; // Work-group offset
int Boffset = tidm / 2 * N + (tidm % 2) * 64 + offsetN;
int Aoffset = tidn + offsetM * K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN * WPTM];

// Initialise the accumulation registers
for (int wn = 0; wn < WPTN; wn++) {
for (int wm = 0; wm < WPTM; wm++) {
acc[wn * 8 + wm] = 0.0f;
}
}

// Loop over all tiles
int maxAidx = M * K - 1;
int maxBidx = N * K - 1;
int nowAoffset = min(Aoffset, maxAidx);
int nowBoffset = min(Boffset, maxBidx);
for (int t = 0; t < K; t += 16) {
// Load one tile of A and B into local memory
//AB load software pipelining
float4 Areg;
float4 Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 16 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 32 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 48 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; nowAoffset = min(Aoffset + 64 * K, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm][tidn] = Areg;
Bsub[tidm][tidn] = Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 80 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 96 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 112 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; Aoffset += 16; nowAoffset = min(Aoffset, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm+16][tidn] = Areg;
Bsub[tidm+16][tidn] = Breg[0];
// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_MEM_FENCE);

// Loop over the values of a single tile
int kmin = min(K - t, 16);
for (int k = 0; k < kmin; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];

// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8 + 0] += Areg.y * Breg[0].x;
acc[8 + 1] += Areg.y * Breg[0].y;
acc[8 + 2] += Areg.y * Breg[0].z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}

// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the f)EOB";

std::string SGEMM_SOURCE5 = R"EOB(offset+16];
dt.z=B[Boffset+32];
dt.w=B[Boffset+48];
Bsub[tidm+16][tidn]=dt;
Boffset+=8*N;

// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_MEM_FENCE);

int tidnk=tidn;
//int tidmk=tidm*16;
// Loop over the values of a single tile
for (int k=0; k<TSK; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];
// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8+0] += Areg.y * Breg[0].x;
acc[8+1] += Areg.y * Breg[0].y;
acc[8+2] += Areg.y * Breg[0].z;
acc[8+3] += Areg.y * Breg[0].w;
acc[8+4] += Areg.y * Breg[1].x;
acc[8+5] += Areg.y * Breg[1].y;
acc[8+6] += Areg.y * Breg[1].z;
acc[8+7] += Areg.y * Breg[1].w;

acc[16+0] += Areg.z * Breg[0].x;
acc[16+1] += Areg.z * Breg[0].y;
acc[16+2] += Areg.z * Breg[0].z;
acc[16+3] += Areg.z * Breg[0].w;
acc[16+4] += Areg.z * Breg[1].x;
acc[16+5] += Areg.z * Breg[1].y;
acc[16+6] += Areg.z * Breg[1].z;
acc[16+7] += Areg.z * Breg[1].w;

acc[24+0] += Areg.w * Breg[0].x;
acc[24+1] += Areg.w * Breg[0].y;
acc[24+2] += Areg.w * Breg[0].z;
acc[24+3] += Areg.w * Breg[0].w;
acc[24+4] += Areg.w * Breg[1].x;
acc[24+5] += Areg.w * Breg[1].y;
acc[24+6] += Areg.w * Breg[1].z;
acc[24+7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32+0] += Areg.x * Breg[0].x;
acc[32+1] += Areg.x * Breg[0].y;
acc[32+2] += Areg.x * Breg[0].z;
acc[32+3] += Areg.x * Breg[0].w;
acc[32+4] += Areg.x * Breg[1].x;
acc[32+5] += Areg.x * Breg[1].y;
acc[32+6] += Areg.x * Breg[1].z;
acc[32+7] += Areg.x * Breg[1].w;

acc[40+0] += Areg.y * Breg[0].x;
acc[40+1] += Areg.y * Breg[0].y;
acc[40+2] += Areg.y * Breg[0].z;
acc[40+3] += Areg.y * Breg[0].w;
acc[40+4] += Areg.y * Breg[1].x;
acc[40+5] += Areg.y * Breg[1].y;
acc[40+6] += Areg.y * Breg[1].z;
acc[40+7] += Areg.y * Breg[1].w;

acc[48+0] += Areg.z * Breg[0].x;
acc[48+1] += Areg.z * Breg[0].y;
acc[48+2] += Areg.z * Breg[0].z;
acc[48+3] += Areg.z * Breg[0].w;
acc[48+4] += Areg.z * Breg[1].x;
acc[48+5] += Areg.z * Breg[1].y;
acc[48+6] += Areg.z * Breg[1].z;
acc[48+7] += Areg.z * Breg[1].w;

acc[56+0] += Areg.w * Breg[0].x;
acc[56+1] += Areg.w * Breg[0].y;
acc[56+2] += Areg.w * Breg[0].z;
acc[56+3] += Areg.w * Breg[0].w;
acc[56+4] += Areg.w * Breg[1].x;
acc[56+5] += Areg.w * Breg[1].y;
acc[56+6] += Areg.w * Breg[1].z;
acc[56+7] += Areg.w * Breg[1].w;
}
// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn=0; wn<8; wn++) {
int globalCol = offsetN + wn*RTSN;
for (int wm=0; wm<8; wm++) {
int globalRow = offsetM + wm*RTSM;
C[globalRow*N + globalCol] = acc[wm*8+wn];
}
}
}

//[numthreads(16, 16, 1)]
//C=A*B  only n<128 or m<128
__kernel void SGEMM_small(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN * blockIdxx + tidn; // Work-group offset
int offsetM = TSM * blockIdxy + tidm; // Work-group offset
int Boffset = tidm / 2 * N + (tidm % 2) * 64 + offsetN;
int Aoffset = tidn + offsetM * K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN * WPTM];

// Initialise the accumulation registers
for (int wn = 0; wn < WPTN; wn++) {
for (int wm = 0; wm < WPTM; wm++) {
acc[wn * 8 + wm] = 0.0f;
}
}

// Loop over all tiles
int maxAidx = M * K - 1;
int maxBidx = N * K - 1;
int nowAoffset = min(Aoffset, maxAidx);
int nowBoffset = min(Boffset, maxBidx);
for (int t = 0; t < K; t += 16) {
// Load one tile of A and B into local memory
//AB load software pipelining
float4 Areg;
float4 Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 16 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 32 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 48 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; nowAoffset = min(Aoffset + 64 * K, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm][tidn] = Areg;
Bsub[tidm][tidn] = Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 80 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 96 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 112 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; Aoffset += 16; nowAoffset = min(Aoffset, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm+16][tidn] = Areg;
Bsub[tidm+16][tidn] = Breg[0];
// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_MEM_FENCE);

// Loop over the values of a single tile
int kmin = min(K - t, 16);
for (int k = 0; k < kmin; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];

// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8 + 0] += Areg.y * Breg[0].x;
acc[8 + 1] += Areg.y * Breg[0].y;
acc[8 + 2] += Areg.y * Breg[0].z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}

// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
if (globalCol >= N) break;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
if (globalRow >= M) break;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}

//[numthreads(16, 16, 1)]
//A=A.T (not bank conflict and no padding)
//1<=N<65536~,1<=M<65536~
__kernel void Trans(int M,int N,__global float* A,__global float* AT)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);

int tidn = threadIdxx;
int tidm = threadIdxy;
int tidoffset = (tidn + tidm) % 16;
int offsetN = 16 * blockIdxx + tidn;
int offsetM = 16 * blockIdxy + tidm;
offsetN = min(offsetN, N - 1);
offsetM = min(offsetM, M - 1);
int woffsetN = 16 * blockIdxx + tidm;
int woffsetM = 16 * blockIdxy + tidn;
woffsetN = min(woffsetN, N - 1);
woffsetM = min(woffsetM, M - 1);

__local float sub[256];
// load Global to Local
//Asub[tidn+tidm*16]=A[offsetN+offsetM*N];
sub[tidoffset + tidm * 16] = A[offsetN + offsetM * N];
barrier(CLK_LOCAL_MEM_FENCE);
// Store to AT
//AT[woffsetN*M+woffsetM]=Asub[tidm+tidn*16];
AT[woffsetN * M + woffsetM] = sub[tidoffset + tidn * 16];
}
)EOB";

std::string SGEMM_SOURCE6 = R"EOB(0+7] += Areg.y * Breg[1].w;

acc[48+0] += Areg.z * Breg[0].x;
acc[48+1] += Areg.z * Breg[0].y;
acc[48+2] += Areg.z * Breg[0].z;
acc[48+3] += Areg.z * Breg[0].w;
acc[48+4] += Areg.z * Breg[1].x;
acc[48+5] += Areg.z * Breg[1].y;
acc[48+6] += Areg.z * Breg[1].z;
acc[48+7] += Areg.z * Breg[1].w;

acc[56+0] += Areg.w * Breg[0].x;
acc[56+1] += Areg.w * Breg[0].y;
acc[56+2] += Areg.w * Breg[0].z;
acc[56+3] += Areg.w * Breg[0].w;
acc[56+4] += Areg.w * Breg[1].x;
acc[56+5] += Areg.w * Breg[1].y;
acc[56+6] += Areg.w * Breg[1].z;
acc[56+7] += Areg.w * Breg[1].w;
}
// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn=0; wn<8; wn++) {
int globalCol = offsetN + wn*RTSN;
for (int wm=0; wm<8; wm++) {
int globalRow = offsetM + wm*RTSM;
C[globalRow*N + globalCol] = acc[wm*8+wn];
}
}
}

//[numthreads(16, 16, 1)]
//C=A*B  only n<128 or m<128
__kernel void SGEMM_small(int M,int N,int K,__global float* A,__global float* B,__global float* C)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);
int tidn = threadIdxx; // Local row ID (max: TSN/WPTN)
int tidm = threadIdxy; // Local col ID (max: TSM/WPTM)
int offsetN = TSN * blockIdxx + tidn; // Work-group offset
int offsetM = TSM * blockIdxy + tidm; // Work-group offset
int Boffset = tidm / 2 * N + (tidm % 2) * 64 + offsetN;
int Aoffset = tidn + offsetM * K;

// Local memory to fit a tile of A and B
__local float4 Asub[TSN/4][TSK];
__local float4 Bsub[TSM/4][TSK];

// Allocate register space
float4 Areg;
float4 Breg[2];
float acc[WPTN * WPTM];

// Initialise the accumulation registers
for (int wn = 0; wn < WPTN; wn++) {
for (int wm = 0; wm < WPTM; wm++) {
acc[wn * 8 + wm] = 0.0f;
}
}

// Loop over all tiles
int maxAidx = M * K - 1;
int maxBidx = N * K - 1;
int nowAoffset = min(Aoffset, maxAidx);
int nowBoffset = min(Boffset, maxBidx);
for (int t = 0; t < K; t += 16) {
// Load one tile of A and B into local memory
//AB load software pipelining
float4 Areg;
float4 Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 16 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 32 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 48 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; nowAoffset = min(Aoffset + 64 * K, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm][tidn] = Areg;
Bsub[tidm][tidn] = Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 80 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 96 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 112 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; Aoffset += 16; nowAoffset = min(Aoffset, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm+16][tidn] = Areg;
Bsub[tidm+16][tidn] = Breg[0];
// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_MEM_FENCE);

// Loop over the values of a single tile
int kmin = min(K - t, 16);
for (int k = 0; k < kmin; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];

// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8 + 0] += Areg.y * Breg[0].x;
acc[8 + 1] += Areg.y * Breg[0].y;
acc[8 + 2] += Areg.y * Breg[0].z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}

// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
if (globalCol >= N) break;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
if (globalRow >= M) break;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}

//[numthreads(16, 16, 1)]
//A=A.T (not bank conflict and no padding)
//1<=N<65536~,1<=M<65536~
__kernel void Trans(int M,int N,__global float* A,__global float* AT)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);

int tidn = threadIdxx;
int tidm = threadIdxy;
int tidoffset = (tidn + tidm) % 16;
int offsetN = 16 * blockIdxx + tidn;
int offsetM = 16 * blockIdxy + tidm;
offsetN = min(offsetN, N - 1);
offsetM = min(offsetM, M - 1);
int woffsetN = 16 * blockIdxx + tidm;
int woffsetM = 16 * blockIdxy + tidn;
woffsetN = min(woffsetN, N - 1);
woffsetM = min(woffsetM, M - 1);

__local float sub[256];
// load Global to Local
//Asub[tidn+tidm*16]=A[offsetN+offsetM*N];
sub[tidoffset + tidm * 16] = A[offsetN + offsetM * N];
barrier(CLK_LOCAL_MEM_FENCE);
// Store to AT
//AT[woffsetN*M+woffsetM]=Asub[tidm+tidn*16];
AT[woffsetN * M + woffsetM] = sub[tidoffset + tidn * 16];
}
)EOB";

std::string SGEMM_SOURCE7 = R"EOB(e tile of A and B into local memory
//AB load software pipelining
float4 Areg;
float4 Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 16 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 32 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 48 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; nowAoffset = min(Aoffset + 64 * K, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm][tidn] = Areg;
Bsub[tidm][tidn] = Breg[0];
Areg.x = A[nowAoffset]; nowAoffset = min(Aoffset + 80 * K, maxAidx);
Breg[0].x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
Areg.y = A[nowAoffset]; nowAoffset = min(Aoffset + 96 * K, maxAidx);
Breg[0].y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
Areg.z = A[nowAoffset]; nowAoffset = min(Aoffset + 112 * K, maxAidx);
Breg[0].z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
Areg.w = A[nowAoffset]; Aoffset += 16; nowAoffset = min(Aoffset, maxAidx);
Breg[0].w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
Asub[tidm+16][tidn] = Areg;
Bsub[tidm+16][tidn] = Breg[0];
// Synchronise to make sure the tile is loaded
barrier(CLK_LOCAL_MEM_FENCE);

// Loop over the values of a single tile
int kmin = min(K - t, 16);
for (int k = 0; k < kmin; k++) {
// Cache the values of Bsub in registers
Breg[0] = Bsub[k*2][tidn];
Areg = Asub[tidm][k];
Breg[1] = Bsub[k*2+1][tidn];

// Perform the computation
acc[0] += Areg.x * Breg[0].x;
acc[1] += Areg.x * Breg[0].y;
acc[2] += Areg.x * Breg[0].z;
acc[3] += Areg.x * Breg[0].w;
acc[4] += Areg.x * Breg[1].x;
acc[5] += Areg.x * Breg[1].y;
acc[6] += Areg.x * Breg[1].z;
acc[7] += Areg.x * Breg[1].w;

acc[8 + 0] += Areg.y * Breg[0].x;
acc[8 + 1] += Areg.y * Breg[0].y;
acc[8 + 2] += Areg.y * Breg[0].z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}

// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
if (globalCol >= N) break;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
if (globalRow >= M) break;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}

//[numthreads(16, 16, 1)]
//A=A.T (not bank conflict and no padding)
//1<=N<65536~,1<=M<65536~
__kernel void Trans(int M,int N,__global float* A,__global float* AT)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);

int tidn = threadIdxx;
int tidm = threadIdxy;
int tidoffset = (tidn + tidm) % 16;
int offsetN = 16 * blockIdxx + tidn;
int offsetM = 16 * blockIdxy + tidm;
offsetN = min(offsetN, N - 1);
offsetM = min(offsetM, M - 1);
int woffsetN = 16 * blockIdxx + tidm;
int woffsetM = 16 * blockIdxy + tidn;
woffsetN = min(woffsetN, N - 1);
woffsetM = min(woffsetM, M - 1);

__local float sub[256];
// load Global to Local
//Asub[tidn+tidm*16]=A[offsetN+offsetM*N];
sub[tidoffset + tidm * 16] = A[offsetN + offsetM * N];
barrier(CLK_LOCAL_MEM_FENCE);
// Store to AT
//AT[woffsetN*M+woffsetM]=Asub[tidm+tidn*16];
AT[woffsetN * M + woffsetM] = sub[tidoffset + tidn * 16];
}
)EOB";

std::string SGEMM_SOURCE8 = R"EOB(.z;
acc[8 + 3] += Areg.y * Breg[0].w;
acc[8 + 4] += Areg.y * Breg[1].x;
acc[8 + 5] += Areg.y * Breg[1].y;
acc[8 + 6] += Areg.y * Breg[1].z;
acc[8 + 7] += Areg.y * Breg[1].w;

acc[16 + 0] += Areg.z * Breg[0].x;
acc[16 + 1] += Areg.z * Breg[0].y;
acc[16 + 2] += Areg.z * Breg[0].z;
acc[16 + 3] += Areg.z * Breg[0].w;
acc[16 + 4] += Areg.z * Breg[1].x;
acc[16 + 5] += Areg.z * Breg[1].y;
acc[16 + 6] += Areg.z * Breg[1].z;
acc[16 + 7] += Areg.z * Breg[1].w;

acc[24 + 0] += Areg.w * Breg[0].x;
acc[24 + 1] += Areg.w * Breg[0].y;
acc[24 + 2] += Areg.w * Breg[0].z;
acc[24 + 3] += Areg.w * Breg[0].w;
acc[24 + 4] += Areg.w * Breg[1].x;
acc[24 + 5] += Areg.w * Breg[1].y;
acc[24 + 6] += Areg.w * Breg[1].z;
acc[24 + 7] += Areg.w * Breg[1].w;


Areg = Asub[tidm+16][k];
acc[32 + 0] += Areg.x * Breg[0].x;
acc[32 + 1] += Areg.x * Breg[0].y;
acc[32 + 2] += Areg.x * Breg[0].z;
acc[32 + 3] += Areg.x * Breg[0].w;
acc[32 + 4] += Areg.x * Breg[1].x;
acc[32 + 5] += Areg.x * Breg[1].y;
acc[32 + 6] += Areg.x * Breg[1].z;
acc[32 + 7] += Areg.x * Breg[1].w;

acc[40 + 0] += Areg.y * Breg[0].x;
acc[40 + 1] += Areg.y * Breg[0].y;
acc[40 + 2] += Areg.y * Breg[0].z;
acc[40 + 3] += Areg.y * Breg[0].w;
acc[40 + 4] += Areg.y * Breg[1].x;
acc[40 + 5] += Areg.y * Breg[1].y;
acc[40 + 6] += Areg.y * Breg[1].z;
acc[40 + 7] += Areg.y * Breg[1].w;

acc[48 + 0] += Areg.z * Breg[0].x;
acc[48 + 1] += Areg.z * Breg[0].y;
acc[48 + 2] += Areg.z * Breg[0].z;
acc[48 + 3] += Areg.z * Breg[0].w;
acc[48 + 4] += Areg.z * Breg[1].x;
acc[48 + 5] += Areg.z * Breg[1].y;
acc[48 + 6] += Areg.z * Breg[1].z;
acc[48 + 7] += Areg.z * Breg[1].w;

acc[56 + 0] += Areg.w * Breg[0].x;
acc[56 + 1] += Areg.w * Breg[0].y;
acc[56 + 2] += Areg.w * Breg[0].z;
acc[56 + 3] += Areg.w * Breg[0].w;
acc[56 + 4] += Areg.w * Breg[1].x;
acc[56 + 5] += Areg.w * Breg[1].y;
acc[56 + 6] += Areg.w * Breg[1].z;
acc[56 + 7] += Areg.w * Breg[1].w;
}

// Synchronise before loading the next tile
barrier(CLK_LOCAL_MEM_FENCE);
}

// Store the final results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
if (globalCol >= N) break;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
if (globalRow >= M) break;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}

//[numthreads(16, 16, 1)]
//A=A.T (not bank conflict and no padding)
//1<=N<65536~,1<=M<65536~
__kernel void Trans(int M,int N,__global float* A,__global float* AT)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);

int tidn = threadIdxx;
int tidm = threadIdxy;
int tidoffset = (tidn + tidm) % 16;
int offsetN = 16 * blockIdxx + tidn;
int offsetM = 16 * blockIdxy + tidm;
offsetN = min(offsetN, N - 1);
offsetM = min(offsetM, M - 1);
int woffsetN = 16 * blockIdxx + tidm;
int woffsetM = 16 * blockIdxy + tidn;
woffsetN = min(woffsetN, N - 1);
woffsetM = min(woffsetM, M - 1);

__local float sub[256];
// load Global to Local
//Asub[tidn+tidm*16]=A[offsetN+offsetM*N];
sub[tidoffset + tidm * 16] = A[offsetN + offsetM * N];
barrier(CLK_LOCAL_MEM_FENCE);
// Store to AT
//AT[woffsetN*M+woffsetM]=Asub[tidm+tidn*16];
AT[woffsetN * M + woffsetM] = sub[tidoffset + tidn * 16];
}
)EOB";

std::string SGEMM_SOURCE9 = R"EOB(inal results in C
for (int wn = 0; wn < 8; wn++) {
int globalCol = offsetN + wn * RTSN;
if (globalCol >= N) break;
for (int wm = 0; wm < 8; wm++) {
int globalRow = offsetM + wm * RTSM;
if (globalRow >= M) break;
C[globalRow * N + globalCol] = acc[wm * 8 + wn];
}
}
}

//[numthreads(16, 16, 1)]
//A=A.T (not bank conflict and no padding)
//1<=N<65536~,1<=M<65536~
__kernel void Trans(int M,int N,__global float* A,__global float* AT)
{
int threadIdxx=get_local_id(0);
int threadIdxy=get_local_id(1);
int blockIdxx=get_group_id(0);
int blockIdxy=get_group_id(1);

int tidn = threadIdxx;
int tidm = threadIdxy;
int tidoffset = (tidn + tidm) % 16;
int offsetN = 16 * blockIdxx + tidn;
int offsetM = 16 * blockIdxy + tidm;
offsetN = min(offsetN, N - 1);
offsetM = min(offsetM, M - 1);
int woffsetN = 16 * blockIdxx + tidm;
int woffsetM = 16 * blockIdxy + tidn;
woffsetN = min(woffsetN, N - 1);
woffsetM = min(woffsetM, M - 1);

__local float sub[256];
// load Global to Local
//Asub[tidn+tidm*16]=A[offsetN+offsetM*N];
sub[tidoffset + tidm * 16] = A[offsetN + offsetM * N];
barrier(CLK_LOCAL_MEM_FENCE);
// Store to AT
//AT[woffsetN*M+woffsetM]=Asub[tidm+tidn*16];
AT[woffsetN * M + woffsetM] = sub[tidoffset + tidn * 16];
}
)EOB";

