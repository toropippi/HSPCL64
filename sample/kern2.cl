/*
__kernel void vecAdd(__global int* a)
{
    uint gid = get_global_id(0);

    a[gid] += a[gid];
}
*/


kernel void my_func_A(global int *a, global int *b, global int *c,int tid)
{
      int iGID = get_global_id(0) + tid * 32;
      // add the vector elements
      c[iGID] = a[iGID] + b[iGID];
}

__kernel void VectorAdd(__global const int* a, __global const int* b, __global int* c)
{
    int tid = get_global_id(0);
	//void (^my_block_A)(void) = ^{my_func_A(a, b, c);};
	
    //device_queue devQ = get_default_queue();
	ndrange_t ndrange=ndrange_1D(1);
    //ndrange ndrange1(32);
	
    //enqueue_kernel(get_default_queue(),CLK_ENQUEUE_FLAGS_WAIT_KERNEL, ndrange1,{my_func_A(a, b, c,tid);});

/*
    auto myblock = [=](void)->void{
    };
	*/
/*
    auto err_ret = devQ.enqueue_kernel(enqueue_policy::wait_kernel,
                                      ndrange1,
                                      myblock);


*/

}