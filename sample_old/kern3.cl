__attribute__((reqd_work_group_size(256, 1, 1)))
__kernel void kernelA(int a){}

__attribute__((reqd_work_group_size(256, 1, 1)))
__kernel void kernelB(int a){}

__attribute__((reqd_work_group_size(1, 1, 1)))
__kernel void kernelLauncher(int a)
{
    queue_t default_queue = get_default_queue();
    //clk_event_t ev1, ev2;
/*
    for (int x = 0; x < iterations; ++x)
    {
        void(^fnKernelA)(void) = ^{ kernelA(
        5 // kernel params come here
            ); };

            enqueue_kernel(default_queue,
                CLK_ENQUEUE_FLAGS_NO_WAIT,
                ndrange_1D(3 * 256, 256),
                0, NULL, &ev1,
                fnKernelA);
        

        void(^fnKernelB)(void) = ^{ kernelB(
        4 // kernel params come here
            ); };

        enqueue_kernel(default_queue,
            CLK_ENQUEUE_FLAGS_NO_WAIT,
            ndrange_1D(256, 256),
            1, &ev1, &ev2,  // ev1 sets dependency on kernelA here
            fnKernelB);
    }
	*/
}