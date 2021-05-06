#regcmd "_hsp3cmdinit@4","HSPCL32.dll",1
#cmd float $FF

#regcmd "_hsp3cmdinit@4","HSPCL32.dll"
#cmd hspclnewcmd1	$000
#cmd hspclnewcmd2	$001
#cmd hspclnewcmdgdi	$032
#cmd HCLDoKrn1_sub	$033
#cmd hspclnewcmd4	$034
#cmd hspclnewcmd5	$002
#cmd HCLBuildProgram 		$003
#cmd HCLCreateKernel		$004
#cmd HCLSetKernel		$005
#cmd HCLCreateBuffer		$006
#cmd HCLWriteBuffer		$007
#cmd HCLReadBuffer		$008
#cmd HCLCopyBuffer		$009
#cmd HCLDoKernel			$00A
#cmd HCLReleaseKernel		$00B
#cmd HCLReleaseProgram		$00C
#cmd HCLReleaseMemObject		$00D
#cmd fdim			$00E
#cmd HCLSetDev			$00F
#cmd HCLWaitTask			$010
#cmd HCLDoKrn1			$011
#cmd HCLDoKrn2			$012
#cmd HCLDoKrn3			$013
#cmd HCLCreateProgramWithSource		$014
#cmd HGLReadBuffer		$015
#cmd hspclnewcmd23 $016
#cmd HCL_err_mes_MODE	$017
#cmd HCLCreateFromGLBuffer	$018
#cmd HCLCreateFromGLTexture2D	$02D
#cmd HCLEnqueueAcquireGLObjects	$019
#cmd HCLEnqueueReleaseGLObjects	$01A


#cmd HCLReadIndex_d $FE
#cmd HCLReadIndex_i $FD
#cmd HCLReadIndex_f $FC
#cmd HCLReadIndex_s $FB

#cmd HCLWriteIndex_d $035
#cmd HCLWriteIndex_i $036
#cmd HCLWriteIndex_f $037
#cmd HCLWriteIndex_s $038









#cmd glBindBuffer		$01B
#cmd glBufferData		$01C
#cmd glBufferSubData	$02C//int,int,int,sptr
#cmd glDeleteBuffers	$01D
#cmd glGenBuffers		$01E

#cmd glGenRenderbuffers		$01F
#cmd glDeleteRenderbuffers	$020
#cmd glBindRenderbuffer		$021
#cmd glRenderbufferStorage	$022

#cmd glGenVertexArrays		$023
#cmd glDeleteVertexArrays	$024
#cmd glBindVertexArray		$025

#cmd glGenFramebuffers		$026
#cmd glDeleteFramebuffers	$027
#cmd glBindFramebuffer		$028
#cmd glFramebufferTexture2D	$029
#cmd glFramebufferRenderbuffer	$02A
#cmd glGenerateMipmap		$02B
#cmd glDeleteTextures 		$02E

#cmd hspclnewcmdconvRGBtoBGR 		$02F
#cmd hspclnewcmdconvRGBAtoRGB 		$030
#cmd hspclnewcmdconvRGBtoRGBA 		$031

HCLDevCount=0
goto*hspclenf2
onexit *hspclenf3


*hspclenf3
	HCLbye
	end












































#uselib "opengl32.dll"
#func global  glBegin           "glBegin"            int
#func global  glBlendFunc       "glBlendFunc"        int, int
#func global  glBindTexture	    "glBindTexture"	     int,int
#func global  glCallList		"glCallList"		 int
#func global  glClear           "glClear"            int
#func global  glClearColor		"glClearColor"		 float,float,float,float
#func global  glClearDepth		"glClearDepth"		 double
#func global  glColorMask		"glColorMask"		 int,int,int,int
#func global  glColor3d         "glColor3d"          double, double, double
#func global  glColor4d         "glColor4d"          double, double, double, double
#func global  glColor3dv        "glColor3dv"         sptr
#func global  glColor4dv        "glColor4dv"         sptr
#func global  glColor3f         "glColor3f"          float,float,float
#func global  glColor4f         "glColor4f"          float,float,float,float
#func global  glColor3fv        "glColor3fv"         sptr
#func global  glColor4fv        "glColor4fv"         sptr
#func global  glColor3i         "glColor3i"          int,int,int
#func global  glColor4i         "glColor4i"          int,int,int,int
#func global  glColor3iv        "glColor3iv"         sptr
#func global  glColor4iv        "glColor4iv"         sptr
#func global  glCullFace		"glCullFace"		 int
#func global  glDepthFunc       "glDepthFunc"        int
#func global  glDeleteLists	    "glDeleteLists"	     int,int
#func global  glDisable         "glDisable"          int
#func global  glDisableClientState "glDisableClientState" int
#func global  glDrawArrays      "glDrawArrays"       int,int,int
#func global  glDrawElements    "glDrawElements"     int,int,int,sptr
#func global  glEnable          "glEnable"           int
#func global  glEnd             "glEnd"
#func global  glEnableClientState "glEnableClientState" int
#func global  glEndList		    "glEndList"
#func global  glFinish          "glFinish"
#func global  glFogf            "glFogf"             int, float
#func global  glFogi            "glFogi"             int, int
#func global  glFogfv           "glFogfv"            int,sptr
#func global  glFogiv           "glFogiv"            int,sptr
#func global  glFrustum         "glFrustum"          double, double, double, double, double, double
#func global  glGenTextures	    "glGenTextures"	     int,sptr
#func global  glGetTexImage	    "glGetTexImage"	     int,int,int,int,sptr
#func global  glGetIntegerv	    "glGetIntegerv"	     int,sptr
#func global  glGetDoublev		"glGetDoublev"		 int,sptr
#cfunc global glGenLists        "glGenLists"		 int
#func global  glGetTexLevelParameterfv "glGetTexLevelParameterfv" int,int,int,sptr
#func global  glGetTexLevelParameteriv "glGetTexLevelParameteriv" int,int,int,sptr
#func global  glLightfv         "glLightfv"		     int,int,sptr
#func global  glLightf          "glLightf"           int,int,float
#func global  glLighti          "glLighti"           int,int,int
#func global  glLightModelfv    "glLightModelfv"     int,int,int 
#func global  glLineWidth       "glLineWidth"        float
#func global  glLoadIdentity    "glLoadIdentity"
#func global  glLoadMatrixd     "glLoadMatrixd"	     sptr
#func global  glMatrixMode      "glMatrixMode"       int
#func global  glMaterialfv      "glMaterialfv"       int,int,sptr
#func global  glNormal3d        "glNormal3d"		 double,double,double
#func global  glNormal3dv       "glNormal3dv"		 sptr
#func global  glNormal3f        "glNormal3f"		 float,float,float
#func global  glNormal3fv       "glNormal3fv"		 sptr
#func global  glNormal3i        "glNormal3i"		 int,int,int
#func global  glNormal3iv       "glNormal3iv"		 sptr
#func global  glNormalPointer   "glNormalPointer"    int,int,sptr
#func global  glNewList	        "glNewList"	         int,int
#func global  glOrtho           "glOrtho"            double, double, double, double, double, double
#func global  glPixelStorei     "glPixelStorei"      int,int
#func global  glPushMatrix      "glPushMatrix"
#func global  glPopMatrix       "glPopMatrix"
#func global  glPointSize       "glPointSize"        float
#func global  glPolygonOffset   "glPolygonOffset"	 int,int
#func global  glReadBuffer      "glReadBuffer"       int
#func global  glReadPixels		"glReadPixels"		 int,int,int,int,int,int,sptr
#func global  glRotated         "glRotated"          double, double, double, double
#func global  glRotatef         "glRotatef"          float,float,float,float
#func global  glScaled          "glScaled"           double, double, double
#func global  glScalef          "glScalef"           float,float,float
#func global  glShadeModel      "glShadeModel"       int
#func global  glTexCoord2d      "glTexCoord2d"       double,double
#func global  glTexCoord2f      "glTexCoord2f"       float,float
#func global  glTexCoord2i      "glTexCoord2i"       int,int
#func global  glTexCoordPointer "glTexCoordPointer"  int,int,int,sptr
#func global  glTexEnvf         "glTexEnvf"          int,int,float
#func global  glTexEnvi         "glTexEnvi"          int,int,int
#func global  glTexImage2D      "glTexImage2D"       int,int,int,int,int,int,int,int,sptr
#func global  glTexParameterf	"glTexParameterf"	 int,int,float
#func global  glTexParameterfv	"glTexParameterfv"	 int,int,sptr
#func global  glTexParameteri   "glTexParameteri"    int,int,int
#func global  glTexParameteriv  "glTexParameteriv"   int,int,sptr
#func global  glTexSubImage2D	"glTexSubImage2D"	 int,int,int,int,int,int,int,int,sptr
#func global  glTranslated      "glTranslated"       double, double, double
#func global  glTranslatef      "glTranslatef"       float,float,float
#func global  glViewport		"glViewport"		 int,int,int,int
#func global  glVertex2d        "glVertex2d"         double, double
#func global  glVertex3d        "glVertex3d"         double, double, double
#func global  glVertex4d        "glVertex4d"         double, double, double, double
#func global  glVertex2dv       "glVertex2dv"        sptr
#func global  glVertex3dv       "glVertex3dv"        sptr
#func global  glVertex4dv       "glVertex4dv"        sptr
#func global  glVertex2f        "glVertex2f"         float,float
#func global  glVertex3f        "glVertex3f"         float,float,float
#func global  glVertex4f        "glVertex4f"         float,float,float,float
#func global  glVertex2fv       "glVertex2fv"        sptr
#func global  glVertex3fv       "glVertex3fv"        sptr
#func global  glVertex4fv       "glVertex4fv"        sptr
#func global  glVertex2i        "glVertex2i"         int,int
#func global  glVertex3i        "glVertex3i"         int,int,int
#func global  glVertex4i        "glVertex4i"         int,int,int,int
#func global  glVertex2iv       "glVertex2iv"        sptr
#func global  glVertex3iv       "glVertex3iv"        sptr
#func global  glVertex4iv       "glVertex4iv"        sptr
#func global  glVertexPointer   "glVertexPointer"    int,int,int,sptr

#cfunc global wglCreateContext  "wglCreateContext"   int
#func global  wglMakeCurrent    "wglMakeCurrent"     int, int
#func global  wglDeleteContext  "wglDeleteContext"   int
#cfunc global wglGetCurrentDC   "wglGetCurrentDC"




#uselib "glu32.dll"
#func global  gluLookAt         "gluLookAt"          double, double, double, double, double, double, double, double, double
#func global  gluPerspective    "gluPerspective"     double, double, double, double


#uselib "gdi32.dll"
#cfunc global ChoosePixelFormat "ChoosePixelFormat"  int,sptr
#func global  SetPixelFormat    "SetPixelFormat"     int, int,sptr
#func global  SwapBuffers       "SwapBuffers"        int




//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define
//以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define以下define

#define global mqoteis                                  	8
#define global mqoteis11                                  	14
/* Error Codes */
#define global CL_SUCCESS                                  0
#define global CL_DEVICE_NOT_FOUND                         -1
#define global CL_DEVICE_NOT_AVAILABLE                     -2
#define global CL_COMPILER_NOT_AVAILABLE                   -3
#define global CL_MEM_OBJECT_ALLOCATION_FAILURE            -4
#define global CL_OUT_OF_RESOURCES                         -5
#define global CL_OUT_OF_HOST_MEMORY                       -6
#define global CL_PROFILING_INFO_NOT_AVAILABLE             -7
#define global CL_MEM_COPY_OVERLAP                         -8
#define global CL_IMAGE_FORMAT_MISMATCH                    -9
#define global CL_IMAGE_FORMAT_NOT_SUPPORTED               -10
#define global CL_BUILD_PROGRAM_FAILURE                    -11
#define global CL_MAP_FAILURE                              -12
#define global CL_MISALIGNED_SUB_BUFFER_OFFSET             -13
#define global CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST -14
#define global CL_COMPILE_PROGRAM_FAILURE                  -15
#define global CL_LINKER_NOT_AVAILABLE                     -16
#define global CL_LINK_PROGRAM_FAILURE                     -17
#define global CL_DEVICE_PARTITION_FAILED                  -18
#define global CL_KERNEL_ARG_INFO_NOT_AVAILABLE            -19

#define global CL_INVALID_VALUE                            -30
#define global CL_INVALID_DEVICE_TYPE                      -31
#define global CL_INVALID_PLATFORM                         -32
#define global CL_INVALID_DEVICE                           -33
#define global CL_INVALID_CONTEXT                          -34
#define global CL_INVALID_QUEUE_PROPERTIES                 -35
#define global CL_INVALID_COMMAND_QUEUE                    -36
#define global CL_INVALID_HOST_PTR                         -37
#define global CL_INVALID_MEM_OBJECT                       -38
#define global CL_INVALID_IMAGE_FORMAT_DESCRIPTOR          -39
#define global CL_INVALID_IMAGE_SIZE                       -40
#define global CL_INVALID_SAMPLER                          -41
#define global CL_INVALID_BINARY                           -42
#define global CL_INVALID_BUILD_OPTIONS                    -43
#define global CL_INVALID_PROGRAM                          -44
#define global CL_INVALID_PROGRAM_EXECUTABLE               -45
#define global CL_INVALID_KERNEL_NAME                      -46
#define global CL_INVALID_KERNEL_DEFINITION                -47
#define global CL_INVALID_KERNEL                           -48
#define global CL_INVALID_ARG_INDEX                        -49
#define global CL_INVALID_ARG_VALUE                        -50
#define global CL_INVALID_ARG_SIZE                         -51
#define global CL_INVALID_KERNEL_ARGS                      -52
#define global CL_INVALID_WORK_DIMENSION                   -53
#define global CL_INVALID_WORK_GROUP_SIZE                  -54
#define global CL_INVALID_WORK_ITEM_SIZE                   -55
#define global CL_INVALID_GLOBAL_OFFSET                    -56
#define global CL_INVALID_EVENT_WAIT_LIST                  -57
#define global CL_INVALID_EVENT                            -58
#define global CL_INVALID_OPERATION                        -59
#define global CL_INVALID_GL_OBJECT                        -60
#define global CL_INVALID_BUFFER_SIZE                      -61
#define global CL_INVALID_MIP_LEVEL                        -62
#define global CL_INVALID_GLOBAL_WORK_SIZE                 -63
#define global CL_INVALID_PROPERTY                         -64
#define global CL_INVALID_IMAGE_DESCRIPTOR                 -65
#define global CL_INVALID_COMPILER_OPTIONS                 -66
#define global CL_INVALID_LINKER_OPTIONS                   -67
#define global CL_INVALID_DEVICE_PARTITION_COUNT           -68

/* OpenCL Version */
#define global CL_VERSION_1_0                              1
#define global CL_VERSION_1_1                              1
#define global CL_VERSION_1_2                              1

/* cl_bool */
#define global CL_FALSE                                    0
#define global CL_TRUE                                     1
#define global CL_BLOCKING                                 CL_TRUE
#define global CL_NON_BLOCKING                             CL_FALSE

/* cl_platform_info */
#define global CL_PLATFORM_PROFILE                         0x0900
#define global CL_PLATFORM_VERSION                         0x0901
#define global CL_PLATFORM_NAME                            0x0902
#define global CL_PLATFORM_VENDOR                          0x0903
#define global CL_PLATFORM_EXTENSIONS                      0x0904

/* cl_device_type - bitfield */
#define global CL_DEVICE_TYPE_DEFAULT                      (1 << 0)
#define global CL_DEVICE_TYPE_CPU                          (1 << 1)
#define global CL_DEVICE_TYPE_GPU                          (1 << 2)
#define global CL_DEVICE_TYPE_ACCELERATOR                  (1 << 3)
#define global CL_DEVICE_TYPE_CUSTOM                       (1 << 4)
#define global CL_DEVICE_TYPE_ALL                          0xFFFFFFFF

/* cl_device_info */
#define global CL_DEVICE_TYPE                              0x1000
#define global CL_DEVICE_VENDOR_ID                         0x1001
#define global CL_DEVICE_MAX_COMPUTE_UNITS                 0x1002
#define global CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS          0x1003
#define global CL_DEVICE_MAX_WORK_GROUP_SIZE               0x1004
#define global CL_DEVICE_MAX_WORK_ITEM_SIZES               0x1005
#define global CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR       0x1006
#define global CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT      0x1007
#define global CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT        0x1008
#define global CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG       0x1009
#define global CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT      0x100A
#define global CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE     0x100B
#define global CL_DEVICE_MAX_CLOCK_FREQUENCY               0x100C
#define global CL_DEVICE_ADDRESS_BITS                      0x100D
#define global CL_DEVICE_MAX_READ_IMAGE_ARGS               0x100E
#define global CL_DEVICE_MAX_WRITE_IMAGE_ARGS              0x100F
#define global CL_DEVICE_MAX_MEM_ALLOC_SIZE                0x1010
#define global CL_DEVICE_IMAGE2D_MAX_WIDTH                 0x1011
#define global CL_DEVICE_IMAGE2D_MAX_HEIGHT                0x1012
#define global CL_DEVICE_IMAGE3D_MAX_WIDTH                 0x1013
#define global CL_DEVICE_IMAGE3D_MAX_HEIGHT                0x1014
#define global CL_DEVICE_IMAGE3D_MAX_DEPTH                 0x1015
#define global CL_DEVICE_IMAGE_SUPPORT                     0x1016
#define global CL_DEVICE_MAX_PARAMETER_SIZE                0x1017
#define global CL_DEVICE_MAX_SAMPLERS                      0x1018
#define global CL_DEVICE_MEM_BASE_ADDR_ALIGN               0x1019
#define global CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE          0x101A
#define global CL_DEVICE_SINGLE_FP_CONFIG                  0x101B
#define global CL_DEVICE_GLOBAL_MEM_CACHE_TYPE             0x101C
#define global CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE         0x101D
#define global CL_DEVICE_GLOBAL_MEM_CACHE_SIZE             0x101E
#define global CL_DEVICE_GLOBAL_MEM_SIZE                   0x101F
#define global CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE          0x1020
#define global CL_DEVICE_MAX_CONSTANT_ARGS                 0x1021
#define global CL_DEVICE_LOCAL_MEM_TYPE                    0x1022
#define global CL_DEVICE_LOCAL_MEM_SIZE                    0x1023
#define global CL_DEVICE_ERROR_CORRECTION_SUPPORT          0x1024
#define global CL_DEVICE_PROFILING_TIMER_RESOLUTION        0x1025
#define global CL_DEVICE_ENDIAN_LITTLE                     0x1026
#define global CL_DEVICE_AVAILABLE                         0x1027
#define global CL_DEVICE_COMPILER_AVAILABLE                0x1028
#define global CL_DEVICE_EXECUTION_CAPABILITIES            0x1029
#define global CL_DEVICE_QUEUE_PROPERTIES                  0x102A
#define global CL_DEVICE_NAME                              0x102B
#define global CL_DEVICE_VENDOR                            0x102C
#define global CL_DRIVER_VERSION                           0x102D
#define global CL_DEVICE_PROFILE                           0x102E
#define global CL_DEVICE_VERSION                           0x102F
#define global CL_DEVICE_EXTENSIONS                        0x1030
#define global CL_DEVICE_PLATFORM                          0x1031
#define global CL_DEVICE_DOUBLE_FP_CONFIG                  0x1032
/* 0x1033 reserved for CL_DEVICE_HALF_FP_CONFIG */
#define global CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF       0x1034
#define global CL_DEVICE_HOST_UNIFIED_MEMORY               0x1035
#define global CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR          0x1036
#define global CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT         0x1037
#define global CL_DEVICE_NATIVE_VECTOR_WIDTH_INT           0x1038
#define global CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG          0x1039
#define global CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT         0x103A
#define global CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE        0x103B
#define global CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF          0x103C
#define global CL_DEVICE_OPENCL_C_VERSION                  0x103D
#define global CL_DEVICE_LINKER_AVAILABLE                  0x103E
#define global CL_DEVICE_BUILT_IN_KERNELS                  0x103F
#define global CL_DEVICE_IMAGE_MAX_BUFFER_SIZE             0x1040
#define global CL_DEVICE_IMAGE_MAX_ARRAY_SIZE              0x1041
#define global CL_DEVICE_PARENT_DEVICE                     0x1042
#define global CL_DEVICE_PARTITION_MAX_SUB_DEVICES         0x1043
#define global CL_DEVICE_PARTITION_PROPERTIES              0x1044
#define global CL_DEVICE_PARTITION_AFFINITY_DOMAIN         0x1045
#define global CL_DEVICE_PARTITION_TYPE                    0x1046
#define global CL_DEVICE_REFERENCE_COUNT                   0x1047
#define global CL_DEVICE_PREFERRED_INTEROP_USER_SYNC       0x1048
#define global CL_DEVICE_PRINTF_BUFFER_SIZE                0x1049
#define global CL_DEVICE_IMAGE_PITCH_ALIGNMENT             0x104A
#define global CL_DEVICE_IMAGE_BASE_ADDRESS_ALIGNMENT      0x104B

/* cl_device_fp_config - bitfield */
#define global CL_FP_DENORM                                (1 << 0)
#define global CL_FP_INF_NAN                               (1 << 1)
#define global CL_FP_ROUND_TO_NEAREST                      (1 << 2)
#define global CL_FP_ROUND_TO_ZERO                         (1 << 3)
#define global CL_FP_ROUND_TO_INF                          (1 << 4)
#define global CL_FP_FMA                                   (1 << 5)
#define global CL_FP_SOFT_FLOAT                            (1 << 6)
#define global CL_FP_CORRECTLY_ROUNDED_DIVIDE_SQRT         (1 << 7)

/* cl_device_mem_cache_type */
#define global CL_NONE                                     0x0
#define global CL_READ_ONLY_CACHE                          0x1
#define global CL_READ_WRITE_CACHE                         0x2

/* cl_device_local_mem_type */
#define global CL_LOCAL                                    0x1
#define global CL_GLOBAL                                   0x2

/* cl_device_exec_capabilities - bitfield */
#define global CL_EXEC_KERNEL                              (1 << 0)
#define global CL_EXEC_NATIVE_KERNEL                       (1 << 1)

/* cl_command_queue_properties - bitfield */
#define global CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE      (1 << 0)
#define global CL_QUEUE_PROFILING_ENABLE                   (1 << 1)

/* cl_context_info  */
#define global CL_CONTEXT_REFERENCE_COUNT                  0x1080
#define global CL_CONTEXT_DEVICES                          0x1081
#define global CL_CONTEXT_PROPERTIES                       0x1082
#define global CL_CONTEXT_NUM_DEVICES                      0x1083

/* cl_context_properties */
#define global CL_CONTEXT_PLATFORM                         0x1084
#define global CL_CONTEXT_INTEROP_USER_SYNC                0x1085
    
/* cl_device_partition_property */
#define global CL_DEVICE_PARTITION_EQUALLY                 0x1086
#define global CL_DEVICE_PARTITION_BY_COUNTS               0x1087
#define global CL_DEVICE_PARTITION_BY_COUNTS_LIST_END      0x0
#define global CL_DEVICE_PARTITION_BY_AFFINITY_DOMAIN      0x1088
    
/* cl_device_affinity_domain */
#define global CL_DEVICE_AFFINITY_DOMAIN_NUMA                     (1 << 0)
#define global CL_DEVICE_AFFINITY_DOMAIN_L4_CACHE                 (1 << 1)
#define global CL_DEVICE_AFFINITY_DOMAIN_L3_CACHE                 (1 << 2)
#define global CL_DEVICE_AFFINITY_DOMAIN_L2_CACHE                 (1 << 3)
#define global CL_DEVICE_AFFINITY_DOMAIN_L1_CACHE                 (1 << 4)
#define global CL_DEVICE_AFFINITY_DOMAIN_NEXT_PARTITIONABLE       (1 << 5)

/* cl_command_queue_info */
#define global CL_QUEUE_CONTEXT                            0x1090
#define global CL_QUEUE_DEVICE                             0x1091
#define global CL_QUEUE_REFERENCE_COUNT                    0x1092
#define global CL_QUEUE_PROPERTIES                         0x1093

/* cl_mem_flags - bitfield */
#define global CL_MEM_READ_WRITE                           (1 << 0)
#define global CL_MEM_WRITE_ONLY                           (1 << 1)
#define global CL_MEM_READ_ONLY                            (1 << 2)
#define global CL_MEM_USE_HOST_PTR                         (1 << 3)
#define global CL_MEM_ALLOC_HOST_PTR                       (1 << 4)
#define global CL_MEM_COPY_HOST_PTR                        (1 << 5)
// reserved                                         (1 << 6)    
#define global CL_MEM_HOST_WRITE_ONLY                      (1 << 7)
#define global CL_MEM_HOST_READ_ONLY                       (1 << 8)
#define global CL_MEM_HOST_NO_ACCESS                       (1 << 9)

/* cl_mem_migration_flags - bitfield */
#define global CL_MIGRATE_MEM_OBJECT_HOST                  (1 << 0)
#define global CL_MIGRATE_MEM_OBJECT_CONTENT_UNDEFINED     (1 << 1)

/* cl_channel_order */
#define global CL_R                                        0x10B0
#define global CL_A                                        0x10B1
#define global CL_RG                                       0x10B2
#define global CL_RA                                       0x10B3
#define global CL_RGB                                      0x10B4
#define global CL_RGBA                                     0x10B5
#define global CL_BGRA                                     0x10B6
#define global CL_ARGB                                     0x10B7
#define global CL_INTENSITY                                0x10B8
#define global CL_LUMINANCE                                0x10B9
#define global CL_Rx                                       0x10BA
#define global CL_RGx                                      0x10BB
#define global CL_RGBx                                     0x10BC
#define global CL_DEPTH                                    0x10BD
#define global CL_DEPTH_STENCIL                            0x10BE

/* cl_channel_type */
#define global CL_SNORM_INT8                               0x10D0
#define global CL_SNORM_INT16                              0x10D1
#define global CL_UNORM_INT8                               0x10D2
#define global CL_UNORM_INT16                              0x10D3
#define global CL_UNORM_SHORT_565                          0x10D4
#define global CL_UNORM_SHORT_555                          0x10D5
#define global CL_UNORM_INT_101010                         0x10D6
#define global CL_SIGNED_INT8                              0x10D7
#define global CL_SIGNED_INT16                             0x10D8
#define global CL_SIGNED_INT32                             0x10D9
#define global CL_UNSIGNED_INT8                            0x10DA
#define global CL_UNSIGNED_INT16                           0x10DB
#define global CL_UNSIGNED_INT32                           0x10DC
#define global CL_HALF_FLOAT                               0x10DD
#define global CL_FLOAT                                    0x10DE
#define global CL_UNORM_INT24                              0x10DF

/* cl_mem_object_type */
#define global CL_MEM_OBJECT_BUFFER                        0x10F0
#define global CL_MEM_OBJECT_IMAGE2D                       0x10F1
#define global CL_MEM_OBJECT_IMAGE3D                       0x10F2
#define global CL_MEM_OBJECT_IMAGE2D_ARRAY                 0x10F3
#define global CL_MEM_OBJECT_IMAGE1D                       0x10F4
#define global CL_MEM_OBJECT_IMAGE1D_ARRAY                 0x10F5
#define global CL_MEM_OBJECT_IMAGE1D_BUFFER                0x10F6

/* cl_mem_info */
#define global CL_MEM_TYPE                                 0x1100
#define global CL_MEM_FLAGS                                0x1101
#define global CL_MEM_SIZE                                 0x1102
#define global CL_MEM_HOST_PTR                             0x1103
#define global CL_MEM_MAP_COUNT                            0x1104
#define global CL_MEM_REFERENCE_COUNT                      0x1105
#define global CL_MEM_CONTEXT                              0x1106
#define global CL_MEM_ASSOCIATED_MEMOBJECT                 0x1107
#define global CL_MEM_OFFSET                               0x1108

/* cl_image_info */
#define global CL_IMAGE_FORMAT                             0x1110
#define global CL_IMAGE_ELEMENT_SIZE                       0x1111
#define global CL_IMAGE_ROW_PITCH                          0x1112
#define global CL_IMAGE_SLICE_PITCH                        0x1113
#define global CL_IMAGE_WIDTH                              0x1114
#define global CL_IMAGE_HEIGHT                             0x1115
#define global CL_IMAGE_DEPTH                              0x1116
#define global CL_IMAGE_ARRAY_SIZE                         0x1117
#define global CL_IMAGE_BUFFER                             0x1118
#define global CL_IMAGE_NUM_MIP_LEVELS                     0x1119
#define global CL_IMAGE_NUM_SAMPLES                        0x111A

/* cl_addressing_mode */
#define global CL_ADDRESS_NONE                             0x1130
#define global CL_ADDRESS_CLAMP_TO_EDGE                    0x1131
#define global CL_ADDRESS_CLAMP                            0x1132
#define global CL_ADDRESS_REPEAT                           0x1133
#define global CL_ADDRESS_MIRRORED_REPEAT                  0x1134

/* cl_filter_mode */
#define global CL_FILTER_NEAREST                           0x1140
#define global CL_FILTER_LINEAR                            0x1141

/* cl_sampler_info */
#define global CL_SAMPLER_REFERENCE_COUNT                  0x1150
#define global CL_SAMPLER_CONTEXT                          0x1151
#define global CL_SAMPLER_NORMALIZED_COORDS                0x1152
#define global CL_SAMPLER_ADDRESSING_MODE                  0x1153
#define global CL_SAMPLER_FILTER_MODE                      0x1154

/* cl_map_flags - bitfield */
#define global CL_MAP_READ                                 (1 << 0)
#define global CL_MAP_WRITE                                (1 << 1)
#define global CL_MAP_WRITE_INVALIDATE_REGION              (1 << 2)

/* cl_program_info */
#define global CL_PROGRAM_REFERENCE_COUNT                  0x1160
#define global CL_PROGRAM_CONTEXT                          0x1161
#define global CL_PROGRAM_NUM_DEVICES                      0x1162
#define global CL_PROGRAM_DEVICES                          0x1163
#define global CL_PROGRAM_SOURCE                           0x1164
#define global CL_PROGRAM_BINARY_SIZES                     0x1165
#define global CL_PROGRAM_BINARIES                         0x1166
#define global CL_PROGRAM_NUM_KERNELS                      0x1167
#define global CL_PROGRAM_KERNEL_NAMES                     0x1168

/* cl_program_build_info */
#define global CL_PROGRAM_BUILD_STATUS                     0x1181
#define global CL_PROGRAM_BUILD_OPTIONS                    0x1182
#define global CL_PROGRAM_BUILD_LOG                        0x1183
#define global CL_PROGRAM_BINARY_TYPE                      0x1184
    
/* cl_program_binary_type */
#define global CL_PROGRAM_BINARY_TYPE_NONE                 0x0
#define global CL_PROGRAM_BINARY_TYPE_COMPILED_OBJECT      0x1
#define global CL_PROGRAM_BINARY_TYPE_LIBRARY              0x2
#define global CL_PROGRAM_BINARY_TYPE_EXECUTABLE           0x4

/* cl_build_status */
#define global CL_BUILD_SUCCESS                            0
#define global CL_BUILD_NONE                               -1
#define global CL_BUILD_ERROR                              -2
#define global CL_BUILD_IN_PROGRESS                        -3

/* cl_kernel_info */
#define global CL_KERNEL_FUNCTION_NAME                     0x1190
#define global CL_KERNEL_NUM_ARGS                          0x1191
#define global CL_KERNEL_REFERENCE_COUNT                   0x1192
#define global CL_KERNEL_CONTEXT                           0x1193
#define global CL_KERNEL_PROGRAM                           0x1194
#define global CL_KERNEL_ATTRIBUTES                        0x1195

/* cl_kernel_arg_info */
#define global CL_KERNEL_ARG_ADDRESS_QUALIFIER             0x1196
#define global CL_KERNEL_ARG_ACCESS_QUALIFIER              0x1197
#define global CL_KERNEL_ARG_TYPE_NAME                     0x1198
#define global CL_KERNEL_ARG_TYPE_QUALIFIER                0x1199
#define global CL_KERNEL_ARG_NAME                          0x119A

/* cl_kernel_arg_address_qualifier */
#define global CL_KERNEL_ARG_ADDRESS_GLOBAL                0x119B
#define global CL_KERNEL_ARG_ADDRESS_LOCAL                 0x119C
#define global CL_KERNEL_ARG_ADDRESS_CONSTANT              0x119D
#define global CL_KERNEL_ARG_ADDRESS_PRIVATE               0x119E

/* cl_kernel_arg_access_qualifier */
#define global CL_KERNEL_ARG_ACCESS_READ_ONLY              0x11A0
#define global CL_KERNEL_ARG_ACCESS_WRITE_ONLY             0x11A1
#define global CL_KERNEL_ARG_ACCESS_READ_WRITE             0x11A2
#define global CL_KERNEL_ARG_ACCESS_NONE                   0x11A3
    
/* cl_kernel_arg_type_qualifer */
#define global CL_KERNEL_ARG_TYPE_NONE                     0
#define global CL_KERNEL_ARG_TYPE_CONST                    (1 << 0)
#define global CL_KERNEL_ARG_TYPE_RESTRICT                 (1 << 1)
#define global CL_KERNEL_ARG_TYPE_VOLATILE                 (1 << 2)

/* cl_kernel_work_group_info */
#define global CL_KERNEL_WORK_GROUP_SIZE                   0x11B0
#define global CL_KERNEL_COMPILE_WORK_GROUP_SIZE           0x11B1
#define global CL_KERNEL_LOCAL_MEM_SIZE                    0x11B2
#define global CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE 0x11B3
#define global CL_KERNEL_PRIVATE_MEM_SIZE                  0x11B4
#define global CL_KERNEL_GLOBAL_WORK_SIZE                  0x11B5

/* cl_event_info  */
#define global CL_EVENT_COMMAND_QUEUE                      0x11D0
#define global CL_EVENT_COMMAND_TYPE                       0x11D1
#define global CL_EVENT_REFERENCE_COUNT                    0x11D2
#define global CL_EVENT_COMMAND_EXECUTION_STATUS           0x11D3
#define global CL_EVENT_CONTEXT                            0x11D4

/* cl_command_type */
#define global CL_COMMAND_NDRANGE_KERNEL                   0x11F0
#define global CL_COMMAND_TASK                             0x11F1
#define global CL_COMMAND_NATIVE_KERNEL                    0x11F2
#define global CL_COMMAND_READ_BUFFER                      0x11F3
#define global CL_COMMAND_WRITE_BUFFER                     0x11F4
#define global CL_COMMAND_COPY_BUFFER                      0x11F5
#define global CL_COMMAND_READ_IMAGE                       0x11F6
#define global CL_COMMAND_WRITE_IMAGE                      0x11F7
#define global CL_COMMAND_COPY_IMAGE                       0x11F8
#define global CL_COMMAND_COPY_IMAGE_TO_BUFFER             0x11F9
#define global CL_COMMAND_COPY_BUFFER_TO_IMAGE             0x11FA
#define global CL_COMMAND_MAP_BUFFER                       0x11FB
#define global CL_COMMAND_MAP_IMAGE                        0x11FC
#define global CL_COMMAND_UNMAP_MEM_OBJECT                 0x11FD
#define global CL_COMMAND_MARKER                           0x11FE
#define global CL_COMMAND_ACQUIRE_GL_OBJECTS               0x11FF
#define global CL_COMMAND_RELEASE_GL_OBJECTS               0x1200
#define global CL_COMMAND_READ_BUFFER_RECT                 0x1201
#define global CL_COMMAND_WRITE_BUFFER_RECT                0x1202
#define global CL_COMMAND_COPY_BUFFER_RECT                 0x1203
#define global CL_COMMAND_USER                             0x1204
#define global CL_COMMAND_BARRIER                          0x1205
#define global CL_COMMAND_MIGRATE_MEM_OBJECTS              0x1206
#define global CL_COMMAND_FILL_BUFFER                      0x1207
#define global CL_COMMAND_FILL_IMAGE                       0x1208

/* command execution status */
#define global CL_COMPLETE                                 0x0
#define global CL_RUNNING                                  0x1
#define global CL_SUBMITTED                                0x2
#define global CL_QUEUED                                   0x3

/* cl_buffer_create_type  */
#define global CL_BUFFER_CREATE_TYPE_REGION                0x1220

/* cl_profiling_info  */
#define global CL_PROFILING_COMMAND_QUEUED                 0x1280
#define global CL_PROFILING_COMMAND_SUBMIT                 0x1281
#define global CL_PROFILING_COMMAND_START                  0x1282
#define global CL_PROFILING_COMMAND_END                    0x1283



//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define
//以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define以下OpenGL関連define




#define global GL_VERSION_1_1                    1
#define global GL_ACCUM                          0x0100
#define global GL_LOAD                           0x0101
#define global GL_RETURN                         0x0102
#define global GL_MULT                           0x0103
#define global GL_ADD                            0x0104
#define global GL_NEVER                          0x0200
#define global GL_LESS                           0x0201
#define global GL_EQUAL                          0x0202
#define global GL_LEQUAL                         0x0203
#define global GL_GREATER                        0x0204
#define global GL_NOTEQUAL                       0x0205
#define global GL_GEQUAL                         0x0206
#define global GL_ALWAYS                         0x0207
#define global GL_CURRENT_BIT                    0x00000001
#define global GL_POINT_BIT                      0x00000002
#define global GL_LINE_BIT                       0x00000004
#define global GL_POLYGON_BIT                    0x00000008
#define global GL_POLYGON_STIPPLE_BIT            0x00000010
#define global GL_PIXEL_MODE_BIT                 0x00000020
#define global GL_LIGHTING_BIT                   0x00000040
#define global GL_FOG_BIT                        0x00000080
#define global GL_DEPTH_BUFFER_BIT               0x00000100
#define global GL_ACCUM_BUFFER_BIT               0x00000200
#define global GL_STENCIL_BUFFER_BIT             0x00000400
#define global GL_VIEWPORT_BIT                   0x00000800
#define global GL_TRANSFORM_BIT                  0x00001000
#define global GL_ENABLE_BIT                     0x00002000
#define global GL_COLOR_BUFFER_BIT               0x00004000
#define global GL_HINT_BIT                       0x00008000
#define global GL_EVAL_BIT                       0x00010000
#define global GL_LIST_BIT                       0x00020000
#define global GL_TEXTURE_BIT                    0x00040000
#define global GL_SCISSOR_BIT                    0x00080000
#define global GL_ALL_ATTRIB_BITS                0x000fffff
#define global GL_POINTS                         0x0000
#define global GL_LINES                          0x0001
#define global GL_LINE_LOOP                      0x0002
#define global GL_LINE_STRIP                     0x0003
#define global GL_TRIANGLES                      0x0004
#define global GL_TRIANGLE_STRIP                 0x0005
#define global GL_TRIANGLE_FAN                   0x0006
#define global GL_QUADS                          0x0007
#define global GL_QUAD_STRIP                     0x0008
#define global GL_POLYGON                        0x0009
#define global GL_ZERO                           0
#define global GL_ONE                            1
#define global GL_SRC_COLOR                      0x0300
#define global GL_ONE_MINUS_SRC_COLOR            0x0301
#define global GL_SRC_ALPHA                      0x0302
#define global GL_ONE_MINUS_SRC_ALPHA            0x0303
#define global GL_DST_ALPHA                      0x0304
#define global GL_ONE_MINUS_DST_ALPHA            0x0305
#define global GL_DST_COLOR                      0x0306
#define global GL_ONE_MINUS_DST_COLOR            0x0307
#define global GL_SRC_ALPHA_SATURATE             0x0308
#define global GL_TRUE                           1
#define global GL_FALSE                          0
#define global GL_CLIP_PLANE0                    0x3000
#define global GL_CLIP_PLANE1                    0x3001
#define global GL_CLIP_PLANE2                    0x3002
#define global GL_CLIP_PLANE3                    0x3003
#define global GL_CLIP_PLANE4                    0x3004
#define global GL_CLIP_PLANE5                    0x3005
#define global GL_BYTE                           0x1400
#define global GL_UNSIGNED_BYTE                  0x1401
#define global GL_SHORT                          0x1402
#define global GL_UNSIGNED_SHORT                 0x1403
#define global GL_INT                            0x1404
#define global GL_UNSIGNED_INT                   0x1405
#define global GL_FLOAT                          0x1406
#define global GL_2_BYTES                        0x1407
#define global GL_3_BYTES                        0x1408
#define global GL_4_BYTES                        0x1409
#define global GL_DOUBLE                         0x140A
#define global GL_NONE                           0
#define global GL_FRONT_LEFT                     0x0400
#define global GL_FRONT_RIGHT                    0x0401
#define global GL_BACK_LEFT                      0x0402
#define global GL_BACK_RIGHT                     0x0403
#define global GL_FRONT                          0x0404
#define global GL_BACK                           0x0405
#define global GL_LEFT                           0x0406
#define global GL_RIGHT                          0x0407
#define global GL_FRONT_AND_BACK                 0x0408
#define global GL_AUX0                           0x0409
#define global GL_AUX1                           0x040A
#define global GL_AUX2                           0x040B
#define global GL_AUX3                           0x040C
#define global GL_NO_ERROR                       0
#define global GL_INVALID_ENUM                   0x0500
#define global GL_INVALID_VALUE                  0x0501
#define global GL_INVALID_OPERATION              0x0502
#define global GL_STACK_OVERFLOW                 0x0503
#define global GL_STACK_UNDERFLOW                0x0504
#define global GL_OUT_OF_MEMORY                  0x0505
#define global GL_2D                             0x0600
#define global GL_3D                             0x0601
#define global GL_3D_COLOR                       0x0602
#define global GL_3D_COLOR_TEXTURE               0x0603
#define global GL_4D_COLOR_TEXTURE               0x0604
#define global GL_PASS_THROUGH_TOKEN             0x0700
#define global GL_POINT_TOKEN                    0x0701
#define global GL_LINE_TOKEN                     0x0702
#define global GL_POLYGON_TOKEN                  0x0703
#define global GL_BITMAP_TOKEN                   0x0704
#define global GL_DRAW_PIXEL_TOKEN               0x0705
#define global GL_COPY_PIXEL_TOKEN               0x0706
#define global GL_LINE_RESET_TOKEN               0x0707
#define global GL_EXP                            0x0800
#define global GL_EXP2                           0x0801
#define global GL_CW                             0x0900
#define global GL_CCW                            0x0901
#define global GL_COEFF                          0x0A00
#define global GL_ORDER                          0x0A01
#define global GL_DOMAIN                         0x0A02
#define global GL_CURRENT_COLOR                  0x0B00
#define global GL_CURRENT_INDEX                  0x0B01
#define global GL_CURRENT_NORMAL                 0x0B02
#define global GL_CURRENT_TEXTURE_COORDS         0x0B03
#define global GL_CURRENT_RASTER_COLOR           0x0B04
#define global GL_CURRENT_RASTER_INDEX           0x0B05
#define global GL_CURRENT_RASTER_TEXTURE_COORDS  0x0B06
#define global GL_CURRENT_RASTER_POSITION        0x0B07
#define global GL_CURRENT_RASTER_POSITION_VALID  0x0B08
#define global GL_CURRENT_RASTER_DISTANCE        0x0B09
#define global GL_POINT_SMOOTH                   0x0B10
#define global GL_POINT_SIZE                     0x0B11
#define global GL_POINT_SIZE_RANGE               0x0B12
#define global GL_POINT_SIZE_GRANULARITY         0x0B13
#define global GL_LINE_SMOOTH                    0x0B20
#define global GL_LINE_WIDTH                     0x0B21
#define global GL_LINE_WIDTH_RANGE               0x0B22
#define global GL_LINE_WIDTH_GRANULARITY         0x0B23
#define global GL_LINE_STIPPLE                   0x0B24
#define global GL_LINE_STIPPLE_PATTERN           0x0B25
#define global GL_LINE_STIPPLE_REPEAT            0x0B26
#define global GL_LIST_MODE                      0x0B30
#define global GL_MAX_LIST_NESTING               0x0B31
#define global GL_LIST_BASE                      0x0B32
#define global GL_LIST_INDEX                     0x0B33
#define global GL_POLYGON_MODE                   0x0B40
#define global GL_POLYGON_SMOOTH                 0x0B41
#define global GL_POLYGON_STIPPLE                0x0B42
#define global GL_EDGE_FLAG                      0x0B43
#define global GL_CULL_FACE                      0x0B44
#define global GL_CULL_FACE_MODE                 0x0B45
#define global GL_FRONT_FACE                     0x0B46
#define global GL_LIGHTING                       0x0B50
#define global GL_LIGHT_MODEL_LOCAL_VIEWER       0x0B51
#define global GL_LIGHT_MODEL_TWO_SIDE           0x0B52
#define global GL_LIGHT_MODEL_AMBIENT            0x0B53
#define global GL_SHADE_MODEL                    0x0B54
#define global GL_COLOR_MATERIAL_FACE            0x0B55
#define global GL_COLOR_MATERIAL_PARAMETER       0x0B56
#define global GL_COLOR_MATERIAL                 0x0B57
#define global GL_FOG                            0x0B60
#define global GL_FOG_INDEX                      0x0B61
#define global GL_FOG_DENSITY                    0x0B62
#define global GL_FOG_START                      0x0B63
#define global GL_FOG_END                        0x0B64
#define global GL_FOG_MODE                       0x0B65
#define global GL_FOG_COLOR                      0x0B66
#define global GL_DEPTH_RANGE                    0x0B70
#define global GL_DEPTH_TEST                     0x0B71
#define global GL_DEPTH_WRITEMASK                0x0B72
#define global GL_DEPTH_CLEAR_VALUE              0x0B73
#define global GL_DEPTH_FUNC                     0x0B74
#define global GL_ACCUM_CLEAR_VALUE              0x0B80
#define global GL_STENCIL_TEST                   0x0B90
#define global GL_STENCIL_CLEAR_VALUE            0x0B91
#define global GL_STENCIL_FUNC                   0x0B92
#define global GL_STENCIL_VALUE_MASK             0x0B93
#define global GL_STENCIL_FAIL                   0x0B94
#define global GL_STENCIL_PASS_DEPTH_FAIL        0x0B95
#define global GL_STENCIL_PASS_DEPTH_PASS        0x0B96
#define global GL_STENCIL_REF                    0x0B97
#define global GL_STENCIL_WRITEMASK              0x0B98
#define global GL_MATRIX_MODE                    0x0BA0
#define global GL_NORMALIZE                      0x0BA1
#define global GL_VIEWPORT                       0x0BA2
#define global GL_MODELVIEW_STACK_DEPTH          0x0BA3
#define global GL_PROJECTION_STACK_DEPTH         0x0BA4
#define global GL_TEXTURE_STACK_DEPTH            0x0BA5
#define global GL_MODELVIEW_MATRIX               0x0BA6
#define global GL_PROJECTION_MATRIX              0x0BA7
#define global GL_TEXTURE_MATRIX                 0x0BA8
#define global GL_ATTRIB_STACK_DEPTH             0x0BB0
#define global GL_CLIENT_ATTRIB_STACK_DEPTH      0x0BB1
#define global GL_ALPHA_TEST                     0x0BC0
#define global GL_ALPHA_TEST_FUNC                0x0BC1
#define global GL_ALPHA_TEST_REF                 0x0BC2
#define global GL_DITHER                         0x0BD0
#define global GL_BLEND_DST                      0x0BE0
#define global GL_BLEND_SRC                      0x0BE1
#define global GL_BLEND                          0x0BE2
#define global GL_LOGIC_OP_MODE                  0x0BF0
#define global GL_INDEX_LOGIC_OP                 0x0BF1
#define global GL_COLOR_LOGIC_OP                 0x0BF2
#define global GL_AUX_BUFFERS                    0x0C00
#define global GL_DRAW_BUFFER                    0x0C01
#define global GL_READ_BUFFER                    0x0C02
#define global GL_SCISSOR_BOX                    0x0C10
#define global GL_SCISSOR_TEST                   0x0C11
#define global GL_INDEX_CLEAR_VALUE              0x0C20
#define global GL_INDEX_WRITEMASK                0x0C21
#define global GL_COLOR_CLEAR_VALUE              0x0C22
#define global GL_COLOR_WRITEMASK                0x0C23
#define global GL_INDEX_MODE                     0x0C30
#define global GL_RGBA_MODE                      0x0C31
#define global GL_DOUBLEBUFFER                   0x0C32
#define global GL_STEREO                         0x0C33
#define global GL_RENDER_MODE                    0x0C40
#define global GL_PERSPECTIVE_CORRECTION_HINT    0x0C50
#define global GL_POINT_SMOOTH_HINT              0x0C51
#define global GL_LINE_SMOOTH_HINT               0x0C52
#define global GL_POLYGON_SMOOTH_HINT            0x0C53
#define global GL_FOG_HINT                       0x0C54
#define global GL_TEXTURE_GEN_S                  0x0C60
#define global GL_TEXTURE_GEN_T                  0x0C61
#define global GL_TEXTURE_GEN_R                  0x0C62
#define global GL_TEXTURE_GEN_Q                  0x0C63
#define global GL_PIXEL_MAP_I_TO_I               0x0C70
#define global GL_PIXEL_MAP_S_TO_S               0x0C71
#define global GL_PIXEL_MAP_I_TO_R               0x0C72
#define global GL_PIXEL_MAP_I_TO_G               0x0C73
#define global GL_PIXEL_MAP_I_TO_B               0x0C74
#define global GL_PIXEL_MAP_I_TO_A               0x0C75
#define global GL_PIXEL_MAP_R_TO_R               0x0C76
#define global GL_PIXEL_MAP_G_TO_G               0x0C77
#define global GL_PIXEL_MAP_B_TO_B               0x0C78
#define global GL_PIXEL_MAP_A_TO_A               0x0C79
#define global GL_PIXEL_MAP_I_TO_I_SIZE          0x0CB0
#define global GL_PIXEL_MAP_S_TO_S_SIZE          0x0CB1
#define global GL_PIXEL_MAP_I_TO_R_SIZE          0x0CB2
#define global GL_PIXEL_MAP_I_TO_G_SIZE          0x0CB3
#define global GL_PIXEL_MAP_I_TO_B_SIZE          0x0CB4
#define global GL_PIXEL_MAP_I_TO_A_SIZE          0x0CB5
#define global GL_PIXEL_MAP_R_TO_R_SIZE          0x0CB6
#define global GL_PIXEL_MAP_G_TO_G_SIZE          0x0CB7
#define global GL_PIXEL_MAP_B_TO_B_SIZE          0x0CB8
#define global GL_PIXEL_MAP_A_TO_A_SIZE          0x0CB9
#define global GL_UNPACK_SWAP_BYTES              0x0CF0
#define global GL_UNPACK_LSB_FIRST               0x0CF1
#define global GL_UNPACK_ROW_LENGTH              0x0CF2
#define global GL_UNPACK_SKIP_ROWS               0x0CF3
#define global GL_UNPACK_SKIP_PIXELS             0x0CF4
#define global GL_UNPACK_ALIGNMENT               0x0CF5
#define global GL_PACK_SWAP_BYTES                0x0D00
#define global GL_PACK_LSB_FIRST                 0x0D01
#define global GL_PACK_ROW_LENGTH                0x0D02
#define global GL_PACK_SKIP_ROWS                 0x0D03
#define global GL_PACK_SKIP_PIXELS               0x0D04
#define global GL_PACK_ALIGNMENT                 0x0D05
#define global GL_MAP_COLOR                      0x0D10
#define global GL_MAP_STENCIL                    0x0D11
#define global GL_INDEX_SHIFT                    0x0D12
#define global GL_INDEX_OFFSET                   0x0D13
#define global GL_RED_SCALE                      0x0D14
#define global GL_RED_BIAS                       0x0D15
#define global GL_ZOOM_X                         0x0D16
#define global GL_ZOOM_Y                         0x0D17
#define global GL_GREEN_SCALE                    0x0D18
#define global GL_GREEN_BIAS                     0x0D19
#define global GL_BLUE_SCALE                     0x0D1A
#define global GL_BLUE_BIAS                      0x0D1B
#define global GL_ALPHA_SCALE                    0x0D1C
#define global GL_ALPHA_BIAS                     0x0D1D
#define global GL_DEPTH_SCALE                    0x0D1E
#define global GL_DEPTH_BIAS                     0x0D1F
#define global GL_MAX_EVAL_ORDER                 0x0D30
#define global GL_MAX_LIGHTS                     0x0D31
#define global GL_MAX_CLIP_PLANES                0x0D32
#define global GL_MAX_TEXTURE_SIZE               0x0D33
#define global GL_MAX_PIXEL_MAP_TABLE            0x0D34
#define global GL_MAX_ATTRIB_STACK_DEPTH         0x0D35
#define global GL_MAX_MODELVIEW_STACK_DEPTH      0x0D36
#define global GL_MAX_NAME_STACK_DEPTH           0x0D37
#define global GL_MAX_PROJECTION_STACK_DEPTH     0x0D38
#define global GL_MAX_TEXTURE_STACK_DEPTH        0x0D39
#define global GL_MAX_VIEWPORT_DIMS              0x0D3A
#define global GL_MAX_CLIENT_ATTRIB_STACK_DEPTH  0x0D3B
#define global GL_SUBPIXEL_BITS                  0x0D50
#define global GL_INDEX_BITS                     0x0D51
#define global GL_RED_BITS                       0x0D52
#define global GL_GREEN_BITS                     0x0D53
#define global GL_BLUE_BITS                      0x0D54
#define global GL_ALPHA_BITS                     0x0D55
#define global GL_DEPTH_BITS                     0x0D56
#define global GL_STENCIL_BITS                   0x0D57
#define global GL_ACCUM_RED_BITS                 0x0D58
#define global GL_ACCUM_GREEN_BITS               0x0D59
#define global GL_ACCUM_BLUE_BITS                0x0D5A
#define global GL_ACCUM_ALPHA_BITS               0x0D5B
#define global GL_NAME_STACK_DEPTH               0x0D70
#define global GL_AUTO_NORMAL                    0x0D80
#define global GL_MAP1_COLOR_4                   0x0D90
#define global GL_MAP1_INDEX                     0x0D91
#define global GL_MAP1_NORMAL                    0x0D92
#define global GL_MAP1_TEXTURE_COORD_1           0x0D93
#define global GL_MAP1_TEXTURE_COORD_2           0x0D94
#define global GL_MAP1_TEXTURE_COORD_3           0x0D95
#define global GL_MAP1_TEXTURE_COORD_4           0x0D96
#define global GL_MAP1_VERTEX_3                  0x0D97
#define global GL_MAP1_VERTEX_4                  0x0D98
#define global GL_MAP2_COLOR_4                   0x0DB0
#define global GL_MAP2_INDEX                     0x0DB1
#define global GL_MAP2_NORMAL                    0x0DB2
#define global GL_MAP2_TEXTURE_COORD_1           0x0DB3
#define global GL_MAP2_TEXTURE_COORD_2           0x0DB4
#define global GL_MAP2_TEXTURE_COORD_3           0x0DB5
#define global GL_MAP2_TEXTURE_COORD_4           0x0DB6
#define global GL_MAP2_VERTEX_3                  0x0DB7
#define global GL_MAP2_VERTEX_4                  0x0DB8
#define global GL_MAP1_GRID_DOMAIN               0x0DD0
#define global GL_MAP1_GRID_SEGMENTS             0x0DD1
#define global GL_MAP2_GRID_DOMAIN               0x0DD2
#define global GL_MAP2_GRID_SEGMENTS             0x0DD3
#define global GL_TEXTURE_1D                     0x0DE0
#define global GL_TEXTURE_2D                     0x0DE1
#define global GL_FEEDBACK_BUFFER_POINTER        0x0DF0
#define global GL_FEEDBACK_BUFFER_SIZE           0x0DF1
#define global GL_FEEDBACK_BUFFER_TYPE           0x0DF2
#define global GL_SELECTION_BUFFER_POINTER       0x0DF3
#define global GL_SELECTION_BUFFER_SIZE          0x0DF4
#define global GL_TEXTURE_WIDTH                  0x1000
#define global GL_TEXTURE_HEIGHT                 0x1001
#define global GL_TEXTURE_INTERNAL_FORMAT        0x1003
#define global GL_TEXTURE_BORDER_COLOR           0x1004
#define global GL_TEXTURE_BORDER                 0x1005
#define global GL_DONT_CARE                      0x1100
#define global GL_FASTEST                        0x1101
#define global GL_NICEST                         0x1102
#define global GL_LIGHT0                         0x4000
#define global GL_LIGHT1                         0x4001
#define global GL_LIGHT2                         0x4002
#define global GL_LIGHT3                         0x4003
#define global GL_LIGHT4                         0x4004
#define global GL_LIGHT5                         0x4005
#define global GL_LIGHT6                         0x4006
#define global GL_LIGHT7                         0x4007
#define global GL_AMBIENT                        0x1200
#define global GL_DIFFUSE                        0x1201
#define global GL_SPECULAR                       0x1202
#define global GL_POSITION                       0x1203
#define global GL_SPOT_DIRECTION                 0x1204
#define global GL_SPOT_EXPONENT                  0x1205
#define global GL_SPOT_CUTOFF                    0x1206
#define global GL_CONSTANT_ATTENUATION           0x1207
#define global GL_LINEAR_ATTENUATION             0x1208
#define global GL_QUADRATIC_ATTENUATION          0x1209
#define global GL_COMPILE                        0x1300
#define global GL_COMPILE_AND_EXECUTE            0x1301
#define global GL_CLEAR                          0x1500
#define global GL_AND                            0x1501
#define global GL_AND_REVERSE                    0x1502
#define global GL_COPY                           0x1503
#define global GL_AND_INVERTED                   0x1504
#define global GL_NOOP                           0x1505
#define global GL_XOR                            0x1506
#define global GL_OR                             0x1507
#define global GL_NOR                            0x1508
#define global GL_EQUIV                          0x1509
#define global GL_INVERT                         0x150A
#define global GL_OR_REVERSE                     0x150B
#define global GL_COPY_INVERTED                  0x150C
#define global GL_OR_INVERTED                    0x150D
#define global GL_NAND                           0x150E
#define global GL_SET                            0x150F
#define global GL_EMISSION                       0x1600
#define global GL_SHININESS                      0x1601
#define global GL_AMBIENT_AND_DIFFUSE            0x1602
#define global GL_COLOR_INDEXES                  0x1603
#define global GL_MODELVIEW                      0x1700
#define global GL_PROJECTION                     0x1701
#define global GL_TEXTURE                        0x1702
#define global GL_COLOR                          0x1800
#define global GL_DEPTH                          0x1801
#define global GL_STENCIL                        0x1802
#define global GL_COLOR_INDEX                    0x1900
#define global GL_STENCIL_INDEX                  0x1901
#define global GL_DEPTH_COMPONENT                0x1902
#define global GL_RED                            0x1903
#define global GL_GREEN                          0x1904
#define global GL_BLUE                           0x1905
#define global GL_ALPHA                          0x1906
#define global GL_RGB                            0x1907
#define global GL_RGBA                           0x1908
#define global GL_LUMINANCE                      0x1909
#define global GL_LUMINANCE_ALPHA                0x190A
#define global GL_BITMAP                         0x1A00
#define global GL_POINT                          0x1B00
#define global GL_LINE                           0x1B01
#define global GL_FILL                           0x1B02
#define global GL_RENDER                         0x1C00
#define global GL_FEEDBACK                       0x1C01
#define global GL_SELECT                         0x1C02
#define global GL_FLAT                           0x1D00
#define global GL_SMOOTH                         0x1D01
#define global GL_KEEP                           0x1E00
#define global GL_REPLACE                        0x1E01
#define global GL_INCR                           0x1E02
#define global GL_DECR                           0x1E03
#define global GL_VENDOR                         0x1F00
#define global GL_RENDERER                       0x1F01
#define global GL_VERSION                        0x1F02
#define global GL_EXTENSIONS                     0x1F03
#define global GL_S                              0x2000
#define global GL_T                              0x2001
#define global GL_R                              0x2002
#define global GL_Q                              0x2003
#define global GL_MODULATE                       0x2100
#define global GL_DECAL                          0x2101
#define global GL_TEXTURE_ENV_MODE               0x2200
#define global GL_TEXTURE_ENV_COLOR              0x2201
#define global GL_TEXTURE_ENV                    0x2300
#define global GL_EYE_LINEAR                     0x2400
#define global GL_OBJECT_LINEAR                  0x2401
#define global GL_SPHERE_MAP                     0x2402
#define global GL_TEXTURE_GEN_MODE               0x2500
#define global GL_OBJECT_PLANE                   0x2501
#define global GL_EYE_PLANE                      0x2502
#define global GL_NEAREST                        0x2600
#define global GL_LINEAR                         0x2601
#define global GL_NEAREST_MIPMAP_NEAREST         0x2700
#define global GL_LINEAR_MIPMAP_NEAREST          0x2701
#define global GL_NEAREST_MIPMAP_LINEAR          0x2702
#define global GL_LINEAR_MIPMAP_LINEAR           0x2703
#define global GL_TEXTURE_MAG_FILTER             0x2800
#define global GL_TEXTURE_MIN_FILTER             0x2801
#define global GL_TEXTURE_WRAP_S                 0x2802
#define global GL_TEXTURE_WRAP_T                 0x2803
#define global GL_CLAMP                          0x2900
#define global GL_REPEAT                         0x2901
#define global GL_CLIENT_PIXEL_STORE_BIT         0x00000001
#define global GL_CLIENT_VERTEX_ARRAY_BIT        0x00000002
#define global GL_CLIENT_ALL_ATTRIB_BITS         0xffffffff
#define global GL_POLYGON_OFFSET_FACTOR          0x8038
#define global GL_POLYGON_OFFSET_UNITS           0x2A00
#define global GL_POLYGON_OFFSET_POINT           0x2A01
#define global GL_POLYGON_OFFSET_LINE            0x2A02
#define global GL_POLYGON_OFFSET_FILL            0x8037
#define global GL_ALPHA4                         0x803B
#define global GL_ALPHA8                         0x803C
#define global GL_ALPHA12                        0x803D
#define global GL_ALPHA16                        0x803E
#define global GL_LUMINANCE4                     0x803F
#define global GL_LUMINANCE8                     0x8040
#define global GL_LUMINANCE12                    0x8041
#define global GL_LUMINANCE16                    0x8042
#define global GL_LUMINANCE4_ALPHA4              0x8043
#define global GL_LUMINANCE6_ALPHA2              0x8044
#define global GL_LUMINANCE8_ALPHA8              0x8045
#define global GL_LUMINANCE12_ALPHA4             0x8046
#define global GL_LUMINANCE12_ALPHA12            0x8047
#define global GL_LUMINANCE16_ALPHA16            0x8048
#define global GL_INTENSITY                      0x8049
#define global GL_INTENSITY4                     0x804A
#define global GL_INTENSITY8                     0x804B
#define global GL_INTENSITY12                    0x804C
#define global GL_INTENSITY16                    0x804D
#define global GL_R3_G3_B2                       0x2A10
#define global GL_RGB4                           0x804F
#define global GL_RGB5                           0x8050
#define global GL_RGB8                           0x8051
#define global GL_RGB10                          0x8052
#define global GL_RGB12                          0x8053
#define global GL_RGB16                          0x8054
#define global GL_RGBA2                          0x8055
#define global GL_RGBA4                          0x8056
#define global GL_RGB5_A1                        0x8057
#define global GL_RGBA8                          0x8058
#define global GL_RGB10_A2                       0x8059
#define global GL_RGBA12                         0x805A
#define global GL_RGBA16                         0x805B
#define global GL_TEXTURE_RED_SIZE               0x805C
#define global GL_TEXTURE_GREEN_SIZE             0x805D
#define global GL_TEXTURE_BLUE_SIZE              0x805E
#define global GL_TEXTURE_ALPHA_SIZE             0x805F
#define global GL_TEXTURE_LUMINANCE_SIZE         0x8060
#define global GL_TEXTURE_INTENSITY_SIZE         0x8061
#define global GL_PROXY_TEXTURE_1D               0x8063
#define global GL_PROXY_TEXTURE_2D               0x8064
#define global GL_TEXTURE_PRIORITY               0x8066
#define global GL_TEXTURE_RESIDENT               0x8067
#define global GL_TEXTURE_BINDING_1D             0x8068
#define global GL_TEXTURE_BINDING_2D             0x8069
#define global GL_VERTEX_ARRAY                   0x8074
#define global GL_NORMAL_ARRAY                   0x8075
#define global GL_COLOR_ARRAY                    0x8076
#define global GL_INDEX_ARRAY                    0x8077
#define global GL_TEXTURE_COORD_ARRAY            0x8078
#define global GL_EDGE_FLAG_ARRAY                0x8079
#define global GL_VERTEX_ARRAY_SIZE              0x807A
#define global GL_VERTEX_ARRAY_TYPE              0x807B
#define global GL_VERTEX_ARRAY_STRIDE            0x807C
#define global GL_NORMAL_ARRAY_TYPE              0x807E
#define global GL_NORMAL_ARRAY_STRIDE            0x807F
#define global GL_COLOR_ARRAY_SIZE               0x8081
#define global GL_COLOR_ARRAY_TYPE               0x8082
#define global GL_COLOR_ARRAY_STRIDE             0x8083
#define global GL_INDEX_ARRAY_TYPE               0x8085
#define global GL_INDEX_ARRAY_STRIDE             0x8086
#define global GL_TEXTURE_COORD_ARRAY_SIZE       0x8088
#define global GL_TEXTURE_COORD_ARRAY_TYPE       0x8089
#define global GL_TEXTURE_COORD_ARRAY_STRIDE     0x808A
#define global GL_EDGE_FLAG_ARRAY_STRIDE         0x808C
#define global GL_VERTEX_ARRAY_POINTER           0x808E
#define global GL_NORMAL_ARRAY_POINTER           0x808F
#define global GL_COLOR_ARRAY_POINTER            0x8090
#define global GL_INDEX_ARRAY_POINTER            0x8091
#define global GL_TEXTURE_COORD_ARRAY_POINTER    0x8092
#define global GL_EDGE_FLAG_ARRAY_POINTER        0x8093
#define global GL_V2F                            0x2A20
#define global GL_V3F                            0x2A21
#define global GL_C4UB_V2F                       0x2A22
#define global GL_C4UB_V3F                       0x2A23
#define global GL_C3F_V3F                        0x2A24
#define global GL_N3F_V3F                        0x2A25
#define global GL_C4F_N3F_V3F                    0x2A26
#define global GL_T2F_V3F                        0x2A27
#define global GL_T4F_V4F                        0x2A28
#define global GL_T2F_C4UB_V3F                   0x2A29
#define global GL_T2F_C3F_V3F                    0x2A2A
#define global GL_T2F_N3F_V3F                    0x2A2B
#define global GL_T2F_C4F_N3F_V3F                0x2A2C
#define global GL_T4F_C4F_N3F_V4F                0x2A2D
#define global GL_EXT_vertex_array               1
#define global GL_EXT_bgra                       1
#define global GL_EXT_paletted_texture           1
#define global GL_WIN_swap_hint                  1
#define global GL_WIN_draw_range_elements        1
#define global GL_VERTEX_ARRAY_EXT               0x8074
#define global GL_NORMAL_ARRAY_EXT               0x8075
#define global GL_COLOR_ARRAY_EXT                0x8076
#define global GL_INDEX_ARRAY_EXT                0x8077
#define global GL_TEXTURE_COORD_ARRAY_EXT        0x8078
#define global GL_EDGE_FLAG_ARRAY_EXT            0x8079
#define global GL_VERTEX_ARRAY_SIZE_EXT          0x807A
#define global GL_VERTEX_ARRAY_TYPE_EXT          0x807B
#define global GL_VERTEX_ARRAY_STRIDE_EXT        0x807C
#define global GL_VERTEX_ARRAY_COUNT_EXT         0x807D
#define global GL_NORMAL_ARRAY_TYPE_EXT          0x807E
#define global GL_NORMAL_ARRAY_STRIDE_EXT        0x807F
#define global GL_NORMAL_ARRAY_COUNT_EXT         0x8080
#define global GL_COLOR_ARRAY_SIZE_EXT           0x8081
#define global GL_COLOR_ARRAY_TYPE_EXT           0x8082
#define global GL_COLOR_ARRAY_STRIDE_EXT         0x8083
#define global GL_COLOR_ARRAY_COUNT_EXT          0x8084
#define global GL_INDEX_ARRAY_TYPE_EXT           0x8085
#define global GL_INDEX_ARRAY_STRIDE_EXT         0x8086
#define global GL_INDEX_ARRAY_COUNT_EXT          0x8087
#define global GL_TEXTURE_COORD_ARRAY_SIZE_EXT   0x8088
#define global GL_TEXTURE_COORD_ARRAY_TYPE_EXT   0x8089
#define global GL_TEXTURE_COORD_ARRAY_STRIDE_EXT 0x808A
#define global GL_TEXTURE_COORD_ARRAY_COUNT_EXT  0x808B
#define global GL_EDGE_FLAG_ARRAY_STRIDE_EXT     0x808C
#define global GL_EDGE_FLAG_ARRAY_COUNT_EXT      0x808D
#define global GL_VERTEX_ARRAY_POINTER_EXT       0x808E
#define global GL_NORMAL_ARRAY_POINTER_EXT       0x808F
#define global GL_COLOR_ARRAY_POINTER_EXT        0x8090
#define global GL_INDEX_ARRAY_POINTER_EXT        0x8091
#define global GL_TEXTURE_COORD_ARRAY_POINTER_EXT 0x8092
#define global GL_EDGE_FLAG_ARRAY_POINTER_EXT    0x8093
#define global GL_DOUBLE_EXT                     GL_DOUBLE
#define global GL_BGR_EXT                        0x80E0
#define global GL_BGRA_EXT                       0x80E1
#define global GL_COLOR_TABLE_FORMAT_EXT         0x80D8
#define global GL_COLOR_TABLE_WIDTH_EXT          0x80D9
#define global GL_COLOR_TABLE_RED_SIZE_EXT       0x80DA
#define global GL_COLOR_TABLE_GREEN_SIZE_EXT     0x80DB
#define global GL_COLOR_TABLE_BLUE_SIZE_EXT      0x80DC
#define global GL_COLOR_TABLE_ALPHA_SIZE_EXT     0x80DD
#define global GL_COLOR_TABLE_LUMINANCE_SIZE_EXT 0x80DE
#define global GL_COLOR_TABLE_INTENSITY_SIZE_EXT 0x80DF
#define global GL_COLOR_INDEX1_EXT               0x80E2
#define global GL_COLOR_INDEX2_EXT               0x80E3
#define global GL_COLOR_INDEX4_EXT               0x80E4
#define global GL_COLOR_INDEX8_EXT               0x80E5
#define global GL_COLOR_INDEX12_EXT              0x80E6
#define global GL_COLOR_INDEX16_EXT              0x80E7
#define global GL_MAX_ELEMENTS_VERTICES_WIN      0x80E8
#define global GL_MAX_ELEMENTS_INDICES_WIN       0x80E9
#define global GL_PHONG_WIN                      0x80EA 
#define global GL_PHONG_HINT_WIN                 0x80EB 
#define global GL_FOG_SPECULAR_TEXTURE_WIN       0x80EC
#define global GL_LOGIC_OP GL_INDEX_LOGIC_OP
#define global GL_TEXTURE_COMPONENTS GL_TEXTURE_INTERNAL_FORMAT
#define global GLU_VERSION_1_1                 1
#define global GLU_VERSION_1_2                 1
#define global GLU_INVALID_ENUM        100900
#define global GLU_INVALID_VALUE       100901
#define global GLU_OUT_OF_MEMORY       100902
#define global GLU_INCOMPATIBLE_GL_VERSION     100903
#define global GLU_VERSION             100800
#define global GLU_EXTENSIONS          100801
#define global GLU_TRUE                GL_TRUE
#define global GLU_FALSE               GL_FALSE
#define global GLU_SMOOTH              100000
#define global GLU_FLAT                100001
#define global GLU_NONE                100002
#define global GLU_POINT               100010
#define global GLU_LINE                100011
#define global GLU_FILL                100012
#define global GLU_SILHOUETTE          100013
#define global GLU_OUTSIDE             100020
#define global GLU_INSIDE              100021
#define global GLU_TESS_MAX_COORD              1.0e150
#define global GLU_TESS_WINDING_RULE           100140
#define global GLU_TESS_BOUNDARY_ONLY          100141
#define global GLU_TESS_TOLERANCE              100142
#define global GLU_TESS_WINDING_ODD            100130
#define global GLU_TESS_WINDING_NONZERO        100131
#define global GLU_TESS_WINDING_POSITIVE       100132
#define global GLU_TESS_WINDING_NEGATIVE       100133
#define global GLU_TESS_WINDING_ABS_GEQ_TWO    100134
#define global GLU_TESS_BEGIN          100100
#define global GLU_TESS_VERTEX         100101
#define global GLU_TESS_END            100102
#define global GLU_TESS_ERROR          100103
#define global GLU_TESS_EDGE_FLAG      100104
#define global GLU_TESS_COMBINE        100105
#define global GLU_TESS_BEGIN_DATA     100106
#define global GLU_TESS_VERTEX_DATA    100107
#define global GLU_TESS_END_DATA       100108
#define global GLU_TESS_ERROR_DATA     100109
#define global GLU_TESS_EDGE_FLAG_DATA 100110
#define global GLU_TESS_COMBINE_DATA   100111
#define global GLU_TESS_ERROR1     100151
#define global GLU_TESS_ERROR2     100152
#define global GLU_TESS_ERROR3     100153
#define global GLU_TESS_ERROR4     100154
#define global GLU_TESS_ERROR5     100155
#define global GLU_TESS_ERROR6     100156
#define global GLU_TESS_ERROR7     100157
#define global GLU_TESS_ERROR8     100158
#define global GLU_TESS_MISSING_BEGIN_POLYGON  GLU_TESS_ERROR1
#define global GLU_TESS_MISSING_BEGIN_CONTOUR  GLU_TESS_ERROR2
#define global GLU_TESS_MISSING_END_POLYGON    GLU_TESS_ERROR3
#define global GLU_TESS_MISSING_END_CONTOUR    GLU_TESS_ERROR4
#define global GLU_TESS_COORD_TOO_LARGE        GLU_TESS_ERROR5
#define global GLU_TESS_NEED_COMBINE_CALLBACK  GLU_TESS_ERROR6
#define global GLU_AUTO_LOAD_MATRIX    100200
#define global GLU_CULLING             100201
#define global GLU_SAMPLING_TOLERANCE  100203
#define global GLU_DISPLAY_MODE        100204
#define global GLU_PARAMETRIC_TOLERANCE        100202
#define global GLU_SAMPLING_METHOD             100205
#define global GLU_U_STEP                      100206
#define global GLU_V_STEP                      100207
#define global GLU_PATH_LENGTH                 100215
#define global GLU_PARAMETRIC_ERROR            100216
#define global GLU_DOMAIN_DISTANCE             100217
#define global GLU_MAP1_TRIM_2         100210
#define global GLU_MAP1_TRIM_3         100211
#define global GLU_OUTLINE_POLYGON     100240
#define global GLU_OUTLINE_PATCH       100241
#define global GLU_NURBS_ERROR1        100251
#define global GLU_NURBS_ERROR2        100252
#define global GLU_NURBS_ERROR3        100253
#define global GLU_NURBS_ERROR4        100254
#define global GLU_NURBS_ERROR5        100255
#define global GLU_NURBS_ERROR6        100256
#define global GLU_NURBS_ERROR7        100257
#define global GLU_NURBS_ERROR8        100258
#define global GLU_NURBS_ERROR9        100259
#define global GLU_NURBS_ERROR10       100260
#define global GLU_NURBS_ERROR11       100261
#define global GLU_NURBS_ERROR12       100262
#define global GLU_NURBS_ERROR13       100263
#define global GLU_NURBS_ERROR14       100264
#define global GLU_NURBS_ERROR15       100265
#define global GLU_NURBS_ERROR16       100266
#define global GLU_NURBS_ERROR17       100267
#define global GLU_NURBS_ERROR18       100268
#define global GLU_NURBS_ERROR19       100269
#define global GLU_NURBS_ERROR20       100270
#define global GLU_NURBS_ERROR21       100271
#define global GLU_NURBS_ERROR22       100272
#define global GLU_NURBS_ERROR23       100273
#define global GLU_NURBS_ERROR24       100274
#define global GLU_NURBS_ERROR25       100275
#define global GLU_NURBS_ERROR26       100276
#define global GLU_NURBS_ERROR27       100277
#define global GLU_NURBS_ERROR28       100278
#define global GLU_NURBS_ERROR29       100279
#define global GLU_NURBS_ERROR30       100280
#define global GLU_NURBS_ERROR31       100281
#define global GLU_NURBS_ERROR32       100282
#define global GLU_NURBS_ERROR33       100283
#define global GLU_NURBS_ERROR34       100284
#define global GLU_NURBS_ERROR35       100285
#define global GLU_NURBS_ERROR36       100286
#define global GLU_NURBS_ERROR37       100287
#define global GLU_CW          100120
#define global GLU_CCW         100121
#define global GLU_INTERIOR    100122
#define global GLU_EXTERIOR    100123
#define global GLU_UNKNOWN     100124
#define global GLU_BEGIN       GLU_TESS_BEGIN
#define global GLU_VERTEX      GLU_TESS_VERTEX
#define global GLU_END         GLU_TESS_END
#define global GLU_ERROR       GLU_TESS_ERROR
#define global GLU_EDGE_FLAG   GLU_TESS_EDGE_FLAG
#define global GLEW_APIENTRY_DEFINED
#define global WINGDIAPI __declspec(dllimport)
#define global GLAPIENTRY APIENTRY
#define global GLEWAPI extern
#define global GLAPI extern
#define global GL_VERSION_1_2 1
#define global GL_SMOOTH_POINT_SIZE_RANGE 0x0B12
#define global GL_SMOOTH_POINT_SIZE_GRANULARITY 0x0B13
#define global GL_SMOOTH_LINE_WIDTH_RANGE 0x0B22
#define global GL_SMOOTH_LINE_WIDTH_GRANULARITY 0x0B23
#define global GL_UNSIGNED_BYTE_3_3_2 0x8032
#define global GL_UNSIGNED_SHORT_4_4_4_4 0x8033
#define global GL_UNSIGNED_SHORT_5_5_5_1 0x8034
#define global GL_UNSIGNED_INT_8_8_8_8 0x8035
#define global GL_UNSIGNED_INT_10_10_10_2 0x8036
#define global GL_RESCALE_NORMAL 0x803A
#define global GL_TEXTURE_BINDING_3D 0x806A
#define global GL_PACK_SKIP_IMAGES 0x806B
#define global GL_PACK_IMAGE_HEIGHT 0x806C
#define global GL_UNPACK_SKIP_IMAGES 0x806D
#define global GL_UNPACK_IMAGE_HEIGHT 0x806E
#define global GL_TEXTURE_3D 0x806F
#define global GL_PROXY_TEXTURE_3D 0x8070
#define global GL_TEXTURE_DEPTH 0x8071
#define global GL_TEXTURE_WRAP_R 0x8072
#define global GL_MAX_3D_TEXTURE_SIZE 0x8073
#define global GL_BGR 0x80E0
#define global GL_BGRA 0x80E1
#define global GL_MAX_ELEMENTS_VERTICES 0x80E8
#define global GL_MAX_ELEMENTS_INDICES 0x80E9
#define global GL_CLAMP_TO_EDGE 0x812F
#define global GL_TEXTURE_MIN_LOD 0x813A
#define global GL_TEXTURE_MAX_LOD 0x813B
#define global GL_TEXTURE_BASE_LEVEL 0x813C
#define global GL_TEXTURE_MAX_LEVEL 0x813D
#define global GL_LIGHT_MODEL_COLOR_CONTROL 0x81F8
#define global GL_SINGLE_COLOR 0x81F9
#define global GL_SEPARATE_SPECULAR_COLOR 0x81FA
#define global GL_UNSIGNED_BYTE_2_3_3_REV 0x8362
#define global GL_UNSIGNED_SHORT_5_6_5 0x8363
#define global GL_UNSIGNED_SHORT_5_6_5_REV 0x8364
#define global GL_UNSIGNED_SHORT_4_4_4_4_REV 0x8365
#define global GL_UNSIGNED_SHORT_1_5_5_5_REV 0x8366
#define global GL_UNSIGNED_INT_8_8_8_8_REV 0x8367
#define global GL_UNSIGNED_INT_2_10_10_10_REV 0x8368
#define global GL_ALIASED_POINT_SIZE_RANGE 0x846D
#define global GL_ALIASED_LINE_WIDTH_RANGE 0x846E
#define global GL_VERSION_1_3 1
#define global GL_MULTISAMPLE 0x809D
#define global GL_SAMPLE_ALPHA_TO_COVERAGE 0x809E
#define global GL_SAMPLE_ALPHA_TO_ONE 0x809F
#define global GL_SAMPLE_COVERAGE 0x80A0
#define global GL_SAMPLE_BUFFERS 0x80A8
#define global GL_SAMPLES 0x80A9
#define global GL_SAMPLE_COVERAGE_VALUE 0x80AA
#define global GL_SAMPLE_COVERAGE_INVERT 0x80AB
#define global GL_CLAMP_TO_BORDER 0x812D
#define global GL_TEXTURE0 0x84C0
#define global GL_TEXTURE1 0x84C1
#define global GL_TEXTURE2 0x84C2
#define global GL_TEXTURE3 0x84C3
#define global GL_TEXTURE4 0x84C4
#define global GL_TEXTURE5 0x84C5
#define global GL_TEXTURE6 0x84C6
#define global GL_TEXTURE7 0x84C7
#define global GL_TEXTURE8 0x84C8
#define global GL_TEXTURE9 0x84C9
#define global GL_TEXTURE10 0x84CA
#define global GL_TEXTURE11 0x84CB
#define global GL_TEXTURE12 0x84CC
#define global GL_TEXTURE13 0x84CD
#define global GL_TEXTURE14 0x84CE
#define global GL_TEXTURE15 0x84CF
#define global GL_TEXTURE16 0x84D0
#define global GL_TEXTURE17 0x84D1
#define global GL_TEXTURE18 0x84D2
#define global GL_TEXTURE19 0x84D3
#define global GL_TEXTURE20 0x84D4
#define global GL_TEXTURE21 0x84D5
#define global GL_TEXTURE22 0x84D6
#define global GL_TEXTURE23 0x84D7
#define global GL_TEXTURE24 0x84D8
#define global GL_TEXTURE25 0x84D9
#define global GL_TEXTURE26 0x84DA
#define global GL_TEXTURE27 0x84DB
#define global GL_TEXTURE28 0x84DC
#define global GL_TEXTURE29 0x84DD
#define global GL_TEXTURE30 0x84DE
#define global GL_TEXTURE31 0x84DF
#define global GL_ACTIVE_TEXTURE 0x84E0
#define global GL_CLIENT_ACTIVE_TEXTURE 0x84E1
#define global GL_MAX_TEXTURE_UNITS 0x84E2
#define global GL_TRANSPOSE_MODELVIEW_MATRIX 0x84E3
#define global GL_TRANSPOSE_PROJECTION_MATRIX 0x84E4
#define global GL_TRANSPOSE_TEXTURE_MATRIX 0x84E5
#define global GL_TRANSPOSE_COLOR_MATRIX 0x84E6
#define global GL_SUBTRACT 0x84E7
#define global GL_COMPRESSED_ALPHA 0x84E9
#define global GL_COMPRESSED_LUMINANCE 0x84EA
#define global GL_COMPRESSED_LUMINANCE_ALPHA 0x84EB
#define global GL_COMPRESSED_INTENSITY 0x84EC
#define global GL_COMPRESSED_RGB 0x84ED
#define global GL_COMPRESSED_RGBA 0x84EE
#define global GL_TEXTURE_COMPRESSION_HINT 0x84EF
#define global GL_NORMAL_MAP 0x8511
#define global GL_REFLECTION_MAP 0x8512
#define global GL_TEXTURE_CUBE_MAP 0x8513
#define global GL_TEXTURE_BINDING_CUBE_MAP 0x8514
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_X 0x8515
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_X 0x8516
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_Y 0x8517
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_Y 0x8518
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_Z 0x8519
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_Z 0x851A
#define global GL_PROXY_TEXTURE_CUBE_MAP 0x851B
#define global GL_MAX_CUBE_MAP_TEXTURE_SIZE 0x851C
#define global GL_COMBINE 0x8570
#define global GL_COMBINE_RGB 0x8571
#define global GL_COMBINE_ALPHA 0x8572
#define global GL_RGB_SCALE 0x8573
#define global GL_ADD_SIGNED 0x8574
#define global GL_INTERPOLATE 0x8575
#define global GL_CONSTANT 0x8576
#define global GL_PRIMARY_COLOR 0x8577
#define global GL_PREVIOUS 0x8578
#define global GL_SOURCE0_RGB 0x8580
#define global GL_SOURCE1_RGB 0x8581
#define global GL_SOURCE2_RGB 0x8582
#define global GL_SOURCE0_ALPHA 0x8588
#define global GL_SOURCE1_ALPHA 0x8589
#define global GL_SOURCE2_ALPHA 0x858A
#define global GL_OPERAND0_RGB 0x8590
#define global GL_OPERAND1_RGB 0x8591
#define global GL_OPERAND2_RGB 0x8592
#define global GL_OPERAND0_ALPHA 0x8598
#define global GL_OPERAND1_ALPHA 0x8599
#define global GL_OPERAND2_ALPHA 0x859A
#define global GL_TEXTURE_COMPRESSED_IMAGE_SIZE 0x86A0
#define global GL_TEXTURE_COMPRESSED 0x86A1
#define global GL_NUM_COMPRESSED_TEXTURE_FORMATS 0x86A2
#define global GL_COMPRESSED_TEXTURE_FORMATS 0x86A3
#define global GL_DOT3_RGB 0x86AE
#define global GL_DOT3_RGBA 0x86AF
#define global GL_MULTISAMPLE_BIT 0x20000000
#define global GL_VERSION_1_4 1
#define global GL_BLEND_DST_RGB 0x80C8
#define global GL_BLEND_SRC_RGB 0x80C9
#define global GL_BLEND_DST_ALPHA 0x80CA
#define global GL_BLEND_SRC_ALPHA 0x80CB
#define global GL_POINT_SIZE_MIN 0x8126
#define global GL_POINT_SIZE_MAX 0x8127
#define global GL_POINT_FADE_THRESHOLD_SIZE 0x8128
#define global GL_POINT_DISTANCE_ATTENUATION 0x8129
#define global GL_GENERATE_MIPMAP 0x8191
#define global GL_GENERATE_MIPMAP_HINT 0x8192
#define global GL_DEPTH_COMPONENT16 0x81A5
#define global GL_DEPTH_COMPONENT24 0x81A6
#define global GL_DEPTH_COMPONENT32 0x81A7
#define global GL_MIRRORED_REPEAT 0x8370
#define global GL_FOG_COORDINATE_SOURCE 0x8450
#define global GL_FOG_COORDINATE 0x8451
#define global GL_FRAGMENT_DEPTH 0x8452
#define global GL_CURRENT_FOG_COORDINATE 0x8453
#define global GL_FOG_COORDINATE_ARRAY_TYPE 0x8454
#define global GL_FOG_COORDINATE_ARRAY_STRIDE 0x8455
#define global GL_FOG_COORDINATE_ARRAY_POINTER 0x8456
#define global GL_FOG_COORDINATE_ARRAY 0x8457
#define global GL_COLOR_SUM 0x8458
#define global GL_CURRENT_SECONDARY_COLOR 0x8459
#define global GL_SECONDARY_COLOR_ARRAY_SIZE 0x845A
#define global GL_SECONDARY_COLOR_ARRAY_TYPE 0x845B
#define global GL_SECONDARY_COLOR_ARRAY_STRIDE 0x845C
#define global GL_SECONDARY_COLOR_ARRAY_POINTER 0x845D
#define global GL_SECONDARY_COLOR_ARRAY 0x845E
#define global GL_MAX_TEXTURE_LOD_BIAS 0x84FD
#define global GL_TEXTURE_FILTER_CONTROL 0x8500
#define global GL_TEXTURE_LOD_BIAS 0x8501
#define global GL_INCR_WRAP 0x8507
#define global GL_DECR_WRAP 0x8508
#define global GL_TEXTURE_DEPTH_SIZE 0x884A
#define global GL_DEPTH_TEXTURE_MODE 0x884B
#define global GL_TEXTURE_COMPARE_MODE 0x884C
#define global GL_TEXTURE_COMPARE_FUNC 0x884D
#define global GL_COMPARE_R_TO_TEXTURE 0x884E
#define global GL_VERSION_1_5 1
#define global GL_FOG_COORD_SRC GL_FOG_COORDINATE_SOURCE
#define global GL_FOG_COORD GL_FOG_COORDINATE
#define global GL_FOG_COORD_ARRAY GL_FOG_COORDINATE_ARRAY
#define global GL_SRC0_RGB GL_SOURCE0_RGB
#define global GL_FOG_COORD_ARRAY_POINTER GL_FOG_COORDINATE_ARRAY_POINTER
#define global GL_FOG_COORD_ARRAY_TYPE GL_FOG_COORDINATE_ARRAY_TYPE
#define global GL_SRC1_ALPHA GL_SOURCE1_ALPHA
#define global GL_CURRENT_FOG_COORD GL_CURRENT_FOG_COORDINATE
#define global GL_FOG_COORD_ARRAY_STRIDE GL_FOG_COORDINATE_ARRAY_STRIDE
#define global GL_SRC0_ALPHA GL_SOURCE0_ALPHA
#define global GL_SRC1_RGB GL_SOURCE1_RGB
#define global GL_FOG_COORD_ARRAY_BUFFER_BINDING GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING
#define global GL_SRC2_ALPHA GL_SOURCE2_ALPHA
#define global GL_SRC2_RGB GL_SOURCE2_RGB
#define global GL_BUFFER_SIZE 0x8764
#define global GL_BUFFER_USAGE 0x8765
#define global GL_QUERY_COUNTER_BITS 0x8864
#define global GL_CURRENT_QUERY 0x8865
#define global GL_QUERY_RESULT 0x8866
#define global GL_QUERY_RESULT_AVAILABLE 0x8867
#define global GL_ARRAY_BUFFER 0x8892
#define global GL_ELEMENT_ARRAY_BUFFER 0x8893
#define global GL_ARRAY_BUFFER_BINDING 0x8894
#define global GL_ELEMENT_ARRAY_BUFFER_BINDING 0x8895
#define global GL_VERTEX_ARRAY_BUFFER_BINDING 0x8896
#define global GL_NORMAL_ARRAY_BUFFER_BINDING 0x8897
#define global GL_COLOR_ARRAY_BUFFER_BINDING 0x8898
#define global GL_INDEX_ARRAY_BUFFER_BINDING 0x8899
#define global GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING 0x889A
#define global GL_EDGE_FLAG_ARRAY_BUFFER_BINDING 0x889B
#define global GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING 0x889C
#define global GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING 0x889D
#define global GL_WEIGHT_ARRAY_BUFFER_BINDING 0x889E
#define global GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING 0x889F
#define global GL_READ_ONLY 0x88B8
#define global GL_WRITE_ONLY 0x88B9
#define global GL_READ_WRITE 0x88BA
#define global GL_BUFFER_ACCESS 0x88BB
#define global GL_BUFFER_MAPPED 0x88BC
#define global GL_BUFFER_MAP_POINTER 0x88BD
#define global GL_STREAM_DRAW 0x88E0
#define global GL_STREAM_READ 0x88E1
#define global GL_STREAM_COPY 0x88E2
#define global GL_STATIC_DRAW 0x88E4
#define global GL_STATIC_READ 0x88E5
#define global GL_STATIC_COPY 0x88E6
#define global GL_DYNAMIC_DRAW 0x88E8
#define global GL_DYNAMIC_READ 0x88E9
#define global GL_DYNAMIC_COPY 0x88EA
#define global GL_SAMPLES_PASSED 0x8914
#define global GL_VERSION_2_0 1
#define global GL_BLEND_EQUATION_RGB GL_BLEND_EQUATION
#define global GL_VERTEX_ATTRIB_ARRAY_ENABLED 0x8622
#define global GL_VERTEX_ATTRIB_ARRAY_SIZE 0x8623
#define global GL_VERTEX_ATTRIB_ARRAY_STRIDE 0x8624
#define global GL_VERTEX_ATTRIB_ARRAY_TYPE 0x8625
#define global GL_CURRENT_VERTEX_ATTRIB 0x8626
#define global GL_VERTEX_PROGRAM_POINT_SIZE 0x8642
#define global GL_VERTEX_PROGRAM_TWO_SIDE 0x8643
#define global GL_VERTEX_ATTRIB_ARRAY_POINTER 0x8645
#define global GL_STENCIL_BACK_FUNC 0x8800
#define global GL_STENCIL_BACK_FAIL 0x8801
#define global GL_STENCIL_BACK_PASS_DEPTH_FAIL 0x8802
#define global GL_STENCIL_BACK_PASS_DEPTH_PASS 0x8803
#define global GL_MAX_DRAW_BUFFERS 0x8824
#define global GL_DRAW_BUFFER0 0x8825
#define global GL_DRAW_BUFFER1 0x8826
#define global GL_DRAW_BUFFER2 0x8827
#define global GL_DRAW_BUFFER3 0x8828
#define global GL_DRAW_BUFFER4 0x8829
#define global GL_DRAW_BUFFER5 0x882A
#define global GL_DRAW_BUFFER6 0x882B
#define global GL_DRAW_BUFFER7 0x882C
#define global GL_DRAW_BUFFER8 0x882D
#define global GL_DRAW_BUFFER9 0x882E
#define global GL_DRAW_BUFFER10 0x882F
#define global GL_DRAW_BUFFER11 0x8830
#define global GL_DRAW_BUFFER12 0x8831
#define global GL_DRAW_BUFFER13 0x8832
#define global GL_DRAW_BUFFER14 0x8833
#define global GL_DRAW_BUFFER15 0x8834
#define global GL_BLEND_EQUATION_ALPHA 0x883D
#define global GL_POINT_SPRITE 0x8861
#define global GL_COORD_REPLACE 0x8862
#define global GL_MAX_VERTEX_ATTRIBS 0x8869
#define global GL_VERTEX_ATTRIB_ARRAY_NORMALIZED 0x886A
#define global GL_MAX_TEXTURE_COORDS 0x8871
#define global GL_MAX_TEXTURE_IMAGE_UNITS 0x8872
#define global GL_FRAGMENT_SHADER 0x8B30
#define global GL_VERTEX_SHADER 0x8B31
#define global GL_MAX_FRAGMENT_UNIFORM_COMPONENTS 0x8B49
#define global GL_MAX_VERTEX_UNIFORM_COMPONENTS 0x8B4A
#define global GL_MAX_VARYING_FLOATS 0x8B4B
#define global GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS 0x8B4C
#define global GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS 0x8B4D
#define global GL_SHADER_TYPE 0x8B4F
#define global GL_FLOAT_VEC2 0x8B50
#define global GL_FLOAT_VEC3 0x8B51
#define global GL_FLOAT_VEC4 0x8B52
#define global GL_INT_VEC2 0x8B53
#define global GL_INT_VEC3 0x8B54
#define global GL_INT_VEC4 0x8B55
#define global GL_BOOL 0x8B56
#define global GL_BOOL_VEC2 0x8B57
#define global GL_BOOL_VEC3 0x8B58
#define global GL_BOOL_VEC4 0x8B59
#define global GL_FLOAT_MAT2 0x8B5A
#define global GL_FLOAT_MAT3 0x8B5B
#define global GL_FLOAT_MAT4 0x8B5C
#define global GL_SAMPLER_1D 0x8B5D
#define global GL_SAMPLER_2D 0x8B5E
#define global GL_SAMPLER_3D 0x8B5F
#define global GL_SAMPLER_CUBE 0x8B60
#define global GL_SAMPLER_1D_SHADOW 0x8B61
#define global GL_SAMPLER_2D_SHADOW 0x8B62
#define global GL_DELETE_STATUS 0x8B80
#define global GL_COMPILE_STATUS 0x8B81
#define global GL_LINK_STATUS 0x8B82
#define global GL_VALIDATE_STATUS 0x8B83
#define global GL_INFO_LOG_LENGTH 0x8B84
#define global GL_ATTACHED_SHADERS 0x8B85
#define global GL_ACTIVE_UNIFORMS 0x8B86
#define global GL_ACTIVE_UNIFORM_MAX_LENGTH 0x8B87
#define global GL_SHADER_SOURCE_LENGTH 0x8B88
#define global GL_ACTIVE_ATTRIBUTES 0x8B89
#define global GL_ACTIVE_ATTRIBUTE_MAX_LENGTH 0x8B8A
#define global GL_FRAGMENT_SHADER_DERIVATIVE_HINT 0x8B8B
#define global GL_SHADING_LANGUAGE_VERSION 0x8B8C
#define global GL_CURRENT_PROGRAM 0x8B8D
#define global GL_POINT_SPRITE_COORD_ORIGIN 0x8CA0
#define global GL_LOWER_LEFT 0x8CA1
#define global GL_UPPER_LEFT 0x8CA2
#define global GL_STENCIL_BACK_REF 0x8CA3
#define global GL_STENCIL_BACK_VALUE_MASK 0x8CA4
#define global GL_STENCIL_BACK_WRITEMASK 0x8CA5
#define global GL_VERSION_2_1 1
#define global GL_CURRENT_RASTER_SECONDARY_COLOR 0x845F
#define global GL_PIXEL_PACK_BUFFER 0x88EB
#define global GL_PIXEL_UNPACK_BUFFER 0x88EC
#define global GL_PIXEL_PACK_BUFFER_BINDING 0x88ED
#define global GL_PIXEL_UNPACK_BUFFER_BINDING 0x88EF
#define global GL_FLOAT_MAT2x3 0x8B65
#define global GL_FLOAT_MAT2x4 0x8B66
#define global GL_FLOAT_MAT3x2 0x8B67
#define global GL_FLOAT_MAT3x4 0x8B68
#define global GL_FLOAT_MAT4x2 0x8B69
#define global GL_FLOAT_MAT4x3 0x8B6A
#define global GL_SRGB 0x8C40
#define global GL_SRGB8 0x8C41
#define global GL_SRGB_ALPHA 0x8C42
#define global GL_SRGB8_ALPHA8 0x8C43
#define global GL_SLUMINANCE_ALPHA 0x8C44
#define global GL_SLUMINANCE8_ALPHA8 0x8C45
#define global GL_SLUMINANCE 0x8C46
#define global GL_SLUMINANCE8 0x8C47
#define global GL_COMPRESSED_SRGB 0x8C48
#define global GL_COMPRESSED_SRGB_ALPHA 0x8C49
#define global GL_COMPRESSED_SLUMINANCE 0x8C4A
#define global GL_COMPRESSED_SLUMINANCE_ALPHA 0x8C4B
#define global GL_VERSION_3_0 1
#define global GL_MAX_CLIP_DISTANCES GL_MAX_CLIP_PLANES
#define global GL_CLIP_DISTANCE5 GL_CLIP_PLANE5
#define global GL_CLIP_DISTANCE1 GL_CLIP_PLANE1
#define global GL_CLIP_DISTANCE3 GL_CLIP_PLANE3
#define global GL_COMPARE_REF_TO_TEXTURE GL_COMPARE_R_TO_TEXTURE_ARB
#define global GL_CLIP_DISTANCE0 GL_CLIP_PLANE0
#define global GL_CLIP_DISTANCE4 GL_CLIP_PLANE4
#define global GL_CLIP_DISTANCE2 GL_CLIP_PLANE2
#define global GL_MAX_VARYING_COMPONENTS GL_MAX_VARYING_FLOATS
#define global GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT 0x0001
#define global GL_MAJOR_VERSION 0x821B
#define global GL_MINOR_VERSION 0x821C
#define global GL_NUM_EXTENSIONS 0x821D
#define global GL_CONTEXT_FLAGS 0x821E
#define global GL_DEPTH_BUFFER 0x8223
#define global GL_STENCIL_BUFFER 0x8224
#define global GL_COMPRESSED_RED 0x8225
#define global GL_COMPRESSED_RG 0x8226
#define global GL_RGBA32F 0x8814
#define global GL_RGB32F 0x8815
#define global GL_RGBA16F 0x881A
#define global GL_RGB16F 0x881B
#define global GL_VERTEX_ATTRIB_ARRAY_INTEGER 0x88FD
#define global GL_MAX_ARRAY_TEXTURE_LAYERS 0x88FF
#define global GL_MIN_PROGRAM_TEXEL_OFFSET 0x8904
#define global GL_MAX_PROGRAM_TEXEL_OFFSET 0x8905
#define global GL_CLAMP_VERTEX_COLOR 0x891A
#define global GL_CLAMP_FRAGMENT_COLOR 0x891B
#define global GL_CLAMP_READ_COLOR 0x891C
#define global GL_FIXED_ONLY 0x891D
#define global GL_TEXTURE_RED_TYPE 0x8C10
#define global GL_TEXTURE_GREEN_TYPE 0x8C11
#define global GL_TEXTURE_BLUE_TYPE 0x8C12
#define global GL_TEXTURE_ALPHA_TYPE 0x8C13
#define global GL_TEXTURE_LUMINANCE_TYPE 0x8C14
#define global GL_TEXTURE_INTENSITY_TYPE 0x8C15
#define global GL_TEXTURE_DEPTH_TYPE 0x8C16
#define global GL_UNSIGNED_NORMALIZED 0x8C17
#define global GL_TEXTURE_1D_ARRAY 0x8C18
#define global GL_PROXY_TEXTURE_1D_ARRAY 0x8C19
#define global GL_TEXTURE_2D_ARRAY 0x8C1A
#define global GL_PROXY_TEXTURE_2D_ARRAY 0x8C1B
#define global GL_TEXTURE_BINDING_1D_ARRAY 0x8C1C
#define global GL_TEXTURE_BINDING_2D_ARRAY 0x8C1D
#define global GL_R11F_G11F_B10F 0x8C3A
#define global GL_UNSIGNED_INT_10F_11F_11F_REV 0x8C3B
#define global GL_RGB9_E5 0x8C3D
#define global GL_UNSIGNED_INT_5_9_9_9_REV 0x8C3E
#define global GL_TEXTURE_SHARED_SIZE 0x8C3F
#define global GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH 0x8C76
#define global GL_TRANSFORM_FEEDBACK_BUFFER_MODE 0x8C7F
#define global GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS 0x8C80
#define global GL_TRANSFORM_FEEDBACK_VARYINGS 0x8C83
#define global GL_TRANSFORM_FEEDBACK_BUFFER_START 0x8C84
#define global GL_TRANSFORM_FEEDBACK_BUFFER_SIZE 0x8C85
#define global GL_PRIMITIVES_GENERATED 0x8C87
#define global GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN 0x8C88
#define global GL_RASTERIZER_DISCARD 0x8C89
#define global GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS 0x8C8A
#define global GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS 0x8C8B
#define global GL_INTERLEAVED_ATTRIBS 0x8C8C
#define global GL_SEPARATE_ATTRIBS 0x8C8D
#define global GL_TRANSFORM_FEEDBACK_BUFFER 0x8C8E
#define global GL_TRANSFORM_FEEDBACK_BUFFER_BINDING 0x8C8F
#define global GL_RGBA32UI 0x8D70
#define global GL_RGB32UI 0x8D71
#define global GL_RGBA16UI 0x8D76
#define global GL_RGB16UI 0x8D77
#define global GL_RGBA8UI 0x8D7C
#define global GL_RGB8UI 0x8D7D
#define global GL_RGBA32I 0x8D82
#define global GL_RGB32I 0x8D83
#define global GL_RGBA16I 0x8D88
#define global GL_RGB16I 0x8D89
#define global GL_RGBA8I 0x8D8E
#define global GL_RGB8I 0x8D8F
#define global GL_RED_INTEGER 0x8D94
#define global GL_GREEN_INTEGER 0x8D95
#define global GL_BLUE_INTEGER 0x8D96
#define global GL_ALPHA_INTEGER 0x8D97
#define global GL_RGB_INTEGER 0x8D98
#define global GL_RGBA_INTEGER 0x8D99
#define global GL_BGR_INTEGER 0x8D9A
#define global GL_BGRA_INTEGER 0x8D9B
#define global GL_SAMPLER_1D_ARRAY 0x8DC0
#define global GL_SAMPLER_2D_ARRAY 0x8DC1
#define global GL_SAMPLER_1D_ARRAY_SHADOW 0x8DC3
#define global GL_SAMPLER_2D_ARRAY_SHADOW 0x8DC4
#define global GL_SAMPLER_CUBE_SHADOW 0x8DC5
#define global GL_UNSIGNED_INT_VEC2 0x8DC6
#define global GL_UNSIGNED_INT_VEC3 0x8DC7
#define global GL_UNSIGNED_INT_VEC4 0x8DC8
#define global GL_INT_SAMPLER_1D 0x8DC9
#define global GL_INT_SAMPLER_2D 0x8DCA
#define global GL_INT_SAMPLER_3D 0x8DCB
#define global GL_INT_SAMPLER_CUBE 0x8DCC
#define global GL_INT_SAMPLER_1D_ARRAY 0x8DCE
#define global GL_INT_SAMPLER_2D_ARRAY 0x8DCF
#define global GL_UNSIGNED_INT_SAMPLER_1D 0x8DD1
#define global GL_UNSIGNED_INT_SAMPLER_2D 0x8DD2
#define global GL_UNSIGNED_INT_SAMPLER_3D 0x8DD3
#define global GL_UNSIGNED_INT_SAMPLER_CUBE 0x8DD4
#define global GL_UNSIGNED_INT_SAMPLER_1D_ARRAY 0x8DD6
#define global GL_UNSIGNED_INT_SAMPLER_2D_ARRAY 0x8DD7
#define global GL_QUERY_WAIT 0x8E13
#define global GL_QUERY_NO_WAIT 0x8E14
#define global GL_QUERY_BY_REGION_WAIT 0x8E15
#define global GL_QUERY_BY_REGION_NO_WAIT 0x8E16
#define global GL_3DFX_multisample 1
#define global GL_MULTISAMPLE_3DFX 0x86B2
#define global GL_SAMPLE_BUFFERS_3DFX 0x86B3
#define global GL_SAMPLES_3DFX 0x86B4
#define global GL_MULTISAMPLE_BIT_3DFX 0x20000000
#define global GL_3DFX_tbuffer 1
#define global GL_3DFX_texture_compression_FXT1 1
#define global GL_COMPRESSED_RGB_FXT1_3DFX 0x86B0
#define global GL_COMPRESSED_RGBA_FXT1_3DFX 0x86B1
#define global GL_APPLE_client_storage 1
#define global GL_UNPACK_CLIENT_STORAGE_APPLE 0x85B2
#define global GL_APPLE_element_array 1
#define global GL_ELEMENT_ARRAY_APPLE 0x8768
#define global GL_ELEMENT_ARRAY_TYPE_APPLE 0x8769
#define global GL_ELEMENT_ARRAY_POINTER_APPLE 0x876A
#define global GL_APPLE_fence 1
#define global GL_DRAW_PIXELS_APPLE 0x8A0A
#define global GL_FENCE_APPLE 0x8A0B
#define global GL_APPLE_float_pixels 1
#define global GL_HALF_APPLE 0x140B
#define global GL_RGBA_FLOAT32_APPLE 0x8814
#define global GL_RGB_FLOAT32_APPLE 0x8815
#define global GL_ALPHA_FLOAT32_APPLE 0x8816
#define global GL_INTENSITY_FLOAT32_APPLE 0x8817
#define global GL_LUMINANCE_FLOAT32_APPLE 0x8818
#define global GL_LUMINANCE_ALPHA_FLOAT32_APPLE 0x8819
#define global GL_RGBA_FLOAT16_APPLE 0x881A
#define global GL_RGB_FLOAT16_APPLE 0x881B
#define global GL_ALPHA_FLOAT16_APPLE 0x881C
#define global GL_INTENSITY_FLOAT16_APPLE 0x881D
#define global GL_LUMINANCE_FLOAT16_APPLE 0x881E
#define global GL_LUMINANCE_ALPHA_FLOAT16_APPLE 0x881F
#define global GL_COLOR_FLOAT_APPLE 0x8A0F
#define global GL_APPLE_flush_buffer_range 1
#define global GL_BUFFER_SERIALIZED_MODIFY_APPLE 0x8A12
#define global GL_BUFFER_FLUSHING_UNMAP_APPLE 0x8A13
#define global GL_APPLE_pixel_buffer 1
#define global GL_MIN_PBUFFER_VIEWPORT_DIMS_APPLE 0x8A10
#define global GL_APPLE_specular_vector 1
#define global GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE 0x85B0
#define global GL_APPLE_texture_range 1
#define global GL_TEXTURE_RANGE_LENGTH_APPLE 0x85B7
#define global GL_TEXTURE_RANGE_POINTER_APPLE 0x85B8
#define global GL_TEXTURE_STORAGE_HINT_APPLE 0x85BC
#define global GL_STORAGE_PRIVATE_APPLE 0x85BD
#define global GL_STORAGE_CACHED_APPLE 0x85BE
#define global GL_STORAGE_SHARED_APPLE 0x85BF
#define global GL_APPLE_transform_hint 1
#define global GL_TRANSFORM_HINT_APPLE 0x85B1
#define global GL_APPLE_vertex_array_object 1
#define global GL_VERTEX_ARRAY_BINDING_APPLE 0x85B5
#define global GL_APPLE_vertex_array_range 1
#define global GL_VERTEX_ARRAY_RANGE_APPLE 0x851D
#define global GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE 0x851E
#define global GL_VERTEX_ARRAY_STORAGE_HINT_APPLE 0x851F
#define global GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_APPLE 0x8520
#define global GL_VERTEX_ARRAY_RANGE_POINTER_APPLE 0x8521
#define global GL_APPLE_ycbcr_422 1
#define global GL_YCBCR_422_APPLE 0x85B9
#define global GL_UNSIGNED_SHORT_8_8_APPLE 0x85BA
#define global GL_UNSIGNED_SHORT_8_8_REV_APPLE 0x85BB
#define global GL_ARB_color_buffer_float 1
#define global GL_RGBA_FLOAT_MODE_ARB 0x8820
#define global GL_CLAMP_VERTEX_COLOR_ARB 0x891A
#define global GL_CLAMP_FRAGMENT_COLOR_ARB 0x891B
#define global GL_CLAMP_READ_COLOR_ARB 0x891C
#define global GL_FIXED_ONLY_ARB 0x891D
#define global GL_ARB_depth_buffer_float 1
#define global GL_DEPTH_COMPONENT32F 0x8CAC
#define global GL_DEPTH32F_STENCIL8 0x8CAD
#define global GL_FLOAT_32_UNSIGNED_INT_24_8_REV 0x8DAD
#define global GL_ARB_depth_texture 1
#define global GL_DEPTH_COMPONENT16_ARB 0x81A5
#define global GL_DEPTH_COMPONENT24_ARB 0x81A6
#define global GL_DEPTH_COMPONENT32_ARB 0x81A7
#define global GL_TEXTURE_DEPTH_SIZE_ARB 0x884A
#define global GL_DEPTH_TEXTURE_MODE_ARB 0x884B
#define global GL_ARB_draw_buffers 1
#define global GL_MAX_DRAW_BUFFERS_ARB 0x8824
#define global GL_DRAW_BUFFER0_ARB 0x8825
#define global GL_DRAW_BUFFER1_ARB 0x8826
#define global GL_DRAW_BUFFER2_ARB 0x8827
#define global GL_DRAW_BUFFER3_ARB 0x8828
#define global GL_DRAW_BUFFER4_ARB 0x8829
#define global GL_DRAW_BUFFER5_ARB 0x882A
#define global GL_DRAW_BUFFER6_ARB 0x882B
#define global GL_DRAW_BUFFER7_ARB 0x882C
#define global GL_DRAW_BUFFER8_ARB 0x882D
#define global GL_DRAW_BUFFER9_ARB 0x882E
#define global GL_DRAW_BUFFER10_ARB 0x882F
#define global GL_DRAW_BUFFER11_ARB 0x8830
#define global GL_DRAW_BUFFER12_ARB 0x8831
#define global GL_DRAW_BUFFER13_ARB 0x8832
#define global GL_DRAW_BUFFER14_ARB 0x8833
#define global GL_DRAW_BUFFER15_ARB 0x8834
#define global GL_ARB_draw_instanced 1
#define global GL_ARB_fragment_program 1
#define global GL_FRAGMENT_PROGRAM_ARB 0x8804
#define global GL_PROGRAM_ALU_INSTRUCTIONS_ARB 0x8805
#define global GL_PROGRAM_TEX_INSTRUCTIONS_ARB 0x8806
#define global GL_PROGRAM_TEX_INDIRECTIONS_ARB 0x8807
#define global GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB 0x8808
#define global GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB 0x8809
#define global GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB 0x880A
#define global GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB 0x880B
#define global GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB 0x880C
#define global GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB 0x880D
#define global GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB 0x880E
#define global GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB 0x880F
#define global GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB 0x8810
#define global GL_MAX_TEXTURE_COORDS_ARB 0x8871
#define global GL_MAX_TEXTURE_IMAGE_UNITS_ARB 0x8872
#define global GL_ARB_fragment_program_shadow 1
#define global GL_ARB_fragment_shader 1
#define global GL_FRAGMENT_SHADER_ARB 0x8B30
#define global GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB 0x8B49
#define global GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB 0x8B8B
#define global GL_ARB_framebuffer_object 1
#define global GL_INVALID_FRAMEBUFFER_OPERATION 0x0506
#define global GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING 0x8210
#define global GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE 0x8211
#define global GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE 0x8212
#define global GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE 0x8213
#define global GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE 0x8214
#define global GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE 0x8215
#define global GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE 0x8216
#define global GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE 0x8217
#define global GL_FRAMEBUFFER_DEFAULT 0x8218
#define global GL_FRAMEBUFFER_UNDEFINED 0x8219
#define global GL_DEPTH_STENCIL_ATTACHMENT 0x821A
#define global GL_INDEX 0x8222
#define global GL_MAX_RENDERBUFFER_SIZE 0x84E8
#define global GL_DEPTH_STENCIL 0x84F9
#define global GL_UNSIGNED_INT_24_8 0x84FA
#define global GL_DEPTH24_STENCIL8 0x88F0
#define global GL_TEXTURE_STENCIL_SIZE 0x88F1
#define global GL_DRAW_FRAMEBUFFER_BINDING 0x8CA6
#define global GL_FRAMEBUFFER_BINDING 0x8CA6
#define global GL_RENDERBUFFER_BINDING 0x8CA7
#define global GL_READ_FRAMEBUFFER 0x8CA8
#define global GL_DRAW_FRAMEBUFFER 0x8CA9
#define global GL_READ_FRAMEBUFFER_BINDING 0x8CAA
#define global GL_RENDERBUFFER_SAMPLES 0x8CAB
#define global GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE 0x8CD0
#define global GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME 0x8CD1
#define global GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL 0x8CD2
#define global GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE 0x8CD3
#define global GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER 0x8CD4
#define global GL_FRAMEBUFFER_COMPLETE 0x8CD5
#define global GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT 0x8CD6
#define global GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT 0x8CD7
#define global GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER 0x8CDB
#define global GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER 0x8CDC
#define global GL_FRAMEBUFFER_UNSUPPORTED 0x8CDD
#define global GL_MAX_COLOR_ATTACHMENTS 0x8CDF
#define global GL_COLOR_ATTACHMENT0 0x8CE0
#define global GL_COLOR_ATTACHMENT1 0x8CE1
#define global GL_COLOR_ATTACHMENT2 0x8CE2
#define global GL_COLOR_ATTACHMENT3 0x8CE3
#define global GL_COLOR_ATTACHMENT4 0x8CE4
#define global GL_COLOR_ATTACHMENT5 0x8CE5
#define global GL_COLOR_ATTACHMENT6 0x8CE6
#define global GL_COLOR_ATTACHMENT7 0x8CE7
#define global GL_COLOR_ATTACHMENT8 0x8CE8
#define global GL_COLOR_ATTACHMENT9 0x8CE9
#define global GL_COLOR_ATTACHMENT10 0x8CEA
#define global GL_COLOR_ATTACHMENT11 0x8CEB
#define global GL_COLOR_ATTACHMENT12 0x8CEC
#define global GL_COLOR_ATTACHMENT13 0x8CED
#define global GL_COLOR_ATTACHMENT14 0x8CEE
#define global GL_COLOR_ATTACHMENT15 0x8CEF
#define global GL_DEPTH_ATTACHMENT 0x8D00
#define global GL_STENCIL_ATTACHMENT 0x8D20
#define global GL_FRAMEBUFFER 0x8D40
#define global GL_RENDERBUFFER 0x8D41
#define global GL_RENDERBUFFER_WIDTH 0x8D42
#define global GL_RENDERBUFFER_HEIGHT 0x8D43
#define global GL_RENDERBUFFER_INTERNAL_FORMAT 0x8D44
#define global GL_STENCIL_INDEX1 0x8D46
#define global GL_STENCIL_INDEX4 0x8D47
#define global GL_STENCIL_INDEX8 0x8D48
#define global GL_STENCIL_INDEX16 0x8D49
#define global GL_RENDERBUFFER_RED_SIZE 0x8D50
#define global GL_RENDERBUFFER_GREEN_SIZE 0x8D51
#define global GL_RENDERBUFFER_BLUE_SIZE 0x8D52
#define global GL_RENDERBUFFER_ALPHA_SIZE 0x8D53
#define global GL_RENDERBUFFER_DEPTH_SIZE 0x8D54
#define global GL_RENDERBUFFER_STENCIL_SIZE 0x8D55
#define global GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE 0x8D56
#define global GL_MAX_SAMPLES 0x8D57
#define global GL_ARB_framebuffer_sRGB 1
#define global GL_FRAMEBUFFER_SRGB 0x8DB9
#define global GL_ARB_geometry_shader4 1
#define global GL_LINES_ADJACENCY_ARB 0xA
#define global GL_LINE_STRIP_ADJACENCY_ARB 0xB
#define global GL_TRIANGLES_ADJACENCY_ARB 0xC
#define global GL_TRIANGLE_STRIP_ADJACENCY_ARB 0xD
#define global GL_PROGRAM_POINT_SIZE_ARB 0x8642
#define global GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB 0x8C29
#define global GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB 0x8DA7
#define global GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB 0x8DA8
#define global GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB 0x8DA9
#define global GL_GEOMETRY_SHADER_ARB 0x8DD9
#define global GL_GEOMETRY_VERTICES_OUT_ARB 0x8DDA
#define global GL_GEOMETRY_INPUT_TYPE_ARB 0x8DDB
#define global GL_GEOMETRY_OUTPUT_TYPE_ARB 0x8DDC
#define global GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB 0x8DDD
#define global GL_MAX_VERTEX_VARYING_COMPONENTS_ARB 0x8DDE
#define global GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB 0x8DDF
#define global GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB 0x8DE0
#define global GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB 0x8DE1
#define global GL_ARB_half_float_pixel 1
#define global GL_HALF_FLOAT_ARB 0x140B
#define global GL_ARB_half_float_vertex 1
#define global GL_HALF_FLOAT 0x140B
#define global GL_ARB_imaging 1
#define global GL_CONSTANT_COLOR 0x8001
#define global GL_ONE_MINUS_CONSTANT_COLOR 0x8002
#define global GL_CONSTANT_ALPHA 0x8003
#define global GL_ONE_MINUS_CONSTANT_ALPHA 0x8004
#define global GL_BLEND_COLOR 0x8005
#define global GL_FUNC_ADD 0x8006
#define global GL_MIN 0x8007
#define global GL_MAX 0x8008
#define global GL_BLEND_EQUATION 0x8009
#define global GL_FUNC_SUBTRACT 0x800A
#define global GL_FUNC_REVERSE_SUBTRACT 0x800B
#define global GL_CONVOLUTION_1D 0x8010
#define global GL_CONVOLUTION_2D 0x8011
#define global GL_SEPARABLE_2D 0x8012
#define global GL_CONVOLUTION_BORDER_MODE 0x8013
#define global GL_CONVOLUTION_FILTER_SCALE 0x8014
#define global GL_CONVOLUTION_FILTER_BIAS 0x8015
#define global GL_REDUCE 0x8016
#define global GL_CONVOLUTION_FORMAT 0x8017
#define global GL_CONVOLUTION_WIDTH 0x8018
#define global GL_CONVOLUTION_HEIGHT 0x8019
#define global GL_MAX_CONVOLUTION_WIDTH 0x801A
#define global GL_MAX_CONVOLUTION_HEIGHT 0x801B
#define global GL_POST_CONVOLUTION_RED_SCALE 0x801C
#define global GL_POST_CONVOLUTION_GREEN_SCALE 0x801D
#define global GL_POST_CONVOLUTION_BLUE_SCALE 0x801E
#define global GL_POST_CONVOLUTION_ALPHA_SCALE 0x801F
#define global GL_POST_CONVOLUTION_RED_BIAS 0x8020
#define global GL_POST_CONVOLUTION_GREEN_BIAS 0x8021
#define global GL_POST_CONVOLUTION_BLUE_BIAS 0x8022
#define global GL_POST_CONVOLUTION_ALPHA_BIAS 0x8023
#define global GL_HISTOGRAM 0x8024
#define global GL_PROXY_HISTOGRAM 0x8025
#define global GL_HISTOGRAM_WIDTH 0x8026
#define global GL_HISTOGRAM_FORMAT 0x8027
#define global GL_HISTOGRAM_RED_SIZE 0x8028
#define global GL_HISTOGRAM_GREEN_SIZE 0x8029
#define global GL_HISTOGRAM_BLUE_SIZE 0x802A
#define global GL_HISTOGRAM_ALPHA_SIZE 0x802B
#define global GL_HISTOGRAM_LUMINANCE_SIZE 0x802C
#define global GL_HISTOGRAM_SINK 0x802D
#define global GL_MINMAX 0x802E
#define global GL_MINMAX_FORMAT 0x802F
#define global GL_MINMAX_SINK 0x8030
#define global GL_TABLE_TOO_LARGE 0x8031
#define global GL_COLOR_MATRIX 0x80B1
#define global GL_COLOR_MATRIX_STACK_DEPTH 0x80B2
#define global GL_MAX_COLOR_MATRIX_STACK_DEPTH 0x80B3
#define global GL_POST_COLOR_MATRIX_RED_SCALE 0x80B4
#define global GL_POST_COLOR_MATRIX_GREEN_SCALE 0x80B5
#define global GL_POST_COLOR_MATRIX_BLUE_SCALE 0x80B6
#define global GL_POST_COLOR_MATRIX_ALPHA_SCALE 0x80B7
#define global GL_POST_COLOR_MATRIX_RED_BIAS 0x80B8
#define global GL_POST_COLOR_MATRIX_GREEN_BIAS 0x80B9
#define global GL_POST_COLOR_MATRIX_BLUE_BIAS 0x80BA
#define global GL_POST_COLOR_MATRIX_ALPHA_BIAS 0x80BB
#define global GL_COLOR_TABLE 0x80D0
#define global GL_POST_CONVOLUTION_COLOR_TABLE 0x80D1
#define global GL_POST_COLOR_MATRIX_COLOR_TABLE 0x80D2
#define global GL_PROXY_COLOR_TABLE 0x80D3
#define global GL_PROXY_POST_CONVOLUTION_COLOR_TABLE 0x80D4
#define global GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE 0x80D5
#define global GL_COLOR_TABLE_SCALE 0x80D6
#define global GL_COLOR_TABLE_BIAS 0x80D7
#define global GL_COLOR_TABLE_FORMAT 0x80D8
#define global GL_COLOR_TABLE_WIDTH 0x80D9
#define global GL_COLOR_TABLE_RED_SIZE 0x80DA
#define global GL_COLOR_TABLE_GREEN_SIZE 0x80DB
#define global GL_COLOR_TABLE_BLUE_SIZE 0x80DC
#define global GL_COLOR_TABLE_ALPHA_SIZE 0x80DD
#define global GL_COLOR_TABLE_LUMINANCE_SIZE 0x80DE
#define global GL_COLOR_TABLE_INTENSITY_SIZE 0x80DF
#define global GL_IGNORE_BORDER 0x8150
#define global GL_CONSTANT_BORDER 0x8151
#define global GL_WRAP_BORDER 0x8152
#define global GL_REPLICATE_BORDER 0x8153
#define global GL_CONVOLUTION_BORDER_COLOR 0x8154
#define global GL_ARB_instanced_arrays 1
#define global GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB 0x88FE
#define global GL_ARB_map_buffer_range 1
#define global GL_MAP_READ_BIT 0x0001
#define global GL_MAP_WRITE_BIT 0x0002
#define global GL_MAP_INVALIDATE_RANGE_BIT 0x0004
#define global GL_MAP_INVALIDATE_BUFFER_BIT 0x0008
#define global GL_MAP_FLUSH_EXPLICIT_BIT 0x0010
#define global GL_MAP_UNSYNCHRONIZED_BIT 0x0020
#define global GL_ARB_matrix_palette 1
#define global GL_MATRIX_PALETTE_ARB 0x8840
#define global GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB 0x8841
#define global GL_MAX_PALETTE_MATRICES_ARB 0x8842
#define global GL_CURRENT_PALETTE_MATRIX_ARB 0x8843
#define global GL_MATRIX_INDEX_ARRAY_ARB 0x8844
#define global GL_CURRENT_MATRIX_INDEX_ARB 0x8845
#define global GL_MATRIX_INDEX_ARRAY_SIZE_ARB 0x8846
#define global GL_MATRIX_INDEX_ARRAY_TYPE_ARB 0x8847
#define global GL_MATRIX_INDEX_ARRAY_STRIDE_ARB 0x8848
#define global GL_MATRIX_INDEX_ARRAY_POINTER_ARB 0x8849
#define global GL_ARB_multisample 1
#define global GL_MULTISAMPLE_ARB 0x809D
#define global GL_SAMPLE_ALPHA_TO_COVERAGE_ARB 0x809E
#define global GL_SAMPLE_ALPHA_TO_ONE_ARB 0x809F
#define global GL_SAMPLE_COVERAGE_ARB 0x80A0
#define global GL_SAMPLE_BUFFERS_ARB 0x80A8
#define global GL_SAMPLES_ARB 0x80A9
#define global GL_SAMPLE_COVERAGE_VALUE_ARB 0x80AA
#define global GL_SAMPLE_COVERAGE_INVERT_ARB 0x80AB
#define global GL_MULTISAMPLE_BIT_ARB 0x20000000
#define global GL_ARB_multitexture 1
#define global GL_TEXTURE0_ARB 0x84C0
#define global GL_TEXTURE1_ARB 0x84C1
#define global GL_TEXTURE2_ARB 0x84C2
#define global GL_TEXTURE3_ARB 0x84C3
#define global GL_TEXTURE4_ARB 0x84C4
#define global GL_TEXTURE5_ARB 0x84C5
#define global GL_TEXTURE6_ARB 0x84C6
#define global GL_TEXTURE7_ARB 0x84C7
#define global GL_TEXTURE8_ARB 0x84C8
#define global GL_TEXTURE9_ARB 0x84C9
#define global GL_TEXTURE10_ARB 0x84CA
#define global GL_TEXTURE11_ARB 0x84CB
#define global GL_TEXTURE12_ARB 0x84CC
#define global GL_TEXTURE13_ARB 0x84CD
#define global GL_TEXTURE14_ARB 0x84CE
#define global GL_TEXTURE15_ARB 0x84CF
#define global GL_TEXTURE16_ARB 0x84D0
#define global GL_TEXTURE17_ARB 0x84D1
#define global GL_TEXTURE18_ARB 0x84D2
#define global GL_TEXTURE19_ARB 0x84D3
#define global GL_TEXTURE20_ARB 0x84D4
#define global GL_TEXTURE21_ARB 0x84D5
#define global GL_TEXTURE22_ARB 0x84D6
#define global GL_TEXTURE23_ARB 0x84D7
#define global GL_TEXTURE24_ARB 0x84D8
#define global GL_TEXTURE25_ARB 0x84D9
#define global GL_TEXTURE26_ARB 0x84DA
#define global GL_TEXTURE27_ARB 0x84DB
#define global GL_TEXTURE28_ARB 0x84DC
#define global GL_TEXTURE29_ARB 0x84DD
#define global GL_TEXTURE30_ARB 0x84DE
#define global GL_TEXTURE31_ARB 0x84DF
#define global GL_ACTIVE_TEXTURE_ARB 0x84E0
#define global GL_CLIENT_ACTIVE_TEXTURE_ARB 0x84E1
#define global GL_MAX_TEXTURE_UNITS_ARB 0x84E2
#define global GL_ARB_occlusion_query 1
#define global GL_QUERY_COUNTER_BITS_ARB 0x8864
#define global GL_CURRENT_QUERY_ARB 0x8865
#define global GL_QUERY_RESULT_ARB 0x8866
#define global GL_QUERY_RESULT_AVAILABLE_ARB 0x8867
#define global GL_SAMPLES_PASSED_ARB 0x8914
#define global GL_ARB_pixel_buffer_object 1
#define global GL_PIXEL_PACK_BUFFER_ARB 0x88EB
#define global GL_PIXEL_UNPACK_BUFFER_ARB 0x88EC
#define global GL_PIXEL_PACK_BUFFER_BINDING_ARB 0x88ED
#define global GL_PIXEL_UNPACK_BUFFER_BINDING_ARB 0x88EF
#define global GL_ARB_point_parameters 1
#define global GL_POINT_SIZE_MIN_ARB 0x8126
#define global GL_POINT_SIZE_MAX_ARB 0x8127
#define global GL_POINT_FADE_THRESHOLD_SIZE_ARB 0x8128
#define global GL_POINT_DISTANCE_ATTENUATION_ARB 0x8129
#define global GL_ARB_point_sprite 1
#define global GL_POINT_SPRITE_ARB 0x8861
#define global GL_COORD_REPLACE_ARB 0x8862
#define global GL_ARB_shader_objects 1
#define global GL_PROGRAM_OBJECT_ARB 0x8B40
#define global GL_SHADER_OBJECT_ARB 0x8B48
#define global GL_OBJECT_TYPE_ARB 0x8B4E
#define global GL_OBJECT_SUBTYPE_ARB 0x8B4F
#define global GL_FLOAT_VEC2_ARB 0x8B50
#define global GL_FLOAT_VEC3_ARB 0x8B51
#define global GL_FLOAT_VEC4_ARB 0x8B52
#define global GL_INT_VEC2_ARB 0x8B53
#define global GL_INT_VEC3_ARB 0x8B54
#define global GL_INT_VEC4_ARB 0x8B55
#define global GL_BOOL_ARB 0x8B56
#define global GL_BOOL_VEC2_ARB 0x8B57
#define global GL_BOOL_VEC3_ARB 0x8B58
#define global GL_BOOL_VEC4_ARB 0x8B59
#define global GL_FLOAT_MAT2_ARB 0x8B5A
#define global GL_FLOAT_MAT3_ARB 0x8B5B
#define global GL_FLOAT_MAT4_ARB 0x8B5C
#define global GL_SAMPLER_1D_ARB 0x8B5D
#define global GL_SAMPLER_2D_ARB 0x8B5E
#define global GL_SAMPLER_3D_ARB 0x8B5F
#define global GL_SAMPLER_CUBE_ARB 0x8B60
#define global GL_SAMPLER_1D_SHADOW_ARB 0x8B61
#define global GL_SAMPLER_2D_SHADOW_ARB 0x8B62
#define global GL_SAMPLER_2D_RECT_ARB 0x8B63
#define global GL_SAMPLER_2D_RECT_SHADOW_ARB 0x8B64
#define global GL_OBJECT_DELETE_STATUS_ARB 0x8B80
#define global GL_OBJECT_COMPILE_STATUS_ARB 0x8B81
#define global GL_OBJECT_LINK_STATUS_ARB 0x8B82
#define global GL_OBJECT_VALIDATE_STATUS_ARB 0x8B83
#define global GL_OBJECT_INFO_LOG_LENGTH_ARB 0x8B84
#define global GL_OBJECT_ATTACHED_OBJECTS_ARB 0x8B85
#define global GL_OBJECT_ACTIVE_UNIFORMS_ARB 0x8B86
#define global GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB 0x8B87
#define global GL_OBJECT_SHADER_SOURCE_LENGTH_ARB 0x8B88
#define global GL_ARB_shading_language_100 1
#define global GL_SHADING_LANGUAGE_VERSION_ARB 0x8B8C
#define global GL_ARB_shadow 1
#define global GL_TEXTURE_COMPARE_MODE_ARB 0x884C
#define global GL_TEXTURE_COMPARE_FUNC_ARB 0x884D
#define global GL_COMPARE_R_TO_TEXTURE_ARB 0x884E
#define global GL_ARB_shadow_ambient 1
#define global GL_TEXTURE_COMPARE_FAIL_VALUE_ARB 0x80BF
#define global GL_ARB_texture_border_clamp 1
#define global GL_CLAMP_TO_BORDER_ARB 0x812D
#define global GL_ARB_texture_buffer_object 1
#define global GL_TEXTURE_BUFFER_ARB 0x8C2A
#define global GL_MAX_TEXTURE_BUFFER_SIZE_ARB 0x8C2B
#define global GL_TEXTURE_BINDING_BUFFER_ARB 0x8C2C
#define global GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB 0x8C2D
#define global GL_TEXTURE_BUFFER_FORMAT_ARB 0x8C2E
#define global GL_ARB_texture_compression 1
#define global GL_COMPRESSED_ALPHA_ARB 0x84E9
#define global GL_COMPRESSED_LUMINANCE_ARB 0x84EA
#define global GL_COMPRESSED_LUMINANCE_ALPHA_ARB 0x84EB
#define global GL_COMPRESSED_INTENSITY_ARB 0x84EC
#define global GL_COMPRESSED_RGB_ARB 0x84ED
#define global GL_COMPRESSED_RGBA_ARB 0x84EE
#define global GL_TEXTURE_COMPRESSION_HINT_ARB 0x84EF
#define global GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB 0x86A0
#define global GL_TEXTURE_COMPRESSED_ARB 0x86A1
#define global GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB 0x86A2
#define global GL_COMPRESSED_TEXTURE_FORMATS_ARB 0x86A3
#define global GL_ARB_texture_compression_rgtc 1
#define global GL_COMPRESSED_RED_RGTC1 0x8DBB
#define global GL_COMPRESSED_SIGNED_RED_RGTC1 0x8DBC
#define global GL_COMPRESSED_RG_RGTC2 0x8DBD
#define global GL_COMPRESSED_SIGNED_RG_RGTC2 0x8DBE
#define global GL_ARB_texture_cube_map 1
#define global GL_NORMAL_MAP_ARB 0x8511
#define global GL_REFLECTION_MAP_ARB 0x8512
#define global GL_TEXTURE_CUBE_MAP_ARB 0x8513
#define global GL_TEXTURE_BINDING_CUBE_MAP_ARB 0x8514
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB 0x8515
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB 0x8516
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB 0x8517
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB 0x8518
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB 0x8519
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB 0x851A
#define global GL_PROXY_TEXTURE_CUBE_MAP_ARB 0x851B
#define global GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB 0x851C
#define global GL_ARB_texture_env_add 1
#define global GL_ARB_texture_env_combine 1
#define global GL_SUBTRACT_ARB 0x84E7
#define global GL_COMBINE_ARB 0x8570
#define global GL_COMBINE_RGB_ARB 0x8571
#define global GL_COMBINE_ALPHA_ARB 0x8572
#define global GL_RGB_SCALE_ARB 0x8573
#define global GL_ADD_SIGNED_ARB 0x8574
#define global GL_INTERPOLATE_ARB 0x8575
#define global GL_CONSTANT_ARB 0x8576
#define global GL_PRIMARY_COLOR_ARB 0x8577
#define global GL_PREVIOUS_ARB 0x8578
#define global GL_SOURCE0_RGB_ARB 0x8580
#define global GL_SOURCE1_RGB_ARB 0x8581
#define global GL_SOURCE2_RGB_ARB 0x8582
#define global GL_SOURCE0_ALPHA_ARB 0x8588
#define global GL_SOURCE1_ALPHA_ARB 0x8589
#define global GL_SOURCE2_ALPHA_ARB 0x858A
#define global GL_OPERAND0_RGB_ARB 0x8590
#define global GL_OPERAND1_RGB_ARB 0x8591
#define global GL_OPERAND2_RGB_ARB 0x8592
#define global GL_OPERAND0_ALPHA_ARB 0x8598
#define global GL_OPERAND1_ALPHA_ARB 0x8599
#define global GL_OPERAND2_ALPHA_ARB 0x859A
#define global GL_ARB_texture_env_crossbar 1
#define global GL_ARB_texture_env_dot3 1
#define global GL_DOT3_RGB_ARB 0x86AE
#define global GL_DOT3_RGBA_ARB 0x86AF
#define global GL_ARB_texture_float 1
#define global GL_RGBA32F_ARB 0x8814
#define global GL_RGB32F_ARB 0x8815
#define global GL_ALPHA32F_ARB 0x8816
#define global GL_INTENSITY32F_ARB 0x8817
#define global GL_LUMINANCE32F_ARB 0x8818
#define global GL_LUMINANCE_ALPHA32F_ARB 0x8819
#define global GL_RGBA16F_ARB 0x881A
#define global GL_RGB16F_ARB 0x881B
#define global GL_ALPHA16F_ARB 0x881C
#define global GL_INTENSITY16F_ARB 0x881D
#define global GL_LUMINANCE16F_ARB 0x881E
#define global GL_LUMINANCE_ALPHA16F_ARB 0x881F
#define global GL_TEXTURE_RED_TYPE_ARB 0x8C10
#define global GL_TEXTURE_GREEN_TYPE_ARB 0x8C11
#define global GL_TEXTURE_BLUE_TYPE_ARB 0x8C12
#define global GL_TEXTURE_ALPHA_TYPE_ARB 0x8C13
#define global GL_TEXTURE_LUMINANCE_TYPE_ARB 0x8C14
#define global GL_TEXTURE_INTENSITY_TYPE_ARB 0x8C15
#define global GL_TEXTURE_DEPTH_TYPE_ARB 0x8C16
#define global GL_UNSIGNED_NORMALIZED_ARB 0x8C17
#define global GL_ARB_texture_mirrored_repeat 1
#define global GL_MIRRORED_REPEAT_ARB 0x8370
#define global GL_ARB_texture_non_power_of_two 1
#define global GL_ARB_texture_rectangle 1
#define global GL_TEXTURE_RECTANGLE_ARB 0x84F5
#define global GL_TEXTURE_BINDING_RECTANGLE_ARB 0x84F6
#define global GL_PROXY_TEXTURE_RECTANGLE_ARB 0x84F7
#define global GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB 0x84F8
#define global GL_ARB_texture_rg 1
#define global GL_RG 0x8227
#define global GL_RG_INTEGER 0x8228
#define global GL_R8 0x8229
#define global GL_R16 0x822A
#define global GL_RG8 0x822B
#define global GL_RG16 0x822C
#define global GL_R16F 0x822D
#define global GL_R32F 0x822E
#define global GL_RG16F 0x822F
#define global GL_RG32F 0x8230
#define global GL_R8I 0x8231
#define global GL_R8UI 0x8232
#define global GL_R16I 0x8233
#define global GL_R16UI 0x8234
#define global GL_R32I 0x8235
#define global GL_R32UI 0x8236
#define global GL_RG8I 0x8237
#define global GL_RG8UI 0x8238
#define global GL_RG16I 0x8239
#define global GL_RG16UI 0x823A
#define global GL_RG32I 0x823B
#define global GL_RG32UI 0x823C
#define global GL_ARB_transpose_matrix 1
#define global GL_TRANSPOSE_MODELVIEW_MATRIX_ARB 0x84E3
#define global GL_TRANSPOSE_PROJECTION_MATRIX_ARB 0x84E4
#define global GL_TRANSPOSE_TEXTURE_MATRIX_ARB 0x84E5
#define global GL_TRANSPOSE_COLOR_MATRIX_ARB 0x84E6
#define global GL_ARB_vertex_array_object 1
#define global GL_VERTEX_ARRAY_BINDING 0x85B5
#define global GL_ARB_vertex_blend 1
#define global GL_MODELVIEW0_ARB 0x1700
#define global GL_MODELVIEW1_ARB 0x850A
#define global GL_MAX_VERTEX_UNITS_ARB 0x86A4
#define global GL_ACTIVE_VERTEX_UNITS_ARB 0x86A5
#define global GL_WEIGHT_SUM_UNITY_ARB 0x86A6
#define global GL_VERTEX_BLEND_ARB 0x86A7
#define global GL_CURRENT_WEIGHT_ARB 0x86A8
#define global GL_WEIGHT_ARRAY_TYPE_ARB 0x86A9
#define global GL_WEIGHT_ARRAY_STRIDE_ARB 0x86AA
#define global GL_WEIGHT_ARRAY_SIZE_ARB 0x86AB
#define global GL_WEIGHT_ARRAY_POINTER_ARB 0x86AC
#define global GL_WEIGHT_ARRAY_ARB 0x86AD
#define global GL_MODELVIEW2_ARB 0x8722
#define global GL_MODELVIEW3_ARB 0x8723
#define global GL_MODELVIEW4_ARB 0x8724
#define global GL_MODELVIEW5_ARB 0x8725
#define global GL_MODELVIEW6_ARB 0x8726
#define global GL_MODELVIEW7_ARB 0x8727
#define global GL_MODELVIEW8_ARB 0x8728
#define global GL_MODELVIEW9_ARB 0x8729
#define global GL_MODELVIEW10_ARB 0x872A
#define global GL_MODELVIEW11_ARB 0x872B
#define global GL_MODELVIEW12_ARB 0x872C
#define global GL_MODELVIEW13_ARB 0x872D
#define global GL_MODELVIEW14_ARB 0x872E
#define global GL_MODELVIEW15_ARB 0x872F
#define global GL_MODELVIEW16_ARB 0x8730
#define global GL_MODELVIEW17_ARB 0x8731
#define global GL_MODELVIEW18_ARB 0x8732
#define global GL_MODELVIEW19_ARB 0x8733
#define global GL_MODELVIEW20_ARB 0x8734
#define global GL_MODELVIEW21_ARB 0x8735
#define global GL_MODELVIEW22_ARB 0x8736
#define global GL_MODELVIEW23_ARB 0x8737
#define global GL_MODELVIEW24_ARB 0x8738
#define global GL_MODELVIEW25_ARB 0x8739
#define global GL_MODELVIEW26_ARB 0x873A
#define global GL_MODELVIEW27_ARB 0x873B
#define global GL_MODELVIEW28_ARB 0x873C
#define global GL_MODELVIEW29_ARB 0x873D
#define global GL_MODELVIEW30_ARB 0x873E
#define global GL_MODELVIEW31_ARB 0x873F
#define global GL_ARB_vertex_buffer_object 1
#define global GL_BUFFER_SIZE_ARB 0x8764
#define global GL_BUFFER_USAGE_ARB 0x8765
#define global GL_ARRAY_BUFFER_ARB 0x8892
#define global GL_ELEMENT_ARRAY_BUFFER_ARB 0x8893
#define global GL_ARRAY_BUFFER_BINDING_ARB 0x8894
#define global GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB 0x8895
#define global GL_VERTEX_ARRAY_BUFFER_BINDING_ARB 0x8896
#define global GL_NORMAL_ARRAY_BUFFER_BINDING_ARB 0x8897
#define global GL_COLOR_ARRAY_BUFFER_BINDING_ARB 0x8898
#define global GL_INDEX_ARRAY_BUFFER_BINDING_ARB 0x8899
#define global GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB 0x889A
#define global GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB 0x889B
#define global GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB 0x889C
#define global GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB 0x889D
#define global GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB 0x889E
#define global GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB 0x889F
#define global GL_READ_ONLY_ARB 0x88B8
#define global GL_WRITE_ONLY_ARB 0x88B9
#define global GL_READ_WRITE_ARB 0x88BA
#define global GL_BUFFER_ACCESS_ARB 0x88BB
#define global GL_BUFFER_MAPPED_ARB 0x88BC
#define global GL_BUFFER_MAP_POINTER_ARB 0x88BD
#define global GL_STREAM_DRAW_ARB 0x88E0
#define global GL_STREAM_READ_ARB 0x88E1
#define global GL_STREAM_COPY_ARB 0x88E2
#define global GL_STATIC_DRAW_ARB 0x88E4
#define global GL_STATIC_READ_ARB 0x88E5
#define global GL_STATIC_COPY_ARB 0x88E6
#define global GL_DYNAMIC_DRAW_ARB 0x88E8
#define global GL_DYNAMIC_READ_ARB 0x88E9
#define global GL_DYNAMIC_COPY_ARB 0x88EA
#define global GL_ARB_vertex_program 1
#define global GL_COLOR_SUM_ARB 0x8458
#define global GL_VERTEX_PROGRAM_ARB 0x8620
#define global GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB 0x8622
#define global GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB 0x8623
#define global GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB 0x8624
#define global GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB 0x8625
#define global GL_CURRENT_VERTEX_ATTRIB_ARB 0x8626
#define global GL_PROGRAM_LENGTH_ARB 0x8627
#define global GL_PROGRAM_STRING_ARB 0x8628
#define global GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB 0x862E
#define global GL_MAX_PROGRAM_MATRICES_ARB 0x862F
#define global GL_CURRENT_MATRIX_STACK_DEPTH_ARB 0x8640
#define global GL_CURRENT_MATRIX_ARB 0x8641
#define global GL_VERTEX_PROGRAM_POINT_SIZE_ARB 0x8642
#define global GL_VERTEX_PROGRAM_TWO_SIDE_ARB 0x8643
#define global GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB 0x8645
#define global GL_PROGRAM_ERROR_POSITION_ARB 0x864B
#define global GL_PROGRAM_BINDING_ARB 0x8677
#define global GL_MAX_VERTEX_ATTRIBS_ARB 0x8869
#define global GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB 0x886A
#define global GL_PROGRAM_ERROR_STRING_ARB 0x8874
#define global GL_PROGRAM_FORMAT_ASCII_ARB 0x8875
#define global GL_PROGRAM_FORMAT_ARB 0x8876
#define global GL_PROGRAM_INSTRUCTIONS_ARB 0x88A0
#define global GL_MAX_PROGRAM_INSTRUCTIONS_ARB 0x88A1
#define global GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB 0x88A2
#define global GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB 0x88A3
#define global GL_PROGRAM_TEMPORARIES_ARB 0x88A4
#define global GL_MAX_PROGRAM_TEMPORARIES_ARB 0x88A5
#define global GL_PROGRAM_NATIVE_TEMPORARIES_ARB 0x88A6
#define global GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB 0x88A7
#define global GL_PROGRAM_PARAMETERS_ARB 0x88A8
#define global GL_MAX_PROGRAM_PARAMETERS_ARB 0x88A9
#define global GL_PROGRAM_NATIVE_PARAMETERS_ARB 0x88AA
#define global GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB 0x88AB
#define global GL_PROGRAM_ATTRIBS_ARB 0x88AC
#define global GL_MAX_PROGRAM_ATTRIBS_ARB 0x88AD
#define global GL_PROGRAM_NATIVE_ATTRIBS_ARB 0x88AE
#define global GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB 0x88AF
#define global GL_PROGRAM_ADDRESS_REGISTERS_ARB 0x88B0
#define global GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB 0x88B1
#define global GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB 0x88B2
#define global GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB 0x88B3
#define global GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB 0x88B4
#define global GL_MAX_PROGRAM_ENV_PARAMETERS_ARB 0x88B5
#define global GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB 0x88B6
#define global GL_TRANSPOSE_CURRENT_MATRIX_ARB 0x88B7
#define global GL_MATRIX0_ARB 0x88C0
#define global GL_MATRIX1_ARB 0x88C1
#define global GL_MATRIX2_ARB 0x88C2
#define global GL_MATRIX3_ARB 0x88C3
#define global GL_MATRIX4_ARB 0x88C4
#define global GL_MATRIX5_ARB 0x88C5
#define global GL_MATRIX6_ARB 0x88C6
#define global GL_MATRIX7_ARB 0x88C7
#define global GL_MATRIX8_ARB 0x88C8
#define global GL_MATRIX9_ARB 0x88C9
#define global GL_MATRIX10_ARB 0x88CA
#define global GL_MATRIX11_ARB 0x88CB
#define global GL_MATRIX12_ARB 0x88CC
#define global GL_MATRIX13_ARB 0x88CD
#define global GL_MATRIX14_ARB 0x88CE
#define global GL_MATRIX15_ARB 0x88CF
#define global GL_MATRIX16_ARB 0x88D0
#define global GL_MATRIX17_ARB 0x88D1
#define global GL_MATRIX18_ARB 0x88D2
#define global GL_MATRIX19_ARB 0x88D3
#define global GL_MATRIX20_ARB 0x88D4
#define global GL_MATRIX21_ARB 0x88D5
#define global GL_MATRIX22_ARB 0x88D6
#define global GL_MATRIX23_ARB 0x88D7
#define global GL_MATRIX24_ARB 0x88D8
#define global GL_MATRIX25_ARB 0x88D9
#define global GL_MATRIX26_ARB 0x88DA
#define global GL_MATRIX27_ARB 0x88DB
#define global GL_MATRIX28_ARB 0x88DC
#define global GL_MATRIX29_ARB 0x88DD
#define global GL_MATRIX30_ARB 0x88DE
#define global GL_MATRIX31_ARB 0x88DF
#define global GL_ARB_vertex_shader 1
#define global GL_VERTEX_SHADER_ARB 0x8B31
#define global GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB 0x8B4A
#define global GL_MAX_VARYING_FLOATS_ARB 0x8B4B
#define global GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB 0x8B4C
#define global GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB 0x8B4D
#define global GL_OBJECT_ACTIVE_ATTRIBUTES_ARB 0x8B89
#define global GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB 0x8B8A
#define global GL_ARB_window_pos 1
#define global GL_ATIX_point_sprites 1
#define global GL_TEXTURE_POINT_MODE_ATIX 0x60B0
#define global GL_TEXTURE_POINT_ONE_COORD_ATIX 0x60B1
#define global GL_TEXTURE_POINT_SPRITE_ATIX 0x60B2
#define global GL_POINT_SPRITE_CULL_MODE_ATIX 0x60B3
#define global GL_POINT_SPRITE_CULL_CENTER_ATIX 0x60B4
#define global GL_POINT_SPRITE_CULL_CLIP_ATIX 0x60B5
#define global GL_ATIX_texture_env_combine3 1
#define global GL_MODULATE_ADD_ATIX 0x8744
#define global GL_MODULATE_SIGNED_ADD_ATIX 0x8745
#define global GL_MODULATE_SUBTRACT_ATIX 0x8746
#define global GL_ATIX_texture_env_route 1
#define global GL_SECONDARY_COLOR_ATIX 0x8747
#define global GL_TEXTURE_OUTPUT_RGB_ATIX 0x8748
#define global GL_TEXTURE_OUTPUT_ALPHA_ATIX 0x8749
#define global GL_ATIX_vertex_shader_output_point_size 1
#define global GL_OUTPUT_POINT_SIZE_ATIX 0x610E
#define global GL_ATI_draw_buffers 1
#define global GL_MAX_DRAW_BUFFERS_ATI 0x8824
#define global GL_DRAW_BUFFER0_ATI 0x8825
#define global GL_DRAW_BUFFER1_ATI 0x8826
#define global GL_DRAW_BUFFER2_ATI 0x8827
#define global GL_DRAW_BUFFER3_ATI 0x8828
#define global GL_DRAW_BUFFER4_ATI 0x8829
#define global GL_DRAW_BUFFER5_ATI 0x882A
#define global GL_DRAW_BUFFER6_ATI 0x882B
#define global GL_DRAW_BUFFER7_ATI 0x882C
#define global GL_DRAW_BUFFER8_ATI 0x882D
#define global GL_DRAW_BUFFER9_ATI 0x882E
#define global GL_DRAW_BUFFER10_ATI 0x882F
#define global GL_DRAW_BUFFER11_ATI 0x8830
#define global GL_DRAW_BUFFER12_ATI 0x8831
#define global GL_DRAW_BUFFER13_ATI 0x8832
#define global GL_DRAW_BUFFER14_ATI 0x8833
#define global GL_DRAW_BUFFER15_ATI 0x8834
#define global GL_ATI_element_array 1
#define global GL_ELEMENT_ARRAY_ATI 0x8768
#define global GL_ELEMENT_ARRAY_TYPE_ATI 0x8769
#define global GL_ELEMENT_ARRAY_POINTER_ATI 0x876A
#define global GL_ATI_envmap_bumpmap 1
#define global GL_BUMP_ROT_MATRIX_ATI 0x8775
#define global GL_BUMP_ROT_MATRIX_SIZE_ATI 0x8776
#define global GL_BUMP_NUM_TEX_UNITS_ATI 0x8777
#define global GL_BUMP_TEX_UNITS_ATI 0x8778
#define global GL_DUDV_ATI 0x8779
#define global GL_DU8DV8_ATI 0x877A
#define global GL_BUMP_ENVMAP_ATI 0x877B
#define global GL_BUMP_TARGET_ATI 0x877C
#define global GL_ATI_fragment_shader 1
#define global GL_RED_BIT_ATI 0x00000001
#define global GL_2X_BIT_ATI 0x00000001
#define global GL_4X_BIT_ATI 0x00000002
#define global GL_GREEN_BIT_ATI 0x00000002
#define global GL_COMP_BIT_ATI 0x00000002
#define global GL_BLUE_BIT_ATI 0x00000004
#define global GL_8X_BIT_ATI 0x00000004
#define global GL_NEGATE_BIT_ATI 0x00000004
#define global GL_BIAS_BIT_ATI 0x00000008
#define global GL_HALF_BIT_ATI 0x00000008
#define global GL_QUARTER_BIT_ATI 0x00000010
#define global GL_EIGHTH_BIT_ATI 0x00000020
#define global GL_SATURATE_BIT_ATI 0x00000040
#define global GL_FRAGMENT_SHADER_ATI 0x8920
#define global GL_REG_0_ATI 0x8921
#define global GL_REG_1_ATI 0x8922
#define global GL_REG_2_ATI 0x8923
#define global GL_REG_3_ATI 0x8924
#define global GL_REG_4_ATI 0x8925
#define global GL_REG_5_ATI 0x8926
#define global GL_CON_0_ATI 0x8941
#define global GL_CON_1_ATI 0x8942
#define global GL_CON_2_ATI 0x8943
#define global GL_CON_3_ATI 0x8944
#define global GL_CON_4_ATI 0x8945
#define global GL_CON_5_ATI 0x8946
#define global GL_CON_6_ATI 0x8947
#define global GL_CON_7_ATI 0x8948
#define global GL_MOV_ATI 0x8961
#define global GL_ADD_ATI 0x8963
#define global GL_MUL_ATI 0x8964
#define global GL_SUB_ATI 0x8965
#define global GL_DOT3_ATI 0x8966
#define global GL_DOT4_ATI 0x8967
#define global GL_MAD_ATI 0x8968
#define global GL_LERP_ATI 0x8969
#define global GL_CND_ATI 0x896A
#define global GL_CND0_ATI 0x896B
#define global GL_DOT2_ADD_ATI 0x896C
#define global GL_SECONDARY_INTERPOLATOR_ATI 0x896D
#define global GL_NUM_FRAGMENT_REGISTERS_ATI 0x896E
#define global GL_NUM_FRAGMENT_CONSTANTS_ATI 0x896F
#define global GL_NUM_PASSES_ATI 0x8970
#define global GL_NUM_INSTRUCTIONS_PER_PASS_ATI 0x8971
#define global GL_NUM_INSTRUCTIONS_TOTAL_ATI 0x8972
#define global GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI 0x8973
#define global GL_NUM_LOOPBACK_COMPONENTS_ATI 0x8974
#define global GL_COLOR_ALPHA_PAIRING_ATI 0x8975
#define global GL_SWIZZLE_STR_ATI 0x8976
#define global GL_SWIZZLE_STQ_ATI 0x8977
#define global GL_SWIZZLE_STR_DR_ATI 0x8978
#define global GL_SWIZZLE_STQ_DQ_ATI 0x8979
#define global GL_SWIZZLE_STRQ_ATI 0x897A
#define global GL_SWIZZLE_STRQ_DQ_ATI 0x897B
#define global GL_ATI_map_object_buffer 1
#define global GL_ATI_pn_triangles 1
#define global GL_PN_TRIANGLES_ATI 0x87F0
#define global GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI 0x87F1
#define global GL_PN_TRIANGLES_POINT_MODE_ATI 0x87F2
#define global GL_PN_TRIANGLES_NORMAL_MODE_ATI 0x87F3
#define global GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI 0x87F4
#define global GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI 0x87F5
#define global GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI 0x87F6
#define global GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI 0x87F7
#define global GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI 0x87F8
#define global GL_ATI_separate_stencil 1
#define global GL_STENCIL_BACK_FUNC_ATI 0x8800
#define global GL_STENCIL_BACK_FAIL_ATI 0x8801
#define global GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI 0x8802
#define global GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI 0x8803
#define global GL_ATI_shader_texture_lod 1
#define global GL_ATI_text_fragment_shader 1
#define global GL_TEXT_FRAGMENT_SHADER_ATI 0x8200
#define global GL_ATI_texture_compression_3dc 1
#define global GL_COMPRESSED_LUMINANCE_ALPHA_3DC_ATI 0x8837
#define global GL_ATI_texture_env_combine3 1
#define global GL_MODULATE_ADD_ATI 0x8744
#define global GL_MODULATE_SIGNED_ADD_ATI 0x8745
#define global GL_MODULATE_SUBTRACT_ATI 0x8746
#define global GL_ATI_texture_float 1
#define global GL_RGBA_FLOAT32_ATI 0x8814
#define global GL_RGB_FLOAT32_ATI 0x8815
#define global GL_ALPHA_FLOAT32_ATI 0x8816
#define global GL_INTENSITY_FLOAT32_ATI 0x8817
#define global GL_LUMINANCE_FLOAT32_ATI 0x8818
#define global GL_LUMINANCE_ALPHA_FLOAT32_ATI 0x8819
#define global GL_RGBA_FLOAT16_ATI 0x881A
#define global GL_RGB_FLOAT16_ATI 0x881B
#define global GL_ALPHA_FLOAT16_ATI 0x881C
#define global GL_INTENSITY_FLOAT16_ATI 0x881D
#define global GL_LUMINANCE_FLOAT16_ATI 0x881E
#define global GL_LUMINANCE_ALPHA_FLOAT16_ATI 0x881F
#define global GL_ATI_texture_mirror_once 1
#define global GL_MIRROR_CLAMP_ATI 0x8742
#define global GL_MIRROR_CLAMP_TO_EDGE_ATI 0x8743
#define global GL_ATI_vertex_array_object 1
#define global GL_STATIC_ATI 0x8760
#define global GL_DYNAMIC_ATI 0x8761
#define global GL_PRESERVE_ATI 0x8762
#define global GL_DISCARD_ATI 0x8763
#define global GL_OBJECT_BUFFER_SIZE_ATI 0x8764
#define global GL_OBJECT_BUFFER_USAGE_ATI 0x8765
#define global GL_ARRAY_OBJECT_BUFFER_ATI 0x8766
#define global GL_ARRAY_OBJECT_OFFSET_ATI 0x8767
#define global GL_ATI_vertex_attrib_array_object 1
#define global GL_ATI_vertex_streams 1
#define global GL_MAX_VERTEX_STREAMS_ATI 0x876B
#define global GL_VERTEX_SOURCE_ATI 0x876C
#define global GL_VERTEX_STREAM0_ATI 0x876D
#define global GL_VERTEX_STREAM1_ATI 0x876E
#define global GL_VERTEX_STREAM2_ATI 0x876F
#define global GL_VERTEX_STREAM3_ATI 0x8770
#define global GL_VERTEX_STREAM4_ATI 0x8771
#define global GL_VERTEX_STREAM5_ATI 0x8772
#define global GL_VERTEX_STREAM6_ATI 0x8773
#define global GL_VERTEX_STREAM7_ATI 0x8774
#define global GL_EXT_422_pixels 1
#define global GL_422_EXT 0x80CC
#define global GL_422_REV_EXT 0x80CD
#define global GL_422_AVERAGE_EXT 0x80CE
#define global GL_422_REV_AVERAGE_EXT 0x80CF
#define global GL_EXT_Cg_shader 1
#define global GL_CG_VERTEX_SHADER_EXT 0x890E
#define global GL_CG_FRAGMENT_SHADER_EXT 0x890F
#define global GL_EXT_abgr 1
#define global GL_ABGR_EXT 0x8000
#define global GL_EXT_bindable_uniform 1
#define global GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT 0x8DE2
#define global GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT 0x8DE3
#define global GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT 0x8DE4
#define global GL_MAX_BINDABLE_UNIFORM_SIZE_EXT 0x8DED
#define global GL_UNIFORM_BUFFER_EXT 0x8DEE
#define global GL_UNIFORM_BUFFER_BINDING_EXT 0x8DEF
#define global GL_EXT_blend_color 1
#define global GL_CONSTANT_COLOR_EXT 0x8001
#define global GL_ONE_MINUS_CONSTANT_COLOR_EXT 0x8002
#define global GL_CONSTANT_ALPHA_EXT 0x8003
#define global GL_ONE_MINUS_CONSTANT_ALPHA_EXT 0x8004
#define global GL_BLEND_COLOR_EXT 0x8005
#define global GL_EXT_blend_equation_separate 1
#define global GL_BLEND_EQUATION_RGB_EXT 0x8009
#define global GL_BLEND_EQUATION_ALPHA_EXT 0x883D
#define global GL_EXT_blend_func_separate 1
#define global GL_BLEND_DST_RGB_EXT 0x80C8
#define global GL_BLEND_SRC_RGB_EXT 0x80C9
#define global GL_BLEND_DST_ALPHA_EXT 0x80CA
#define global GL_BLEND_SRC_ALPHA_EXT 0x80CB
#define global GL_EXT_blend_logic_op 1
#define global GL_EXT_blend_minmax 1
#define global GL_FUNC_ADD_EXT 0x8006
#define global GL_MIN_EXT 0x8007
#define global GL_MAX_EXT 0x8008
#define global GL_BLEND_EQUATION_EXT 0x8009
#define global GL_EXT_blend_subtract 1
#define global GL_FUNC_SUBTRACT_EXT 0x800A
#define global GL_FUNC_REVERSE_SUBTRACT_EXT 0x800B
#define global GL_EXT_clip_volume_hint 1
#define global GL_CLIP_VOLUME_CLIPPING_HINT_EXT 0x80F0
#define global GL_EXT_cmyka 1
#define global GL_CMYK_EXT 0x800C
#define global GL_CMYKA_EXT 0x800D
#define global GL_PACK_CMYK_HINT_EXT 0x800E
#define global GL_UNPACK_CMYK_HINT_EXT 0x800F
#define global GL_EXT_color_subtable 1
#define global GL_EXT_compiled_vertex_array 1
#define global GL_ARRAY_ELEMENT_LOCK_FIRST_EXT 0x81A8
#define global GL_ARRAY_ELEMENT_LOCK_COUNT_EXT 0x81A9
#define global GL_EXT_convolution 1
#define global GL_CONVOLUTION_1D_EXT 0x8010
#define global GL_CONVOLUTION_2D_EXT 0x8011
#define global GL_SEPARABLE_2D_EXT 0x8012
#define global GL_CONVOLUTION_BORDER_MODE_EXT 0x8013
#define global GL_CONVOLUTION_FILTER_SCALE_EXT 0x8014
#define global GL_CONVOLUTION_FILTER_BIAS_EXT 0x8015
#define global GL_REDUCE_EXT 0x8016
#define global GL_CONVOLUTION_FORMAT_EXT 0x8017
#define global GL_CONVOLUTION_WIDTH_EXT 0x8018
#define global GL_CONVOLUTION_HEIGHT_EXT 0x8019
#define global GL_MAX_CONVOLUTION_WIDTH_EXT 0x801A
#define global GL_MAX_CONVOLUTION_HEIGHT_EXT 0x801B
#define global GL_POST_CONVOLUTION_RED_SCALE_EXT 0x801C
#define global GL_POST_CONVOLUTION_GREEN_SCALE_EXT 0x801D
#define global GL_POST_CONVOLUTION_BLUE_SCALE_EXT 0x801E
#define global GL_POST_CONVOLUTION_ALPHA_SCALE_EXT 0x801F
#define global GL_POST_CONVOLUTION_RED_BIAS_EXT 0x8020
#define global GL_POST_CONVOLUTION_GREEN_BIAS_EXT 0x8021
#define global GL_POST_CONVOLUTION_BLUE_BIAS_EXT 0x8022
#define global GL_POST_CONVOLUTION_ALPHA_BIAS_EXT 0x8023
#define global GL_EXT_coordinate_frame 1
#define global GL_TANGENT_ARRAY_EXT 0x8439
#define global GL_BINORMAL_ARRAY_EXT 0x843A
#define global GL_CURRENT_TANGENT_EXT 0x843B
#define global GL_CURRENT_BINORMAL_EXT 0x843C
#define global GL_TANGENT_ARRAY_TYPE_EXT 0x843E
#define global GL_TANGENT_ARRAY_STRIDE_EXT 0x843F
#define global GL_BINORMAL_ARRAY_TYPE_EXT 0x8440
#define global GL_BINORMAL_ARRAY_STRIDE_EXT 0x8441
#define global GL_TANGENT_ARRAY_POINTER_EXT 0x8442
#define global GL_BINORMAL_ARRAY_POINTER_EXT 0x8443
#define global GL_MAP1_TANGENT_EXT 0x8444
#define global GL_MAP2_TANGENT_EXT 0x8445
#define global GL_MAP1_BINORMAL_EXT 0x8446
#define global GL_MAP2_BINORMAL_EXT 0x8447
#define global GL_EXT_copy_texture 1
#define global GL_EXT_cull_vertex 1
#define global GL_EXT_depth_bounds_test 1
#define global GL_DEPTH_BOUNDS_TEST_EXT 0x8890
#define global GL_DEPTH_BOUNDS_EXT 0x8891
#define global GL_EXT_direct_state_access 1
#define global GL_PROGRAM_MATRIX_EXT 0x8E2D
#define global GL_TRANSPOSE_PROGRAM_MATRIX_EXT 0x8E2E
#define global GL_PROGRAM_MATRIX_STACK_DEPTH_EXT 0x8E2F
#define global GL_EXT_draw_buffers2 1
#define global GL_EXT_draw_instanced 1
#define global GL_EXT_draw_range_elements 1
#define global GL_EXT_fog_coord 1
#define global GL_FOG_COORDINATE_SOURCE_EXT 0x8450
#define global GL_FOG_COORDINATE_EXT 0x8451
#define global GL_FRAGMENT_DEPTH_EXT 0x8452
#define global GL_CURRENT_FOG_COORDINATE_EXT 0x8453
#define global GL_FOG_COORDINATE_ARRAY_TYPE_EXT 0x8454
#define global GL_FOG_COORDINATE_ARRAY_STRIDE_EXT 0x8455
#define global GL_FOG_COORDINATE_ARRAY_POINTER_EXT 0x8456
#define global GL_FOG_COORDINATE_ARRAY_EXT 0x8457
#define global GL_EXT_fragment_lighting 1
#define global GL_FRAGMENT_LIGHTING_EXT 0x8400
#define global GL_FRAGMENT_COLOR_MATERIAL_EXT 0x8401
#define global GL_FRAGMENT_COLOR_MATERIAL_FACE_EXT 0x8402
#define global GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_EXT 0x8403
#define global GL_MAX_FRAGMENT_LIGHTS_EXT 0x8404
#define global GL_MAX_ACTIVE_LIGHTS_EXT 0x8405
#define global GL_CURRENT_RASTER_NORMAL_EXT 0x8406
#define global GL_LIGHT_ENV_MODE_EXT 0x8407
#define global GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_EXT 0x8408
#define global GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_EXT 0x8409
#define global GL_FRAGMENT_LIGHT_MODEL_AMBIENT_EXT 0x840A
#define global GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_EXT 0x840B
#define global GL_FRAGMENT_LIGHT0_EXT 0x840C
#define global GL_FRAGMENT_LIGHT7_EXT 0x8413
#define global GL_EXT_framebuffer_blit 1
#define global GL_DRAW_FRAMEBUFFER_BINDING_EXT 0x8CA6
#define global GL_READ_FRAMEBUFFER_EXT 0x8CA8
#define global GL_DRAW_FRAMEBUFFER_EXT 0x8CA9
#define global GL_READ_FRAMEBUFFER_BINDING_EXT 0x8CAA
#define global GL_EXT_framebuffer_multisample 1
#define global GL_RENDERBUFFER_SAMPLES_EXT 0x8CAB
#define global GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT 0x8D56
#define global GL_MAX_SAMPLES_EXT 0x8D57
#define global GL_EXT_framebuffer_object 1
#define global GL_INVALID_FRAMEBUFFER_OPERATION_EXT 0x0506
#define global GL_MAX_RENDERBUFFER_SIZE_EXT 0x84E8
#define global GL_FRAMEBUFFER_BINDING_EXT 0x8CA6
#define global GL_RENDERBUFFER_BINDING_EXT 0x8CA7
#define global GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT 0x8CD0
#define global GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT 0x8CD1
#define global GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT 0x8CD2
#define global GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT 0x8CD3
#define global GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT 0x8CD4
#define global GL_FRAMEBUFFER_COMPLETE_EXT 0x8CD5
#define global GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT 0x8CD6
#define global GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT 0x8CD7
#define global GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT 0x8CD9
#define global GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT 0x8CDA
#define global GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT 0x8CDB
#define global GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT 0x8CDC
#define global GL_FRAMEBUFFER_UNSUPPORTED_EXT 0x8CDD
#define global GL_MAX_COLOR_ATTACHMENTS_EXT 0x8CDF
#define global GL_COLOR_ATTACHMENT0_EXT 0x8CE0
#define global GL_COLOR_ATTACHMENT1_EXT 0x8CE1
#define global GL_COLOR_ATTACHMENT2_EXT 0x8CE2
#define global GL_COLOR_ATTACHMENT3_EXT 0x8CE3
#define global GL_COLOR_ATTACHMENT4_EXT 0x8CE4
#define global GL_COLOR_ATTACHMENT5_EXT 0x8CE5
#define global GL_COLOR_ATTACHMENT6_EXT 0x8CE6
#define global GL_COLOR_ATTACHMENT7_EXT 0x8CE7
#define global GL_COLOR_ATTACHMENT8_EXT 0x8CE8
#define global GL_COLOR_ATTACHMENT9_EXT 0x8CE9
#define global GL_COLOR_ATTACHMENT10_EXT 0x8CEA
#define global GL_COLOR_ATTACHMENT11_EXT 0x8CEB
#define global GL_COLOR_ATTACHMENT12_EXT 0x8CEC
#define global GL_COLOR_ATTACHMENT13_EXT 0x8CED
#define global GL_COLOR_ATTACHMENT14_EXT 0x8CEE
#define global GL_COLOR_ATTACHMENT15_EXT 0x8CEF
#define global GL_DEPTH_ATTACHMENT_EXT 0x8D00
#define global GL_STENCIL_ATTACHMENT_EXT 0x8D20
#define global GL_FRAMEBUFFER_EXT 0x8D40
#define global GL_RENDERBUFFER_EXT 0x8D41
#define global GL_RENDERBUFFER_WIDTH_EXT 0x8D42
#define global GL_RENDERBUFFER_HEIGHT_EXT 0x8D43
#define global GL_RENDERBUFFER_INTERNAL_FORMAT_EXT 0x8D44
#define global GL_STENCIL_INDEX1_EXT 0x8D46
#define global GL_STENCIL_INDEX4_EXT 0x8D47
#define global GL_STENCIL_INDEX8_EXT 0x8D48
#define global GL_STENCIL_INDEX16_EXT 0x8D49
#define global GL_RENDERBUFFER_RED_SIZE_EXT 0x8D50
#define global GL_RENDERBUFFER_GREEN_SIZE_EXT 0x8D51
#define global GL_RENDERBUFFER_BLUE_SIZE_EXT 0x8D52
#define global GL_RENDERBUFFER_ALPHA_SIZE_EXT 0x8D53
#define global GL_RENDERBUFFER_DEPTH_SIZE_EXT 0x8D54
#define global GL_RENDERBUFFER_STENCIL_SIZE_EXT 0x8D55
#define global GL_EXT_framebuffer_sRGB 1
#define global GL_FRAMEBUFFER_SRGB_EXT 0x8DB9
#define global GL_FRAMEBUFFER_SRGB_CAPABLE_EXT 0x8DBA
#define global GL_EXT_geometry_shader4 1
#define global GL_LINES_ADJACENCY_EXT 0xA
#define global GL_LINE_STRIP_ADJACENCY_EXT 0xB
#define global GL_TRIANGLES_ADJACENCY_EXT 0xC
#define global GL_TRIANGLE_STRIP_ADJACENCY_EXT 0xD
#define global GL_PROGRAM_POINT_SIZE_EXT 0x8642
#define global GL_MAX_VARYING_COMPONENTS_EXT 0x8B4B
#define global GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT 0x8C29
#define global GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT 0x8CD4
#define global GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT 0x8DA7
#define global GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT 0x8DA8
#define global GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT 0x8DA9
#define global GL_GEOMETRY_SHADER_EXT 0x8DD9
#define global GL_GEOMETRY_VERTICES_OUT_EXT 0x8DDA
#define global GL_GEOMETRY_INPUT_TYPE_EXT 0x8DDB
#define global GL_GEOMETRY_OUTPUT_TYPE_EXT 0x8DDC
#define global GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT 0x8DDD
#define global GL_MAX_VERTEX_VARYING_COMPONENTS_EXT 0x8DDE
#define global GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT 0x8DDF
#define global GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT 0x8DE0
#define global GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT 0x8DE1
#define global GL_EXT_gpu_program_parameters 1
#define global GL_EXT_gpu_shader4 1
#define global GL_VERTEX_ATTRIB_ARRAY_INTEGER_EXT 0x88FD
#define global GL_SAMPLER_1D_ARRAY_EXT 0x8DC0
#define global GL_SAMPLER_2D_ARRAY_EXT 0x8DC1
#define global GL_SAMPLER_BUFFER_EXT 0x8DC2
#define global GL_SAMPLER_1D_ARRAY_SHADOW_EXT 0x8DC3
#define global GL_SAMPLER_2D_ARRAY_SHADOW_EXT 0x8DC4
#define global GL_SAMPLER_CUBE_SHADOW_EXT 0x8DC5
#define global GL_UNSIGNED_INT_VEC2_EXT 0x8DC6
#define global GL_UNSIGNED_INT_VEC3_EXT 0x8DC7
#define global GL_UNSIGNED_INT_VEC4_EXT 0x8DC8
#define global GL_INT_SAMPLER_1D_EXT 0x8DC9
#define global GL_INT_SAMPLER_2D_EXT 0x8DCA
#define global GL_INT_SAMPLER_3D_EXT 0x8DCB
#define global GL_INT_SAMPLER_CUBE_EXT 0x8DCC
#define global GL_INT_SAMPLER_2D_RECT_EXT 0x8DCD
#define global GL_INT_SAMPLER_1D_ARRAY_EXT 0x8DCE
#define global GL_INT_SAMPLER_2D_ARRAY_EXT 0x8DCF
#define global GL_INT_SAMPLER_BUFFER_EXT 0x8DD0
#define global GL_UNSIGNED_INT_SAMPLER_1D_EXT 0x8DD1
#define global GL_UNSIGNED_INT_SAMPLER_2D_EXT 0x8DD2
#define global GL_UNSIGNED_INT_SAMPLER_3D_EXT 0x8DD3
#define global GL_UNSIGNED_INT_SAMPLER_CUBE_EXT 0x8DD4
#define global GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT 0x8DD5
#define global GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT 0x8DD6
#define global GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT 0x8DD7
#define global GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT 0x8DD8
#define global GL_EXT_histogram 1
#define global GL_HISTOGRAM_EXT 0x8024
#define global GL_PROXY_HISTOGRAM_EXT 0x8025
#define global GL_HISTOGRAM_WIDTH_EXT 0x8026
#define global GL_HISTOGRAM_FORMAT_EXT 0x8027
#define global GL_HISTOGRAM_RED_SIZE_EXT 0x8028
#define global GL_HISTOGRAM_GREEN_SIZE_EXT 0x8029
#define global GL_HISTOGRAM_BLUE_SIZE_EXT 0x802A
#define global GL_HISTOGRAM_ALPHA_SIZE_EXT 0x802B
#define global GL_HISTOGRAM_LUMINANCE_SIZE_EXT 0x802C
#define global GL_HISTOGRAM_SINK_EXT 0x802D
#define global GL_MINMAX_EXT 0x802E
#define global GL_MINMAX_FORMAT_EXT 0x802F
#define global GL_MINMAX_SINK_EXT 0x8030
#define global GL_EXT_index_array_formats 1
#define global GL_EXT_index_func 1
#define global GL_EXT_index_material 1
#define global GL_EXT_index_texture 1
#define global GL_EXT_light_texture 1
#define global GL_FRAGMENT_MATERIAL_EXT 0x8349
#define global GL_FRAGMENT_NORMAL_EXT 0x834A
#define global GL_FRAGMENT_COLOR_EXT 0x834C
#define global GL_ATTENUATION_EXT 0x834D
#define global GL_SHADOW_ATTENUATION_EXT 0x834E
#define global GL_TEXTURE_APPLICATION_MODE_EXT 0x834F
#define global GL_TEXTURE_LIGHT_EXT 0x8350
#define global GL_TEXTURE_MATERIAL_FACE_EXT 0x8351
#define global GL_TEXTURE_MATERIAL_PARAMETER_EXT 0x8352
#define global GL_EXT_misc_attribute 1
#define global GL_EXT_multi_draw_arrays 1
#define global GL_EXT_multisample 1
#define global GL_MULTISAMPLE_EXT 0x809D
#define global GL_SAMPLE_ALPHA_TO_MASK_EXT 0x809E
#define global GL_SAMPLE_ALPHA_TO_ONE_EXT 0x809F
#define global GL_SAMPLE_MASK_EXT 0x80A0
#define global GL_1PASS_EXT 0x80A1
#define global GL_2PASS_0_EXT 0x80A2
#define global GL_2PASS_1_EXT 0x80A3
#define global GL_4PASS_0_EXT 0x80A4
#define global GL_4PASS_1_EXT 0x80A5
#define global GL_4PASS_2_EXT 0x80A6
#define global GL_4PASS_3_EXT 0x80A7
#define global GL_SAMPLE_BUFFERS_EXT 0x80A8
#define global GL_SAMPLES_EXT 0x80A9
#define global GL_SAMPLE_MASK_VALUE_EXT 0x80AA
#define global GL_SAMPLE_MASK_INVERT_EXT 0x80AB
#define global GL_SAMPLE_PATTERN_EXT 0x80AC
#define global GL_MULTISAMPLE_BIT_EXT 0x20000000
#define global GL_EXT_packed_depth_stencil 1
#define global GL_DEPTH_STENCIL_EXT 0x84F9
#define global GL_UNSIGNED_INT_24_8_EXT 0x84FA
#define global GL_DEPTH24_STENCIL8_EXT 0x88F0
#define global GL_TEXTURE_STENCIL_SIZE_EXT 0x88F1
#define global GL_EXT_packed_float 1
#define global GL_R11F_G11F_B10F_EXT 0x8C3A
#define global GL_UNSIGNED_INT_10F_11F_11F_REV_EXT 0x8C3B
#define global GL_RGBA_SIGNED_COMPONENTS_EXT 0x8C3C
#define global GL_EXT_packed_pixels 1
#define global GL_UNSIGNED_BYTE_3_3_2_EXT 0x8032
#define global GL_UNSIGNED_SHORT_4_4_4_4_EXT 0x8033
#define global GL_UNSIGNED_SHORT_5_5_5_1_EXT 0x8034
#define global GL_UNSIGNED_INT_8_8_8_8_EXT 0x8035
#define global GL_UNSIGNED_INT_10_10_10_2_EXT 0x8036
#define global GL_TEXTURE_3D_EXT 0x806F
#define global GL_PROXY_TEXTURE_3D_EXT 0x8070
#define global GL_TEXTURE_INDEX_SIZE_EXT 0x80ED
#define global GL_EXT_pixel_buffer_object 1
#define global GL_PIXEL_PACK_BUFFER_EXT 0x88EB
#define global GL_PIXEL_UNPACK_BUFFER_EXT 0x88EC
#define global GL_PIXEL_PACK_BUFFER_BINDING_EXT 0x88ED
#define global GL_PIXEL_UNPACK_BUFFER_BINDING_EXT 0x88EF
#define global GL_EXT_pixel_transform 1
#define global GL_PIXEL_TRANSFORM_2D_EXT 0x8330
#define global GL_PIXEL_MAG_FILTER_EXT 0x8331
#define global GL_PIXEL_MIN_FILTER_EXT 0x8332
#define global GL_PIXEL_CUBIC_WEIGHT_EXT 0x8333
#define global GL_CUBIC_EXT 0x8334
#define global GL_AVERAGE_EXT 0x8335
#define global GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT 0x8336
#define global GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT 0x8337
#define global GL_PIXEL_TRANSFORM_2D_MATRIX_EXT 0x8338
#define global GL_EXT_pixel_transform_color_table 1
#define global GL_EXT_point_parameters 1
#define global GL_POINT_SIZE_MIN_EXT 0x8126
#define global GL_POINT_SIZE_MAX_EXT 0x8127
#define global GL_POINT_FADE_THRESHOLD_SIZE_EXT 0x8128
#define global GL_DISTANCE_ATTENUATION_EXT 0x8129
#define global GL_EXT_polygon_offset 1
#define global GL_POLYGON_OFFSET_EXT 0x8037
#define global GL_POLYGON_OFFSET_FACTOR_EXT 0x8038
#define global GL_POLYGON_OFFSET_BIAS_EXT 0x8039
#define global GL_EXT_rescale_normal 1
#define global GL_RESCALE_NORMAL_EXT 0x803A
#define global GL_EXT_scene_marker 1
#define global GL_EXT_secondary_color 1
#define global GL_COLOR_SUM_EXT 0x8458
#define global GL_CURRENT_SECONDARY_COLOR_EXT 0x8459
#define global GL_SECONDARY_COLOR_ARRAY_SIZE_EXT 0x845A
#define global GL_SECONDARY_COLOR_ARRAY_TYPE_EXT 0x845B
#define global GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT 0x845C
#define global GL_SECONDARY_COLOR_ARRAY_POINTER_EXT 0x845D
#define global GL_SECONDARY_COLOR_ARRAY_EXT 0x845E
#define global GL_EXT_separate_specular_color 1
#define global GL_LIGHT_MODEL_COLOR_CONTROL_EXT 0x81F8
#define global GL_SINGLE_COLOR_EXT 0x81F9
#define global GL_SEPARATE_SPECULAR_COLOR_EXT 0x81FA
#define global GL_EXT_shadow_funcs 1
#define global GL_EXT_shared_texture_palette 1
#define global GL_SHARED_TEXTURE_PALETTE_EXT 0x81FB
#define global GL_EXT_stencil_clear_tag 1
#define global GL_STENCIL_TAG_BITS_EXT 0x88F2
#define global GL_STENCIL_CLEAR_TAG_VALUE_EXT 0x88F3
#define global GL_EXT_stencil_two_side 1
#define global GL_STENCIL_TEST_TWO_SIDE_EXT 0x8910
#define global GL_ACTIVE_STENCIL_FACE_EXT 0x8911
#define global GL_EXT_stencil_wrap 1
#define global GL_INCR_WRAP_EXT 0x8507
#define global GL_DECR_WRAP_EXT 0x8508
#define global GL_EXT_subtexture 1
#define global GL_EXT_texture 1
#define global GL_ALPHA4_EXT 0x803B
#define global GL_ALPHA8_EXT 0x803C
#define global GL_ALPHA12_EXT 0x803D
#define global GL_ALPHA16_EXT 0x803E
#define global GL_LUMINANCE4_EXT 0x803F
#define global GL_LUMINANCE8_EXT 0x8040
#define global GL_LUMINANCE12_EXT 0x8041
#define global GL_LUMINANCE16_EXT 0x8042
#define global GL_LUMINANCE4_ALPHA4_EXT 0x8043
#define global GL_LUMINANCE6_ALPHA2_EXT 0x8044
#define global GL_LUMINANCE8_ALPHA8_EXT 0x8045
#define global GL_LUMINANCE12_ALPHA4_EXT 0x8046
#define global GL_LUMINANCE12_ALPHA12_EXT 0x8047
#define global GL_LUMINANCE16_ALPHA16_EXT 0x8048
#define global GL_INTENSITY_EXT 0x8049
#define global GL_INTENSITY4_EXT 0x804A
#define global GL_INTENSITY8_EXT 0x804B
#define global GL_INTENSITY12_EXT 0x804C
#define global GL_INTENSITY16_EXT 0x804D
#define global GL_RGB2_EXT 0x804E
#define global GL_RGB4_EXT 0x804F
#define global GL_RGB5_EXT 0x8050
#define global GL_RGB8_EXT 0x8051
#define global GL_RGB10_EXT 0x8052
#define global GL_RGB12_EXT 0x8053
#define global GL_RGB16_EXT 0x8054
#define global GL_RGBA2_EXT 0x8055
#define global GL_RGBA4_EXT 0x8056
#define global GL_RGB5_A1_EXT 0x8057
#define global GL_RGBA8_EXT 0x8058
#define global GL_RGB10_A2_EXT 0x8059
#define global GL_RGBA12_EXT 0x805A
#define global GL_RGBA16_EXT 0x805B
#define global GL_TEXTURE_RED_SIZE_EXT 0x805C
#define global GL_TEXTURE_GREEN_SIZE_EXT 0x805D
#define global GL_TEXTURE_BLUE_SIZE_EXT 0x805E
#define global GL_TEXTURE_ALPHA_SIZE_EXT 0x805F
#define global GL_TEXTURE_LUMINANCE_SIZE_EXT 0x8060
#define global GL_TEXTURE_INTENSITY_SIZE_EXT 0x8061
#define global GL_REPLACE_EXT 0x8062
#define global GL_PROXY_TEXTURE_1D_EXT 0x8063
#define global GL_PROXY_TEXTURE_2D_EXT 0x8064
#define global GL_EXT_texture3D 1
#define global GL_PACK_SKIP_IMAGES_EXT 0x806B
#define global GL_PACK_IMAGE_HEIGHT_EXT 0x806C
#define global GL_UNPACK_SKIP_IMAGES_EXT 0x806D
#define global GL_UNPACK_IMAGE_HEIGHT_EXT 0x806E
#define global GL_TEXTURE_DEPTH_EXT 0x8071
#define global GL_TEXTURE_WRAP_R_EXT 0x8072
#define global GL_MAX_3D_TEXTURE_SIZE_EXT 0x8073
#define global GL_EXT_texture_array 1
#define global GL_COMPARE_REF_DEPTH_TO_TEXTURE_EXT 0x884E
#define global GL_MAX_ARRAY_TEXTURE_LAYERS_EXT 0x88FF
#define global GL_TEXTURE_1D_ARRAY_EXT 0x8C18
#define global GL_PROXY_TEXTURE_1D_ARRAY_EXT 0x8C19
#define global GL_TEXTURE_2D_ARRAY_EXT 0x8C1A
#define global GL_PROXY_TEXTURE_2D_ARRAY_EXT 0x8C1B
#define global GL_TEXTURE_BINDING_1D_ARRAY_EXT 0x8C1C
#define global GL_TEXTURE_BINDING_2D_ARRAY_EXT 0x8C1D
#define global GL_EXT_texture_buffer_object 1
#define global GL_TEXTURE_BUFFER_EXT 0x8C2A
#define global GL_MAX_TEXTURE_BUFFER_SIZE_EXT 0x8C2B
#define global GL_TEXTURE_BINDING_BUFFER_EXT 0x8C2C
#define global GL_TEXTURE_BUFFER_DATA_STORE_BINDING_EXT 0x8C2D
#define global GL_TEXTURE_BUFFER_FORMAT_EXT 0x8C2E
#define global GL_EXT_texture_compression_dxt1 1
#define global GL_COMPRESSED_RGB_S3TC_DXT1_EXT 0x83F0
#define global GL_COMPRESSED_RGBA_S3TC_DXT1_EXT 0x83F1
#define global GL_EXT_texture_compression_latc 1
#define global GL_COMPRESSED_LUMINANCE_LATC1_EXT 0x8C70
#define global GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT 0x8C71
#define global GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT 0x8C72
#define global GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT 0x8C73
#define global GL_EXT_texture_compression_rgtc 1
#define global GL_COMPRESSED_RED_RGTC1_EXT 0x8DBB
#define global GL_COMPRESSED_SIGNED_RED_RGTC1_EXT 0x8DBC
#define global GL_COMPRESSED_RED_GREEN_RGTC2_EXT 0x8DBD
#define global GL_COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT 0x8DBE
#define global GL_EXT_texture_compression_s3tc 1
#define global GL_COMPRESSED_RGBA_S3TC_DXT3_EXT 0x83F2
#define global GL_COMPRESSED_RGBA_S3TC_DXT5_EXT 0x83F3
#define global GL_EXT_texture_cube_map 1
#define global GL_NORMAL_MAP_EXT 0x8511
#define global GL_REFLECTION_MAP_EXT 0x8512
#define global GL_TEXTURE_CUBE_MAP_EXT 0x8513
#define global GL_TEXTURE_BINDING_CUBE_MAP_EXT 0x8514
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT 0x8515
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT 0x8516
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT 0x8517
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT 0x8518
#define global GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT 0x8519
#define global GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT 0x851A
#define global GL_PROXY_TEXTURE_CUBE_MAP_EXT 0x851B
#define global GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT 0x851C
#define global GL_EXT_texture_edge_clamp 1
#define global GL_CLAMP_TO_EDGE_EXT 0x812F
#define global GL_EXT_texture_env 1
#define global GL_TEXTURE_ENV0_EXT 0
#define global GL_ENV_BLEND_EXT 0
#define global GL_TEXTURE_ENV_SHIFT_EXT 0
#define global GL_ENV_REPLACE_EXT 0
#define global GL_ENV_ADD_EXT 0
#define global GL_ENV_SUBTRACT_EXT 0
#define global GL_TEXTURE_ENV_MODE_ALPHA_EXT 0
#define global GL_ENV_REVERSE_SUBTRACT_EXT 0
#define global GL_ENV_REVERSE_BLEND_EXT 0
#define global GL_ENV_COPY_EXT 0
#define global GL_ENV_MODULATE_EXT 0
#define global GL_EXT_texture_env_add 1
#define global GL_EXT_texture_env_combine 1
#define global GL_COMBINE_EXT 0x8570
#define global GL_COMBINE_RGB_EXT 0x8571
#define global GL_COMBINE_ALPHA_EXT 0x8572
#define global GL_RGB_SCALE_EXT 0x8573
#define global GL_ADD_SIGNED_EXT 0x8574
#define global GL_INTERPOLATE_EXT 0x8575
#define global GL_CONSTANT_EXT 0x8576
#define global GL_PRIMARY_COLOR_EXT 0x8577
#define global GL_PREVIOUS_EXT 0x8578
#define global GL_SOURCE0_RGB_EXT 0x8580
#define global GL_SOURCE1_RGB_EXT 0x8581
#define global GL_SOURCE2_RGB_EXT 0x8582
#define global GL_SOURCE0_ALPHA_EXT 0x8588
#define global GL_SOURCE1_ALPHA_EXT 0x8589
#define global GL_SOURCE2_ALPHA_EXT 0x858A
#define global GL_OPERAND0_RGB_EXT 0x8590
#define global GL_OPERAND1_RGB_EXT 0x8591
#define global GL_OPERAND2_RGB_EXT 0x8592
#define global GL_OPERAND0_ALPHA_EXT 0x8598
#define global GL_OPERAND1_ALPHA_EXT 0x8599
#define global GL_OPERAND2_ALPHA_EXT 0x859A
#define global GL_EXT_texture_env_dot3 1
#define global GL_DOT3_RGB_EXT 0x8740
#define global GL_DOT3_RGBA_EXT 0x8741
#define global GL_EXT_texture_filter_anisotropic 1
#define global GL_TEXTURE_MAX_ANISOTROPY_EXT 0x84FE
#define global GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT 0x84FF
#define global GL_EXT_texture_integer 1
#define global GL_RGBA32UI_EXT 0x8D70
#define global GL_RGB32UI_EXT 0x8D71
#define global GL_ALPHA32UI_EXT 0x8D72
#define global GL_INTENSITY32UI_EXT 0x8D73
#define global GL_LUMINANCE32UI_EXT 0x8D74
#define global GL_LUMINANCE_ALPHA32UI_EXT 0x8D75
#define global GL_RGBA16UI_EXT 0x8D76
#define global GL_RGB16UI_EXT 0x8D77
#define global GL_ALPHA16UI_EXT 0x8D78
#define global GL_INTENSITY16UI_EXT 0x8D79
#define global GL_LUMINANCE16UI_EXT 0x8D7A
#define global GL_LUMINANCE_ALPHA16UI_EXT 0x8D7B
#define global GL_RGBA8UI_EXT 0x8D7C
#define global GL_RGB8UI_EXT 0x8D7D
#define global GL_ALPHA8UI_EXT 0x8D7E
#define global GL_INTENSITY8UI_EXT 0x8D7F
#define global GL_LUMINANCE8UI_EXT 0x8D80
#define global GL_LUMINANCE_ALPHA8UI_EXT 0x8D81
#define global GL_RGBA32I_EXT 0x8D82
#define global GL_RGB32I_EXT 0x8D83
#define global GL_ALPHA32I_EXT 0x8D84
#define global GL_INTENSITY32I_EXT 0x8D85
#define global GL_LUMINANCE32I_EXT 0x8D86
#define global GL_LUMINANCE_ALPHA32I_EXT 0x8D87
#define global GL_RGBA16I_EXT 0x8D88
#define global GL_RGB16I_EXT 0x8D89
#define global GL_ALPHA16I_EXT 0x8D8A
#define global GL_INTENSITY16I_EXT 0x8D8B
#define global GL_LUMINANCE16I_EXT 0x8D8C
#define global GL_LUMINANCE_ALPHA16I_EXT 0x8D8D
#define global GL_RGBA8I_EXT 0x8D8E
#define global GL_RGB8I_EXT 0x8D8F
#define global GL_ALPHA8I_EXT 0x8D90
#define global GL_INTENSITY8I_EXT 0x8D91
#define global GL_LUMINANCE8I_EXT 0x8D92
#define global GL_LUMINANCE_ALPHA8I_EXT 0x8D93
#define global GL_RED_INTEGER_EXT 0x8D94
#define global GL_GREEN_INTEGER_EXT 0x8D95
#define global GL_BLUE_INTEGER_EXT 0x8D96
#define global GL_ALPHA_INTEGER_EXT 0x8D97
#define global GL_RGB_INTEGER_EXT 0x8D98
#define global GL_RGBA_INTEGER_EXT 0x8D99
#define global GL_BGR_INTEGER_EXT 0x8D9A
#define global GL_BGRA_INTEGER_EXT 0x8D9B
#define global GL_LUMINANCE_INTEGER_EXT 0x8D9C
#define global GL_LUMINANCE_ALPHA_INTEGER_EXT 0x8D9D
#define global GL_RGBA_INTEGER_MODE_EXT 0x8D9E
#define global GL_EXT_texture_lod_bias 1
#define global GL_MAX_TEXTURE_LOD_BIAS_EXT 0x84FD
#define global GL_TEXTURE_FILTER_CONTROL_EXT 0x8500
#define global GL_TEXTURE_LOD_BIAS_EXT 0x8501
#define global GL_EXT_texture_mirror_clamp 1
#define global GL_MIRROR_CLAMP_EXT 0x8742
#define global GL_MIRROR_CLAMP_TO_EDGE_EXT 0x8743
#define global GL_MIRROR_CLAMP_TO_BORDER_EXT 0x8912
#define global GL_EXT_texture_object 1
#define global GL_TEXTURE_PRIORITY_EXT 0x8066
#define global GL_TEXTURE_RESIDENT_EXT 0x8067
#define global GL_TEXTURE_1D_BINDING_EXT 0x8068
#define global GL_TEXTURE_2D_BINDING_EXT 0x8069
#define global GL_TEXTURE_3D_BINDING_EXT 0x806A
#define global GL_EXT_texture_perturb_normal 1
#define global GL_PERTURB_EXT 0x85AE
#define global GL_TEXTURE_NORMAL_EXT 0x85AF
#define global GL_EXT_texture_rectangle 1
#define global GL_TEXTURE_RECTANGLE_EXT 0x84F5
#define global GL_TEXTURE_BINDING_RECTANGLE_EXT 0x84F6
#define global GL_PROXY_TEXTURE_RECTANGLE_EXT 0x84F7
#define global GL_MAX_RECTANGLE_TEXTURE_SIZE_EXT 0x84F8
#define global GL_EXT_texture_sRGB 1
#define global GL_SRGB_EXT 0x8C40
#define global GL_SRGB8_EXT 0x8C41
#define global GL_SRGB_ALPHA_EXT 0x8C42
#define global GL_SRGB8_ALPHA8_EXT 0x8C43
#define global GL_SLUMINANCE_ALPHA_EXT 0x8C44
#define global GL_SLUMINANCE8_ALPHA8_EXT 0x8C45
#define global GL_SLUMINANCE_EXT 0x8C46
#define global GL_SLUMINANCE8_EXT 0x8C47
#define global GL_COMPRESSED_SRGB_EXT 0x8C48
#define global GL_COMPRESSED_SRGB_ALPHA_EXT 0x8C49
#define global GL_COMPRESSED_SLUMINANCE_EXT 0x8C4A
#define global GL_COMPRESSED_SLUMINANCE_ALPHA_EXT 0x8C4B
#define global GL_COMPRESSED_SRGB_S3TC_DXT1_EXT 0x8C4C
#define global GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT 0x8C4D
#define global GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT 0x8C4E
#define global GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT 0x8C4F
#define global GL_EXT_texture_shared_exponent 1
#define global GL_RGB9_E5_EXT 0x8C3D
#define global GL_UNSIGNED_INT_5_9_9_9_REV_EXT 0x8C3E
#define global GL_TEXTURE_SHARED_SIZE_EXT 0x8C3F
#define global GL_EXT_texture_swizzle 1
#define global GL_TEXTURE_SWIZZLE_R_EXT 0x8E42
#define global GL_TEXTURE_SWIZZLE_G_EXT 0x8E43
#define global GL_TEXTURE_SWIZZLE_B_EXT 0x8E44
#define global GL_TEXTURE_SWIZZLE_A_EXT 0x8E45
#define global GL_TEXTURE_SWIZZLE_RGBA_EXT 0x8E46
#define global GL_EXT_timer_query 1
#define global GL_TIME_ELAPSED_EXT 0x88BF
#define global GL_EXT_transform_feedback 1
#define global GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT 0x8C76
#define global GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT 0x8C7F
#define global GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT 0x8C80
#define global GL_TRANSFORM_FEEDBACK_VARYINGS_EXT 0x8C83
#define global GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT 0x8C84
#define global GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT 0x8C85
#define global GL_PRIMITIVES_GENERATED_EXT 0x8C87
#define global GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT 0x8C88
#define global GL_RASTERIZER_DISCARD_EXT 0x8C89
#define global GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT 0x8C8A
#define global GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT 0x8C8B
#define global GL_INTERLEAVED_ATTRIBS_EXT 0x8C8C
#define global GL_SEPARATE_ATTRIBS_EXT 0x8C8D
#define global GL_TRANSFORM_FEEDBACK_BUFFER_EXT 0x8C8E
#define global GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT 0x8C8F
#define global GL_EXT_vertex_array_bgra 1
#define global GL_EXT_vertex_shader 1
#define global GL_VERTEX_SHADER_EXT 0x8780
#define global GL_VERTEX_SHADER_BINDING_EXT 0x8781
#define global GL_OP_INDEX_EXT 0x8782
#define global GL_OP_NEGATE_EXT 0x8783
#define global GL_OP_DOT3_EXT 0x8784
#define global GL_OP_DOT4_EXT 0x8785
#define global GL_OP_MUL_EXT 0x8786
#define global GL_OP_ADD_EXT 0x8787
#define global GL_OP_MADD_EXT 0x8788
#define global GL_OP_FRAC_EXT 0x8789
#define global GL_OP_MAX_EXT 0x878A
#define global GL_OP_MIN_EXT 0x878B
#define global GL_OP_SET_GE_EXT 0x878C
#define global GL_OP_SET_LT_EXT 0x878D
#define global GL_OP_CLAMP_EXT 0x878E
#define global GL_OP_FLOOR_EXT 0x878F
#define global GL_OP_ROUND_EXT 0x8790
#define global GL_OP_EXP_BASE_2_EXT 0x8791
#define global GL_OP_LOG_BASE_2_EXT 0x8792
#define global GL_OP_POWER_EXT 0x8793
#define global GL_OP_RECIP_EXT 0x8794
#define global GL_OP_RECIP_SQRT_EXT 0x8795
#define global GL_OP_SUB_EXT 0x8796
#define global GL_OP_CROSS_PRODUCT_EXT 0x8797
#define global GL_OP_MULTIPLY_MATRIX_EXT 0x8798
#define global GL_OP_MOV_EXT 0x8799
#define global GL_OUTPUT_VERTEX_EXT 0x879A
#define global GL_OUTPUT_COLOR0_EXT 0x879B
#define global GL_OUTPUT_COLOR1_EXT 0x879C
#define global GL_OUTPUT_TEXTURE_COORD0_EXT 0x879D
#define global GL_OUTPUT_TEXTURE_COORD1_EXT 0x879E
#define global GL_OUTPUT_TEXTURE_COORD2_EXT 0x879F
#define global GL_OUTPUT_TEXTURE_COORD3_EXT 0x87A0
#define global GL_OUTPUT_TEXTURE_COORD4_EXT 0x87A1
#define global GL_OUTPUT_TEXTURE_COORD5_EXT 0x87A2
#define global GL_OUTPUT_TEXTURE_COORD6_EXT 0x87A3
#define global GL_OUTPUT_TEXTURE_COORD7_EXT 0x87A4
#define global GL_OUTPUT_TEXTURE_COORD8_EXT 0x87A5
#define global GL_OUTPUT_TEXTURE_COORD9_EXT 0x87A6
#define global GL_OUTPUT_TEXTURE_COORD10_EXT 0x87A7
#define global GL_OUTPUT_TEXTURE_COORD11_EXT 0x87A8
#define global GL_OUTPUT_TEXTURE_COORD12_EXT 0x87A9
#define global GL_OUTPUT_TEXTURE_COORD13_EXT 0x87AA
#define global GL_OUTPUT_TEXTURE_COORD14_EXT 0x87AB
#define global GL_OUTPUT_TEXTURE_COORD15_EXT 0x87AC
#define global GL_OUTPUT_TEXTURE_COORD16_EXT 0x87AD
#define global GL_OUTPUT_TEXTURE_COORD17_EXT 0x87AE
#define global GL_OUTPUT_TEXTURE_COORD18_EXT 0x87AF
#define global GL_OUTPUT_TEXTURE_COORD19_EXT 0x87B0
#define global GL_OUTPUT_TEXTURE_COORD20_EXT 0x87B1
#define global GL_OUTPUT_TEXTURE_COORD21_EXT 0x87B2
#define global GL_OUTPUT_TEXTURE_COORD22_EXT 0x87B3
#define global GL_OUTPUT_TEXTURE_COORD23_EXT 0x87B4
#define global GL_OUTPUT_TEXTURE_COORD24_EXT 0x87B5
#define global GL_OUTPUT_TEXTURE_COORD25_EXT 0x87B6
#define global GL_OUTPUT_TEXTURE_COORD26_EXT 0x87B7
#define global GL_OUTPUT_TEXTURE_COORD27_EXT 0x87B8
#define global GL_OUTPUT_TEXTURE_COORD28_EXT 0x87B9
#define global GL_OUTPUT_TEXTURE_COORD29_EXT 0x87BA
#define global GL_OUTPUT_TEXTURE_COORD30_EXT 0x87BB
#define global GL_OUTPUT_TEXTURE_COORD31_EXT 0x87BC
#define global GL_OUTPUT_FOG_EXT 0x87BD
#define global GL_SCALAR_EXT 0x87BE
#define global GL_VECTOR_EXT 0x87BF
#define global GL_MATRIX_EXT 0x87C0
#define global GL_VARIANT_EXT 0x87C1
#define global GL_INVARIANT_EXT 0x87C2
#define global GL_LOCAL_CONSTANT_EXT 0x87C3
#define global GL_LOCAL_EXT 0x87C4
#define global GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT 0x87C5
#define global GL_MAX_VERTEX_SHADER_VARIANTS_EXT 0x87C6
#define global GL_MAX_VERTEX_SHADER_INVARIANTS_EXT 0x87C7
#define global GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT 0x87C8
#define global GL_MAX_VERTEX_SHADER_LOCALS_EXT 0x87C9
#define global GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT 0x87CA
#define global GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT 0x87CB
#define global GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT 0x87CC
#define global GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT 0x87CD
#define global GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT 0x87CE
#define global GL_VERTEX_SHADER_INSTRUCTIONS_EXT 0x87CF
#define global GL_VERTEX_SHADER_VARIANTS_EXT 0x87D0
#define global GL_VERTEX_SHADER_INVARIANTS_EXT 0x87D1
#define global GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT 0x87D2
#define global GL_VERTEX_SHADER_LOCALS_EXT 0x87D3
#define global GL_VERTEX_SHADER_OPTIMIZED_EXT 0x87D4
#define global GL_X_EXT 0x87D5
#define global GL_Y_EXT 0x87D6
#define global GL_Z_EXT 0x87D7
#define global GL_W_EXT 0x87D8
#define global GL_NEGATIVE_X_EXT 0x87D9
#define global GL_NEGATIVE_Y_EXT 0x87DA
#define global GL_NEGATIVE_Z_EXT 0x87DB
#define global GL_NEGATIVE_W_EXT 0x87DC
#define global GL_ZERO_EXT 0x87DD
#define global GL_ONE_EXT 0x87DE
#define global GL_NEGATIVE_ONE_EXT 0x87DF
#define global GL_NORMALIZED_RANGE_EXT 0x87E0
#define global GL_FULL_RANGE_EXT 0x87E1
#define global GL_CURRENT_VERTEX_EXT 0x87E2
#define global GL_MVP_MATRIX_EXT 0x87E3
#define global GL_VARIANT_VALUE_EXT 0x87E4
#define global GL_VARIANT_DATATYPE_EXT 0x87E5
#define global GL_VARIANT_ARRAY_STRIDE_EXT 0x87E6
#define global GL_VARIANT_ARRAY_TYPE_EXT 0x87E7
#define global GL_VARIANT_ARRAY_EXT 0x87E8
#define global GL_VARIANT_ARRAY_POINTER_EXT 0x87E9
#define global GL_INVARIANT_VALUE_EXT 0x87EA
#define global GL_INVARIANT_DATATYPE_EXT 0x87EB
#define global GL_LOCAL_CONSTANT_VALUE_EXT 0x87EC
#define global GL_LOCAL_CONSTANT_DATATYPE_EXT 0x87ED
#define global GL_EXT_vertex_weighting 1
#define global GL_MODELVIEW0_STACK_DEPTH_EXT 0x0BA3
#define global GL_MODELVIEW0_MATRIX_EXT 0x0BA6
#define global GL_MODELVIEW0_EXT 0x1700
#define global GL_MODELVIEW1_STACK_DEPTH_EXT 0x8502
#define global GL_MODELVIEW1_MATRIX_EXT 0x8506
#define global GL_VERTEX_WEIGHTING_EXT 0x8509
#define global GL_MODELVIEW1_EXT 0x850A
#define global GL_CURRENT_VERTEX_WEIGHT_EXT 0x850B
#define global GL_VERTEX_WEIGHT_ARRAY_EXT 0x850C
#define global GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT 0x850D
#define global GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT 0x850E
#define global GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT 0x850F
#define global GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT 0x8510
#define global GL_GREMEDY_frame_terminator 1
#define global GL_GREMEDY_string_marker 1
#define global GL_HP_convolution_border_modes 1
#define global GL_HP_image_transform 1
#define global GL_HP_occlusion_test 1
#define global GL_OCCLUSION_TEST_HP 0x8165
#define global GL_OCCLUSION_TEST_RESULT_HP 0x8166
#define global GL_HP_texture_lighting 1
#define global GL_IBM_cull_vertex 1
#define global GL_CULL_VERTEX_IBM 103050
#define global GL_IBM_multimode_draw_arrays 1
#define global GL_IBM_rasterpos_clip 1
#define global GL_RASTER_POSITION_UNCLIPPED_IBM 103010
#define global GL_IBM_static_data 1
#define global GL_ALL_STATIC_DATA_IBM 103060
#define global GL_STATIC_VERTEX_ARRAY_IBM 103061
#define global GL_IBM_texture_mirrored_repeat 1
#define global GL_MIRRORED_REPEAT_IBM 0x8370
#define global GL_IBM_vertex_array_lists 1
#define global GL_VERTEX_ARRAY_LIST_IBM 103070
#define global GL_NORMAL_ARRAY_LIST_IBM 103071
#define global GL_COLOR_ARRAY_LIST_IBM 103072
#define global GL_INDEX_ARRAY_LIST_IBM 103073
#define global GL_TEXTURE_COORD_ARRAY_LIST_IBM 103074
#define global GL_EDGE_FLAG_ARRAY_LIST_IBM 103075
#define global GL_FOG_COORDINATE_ARRAY_LIST_IBM 103076
#define global GL_SECONDARY_COLOR_ARRAY_LIST_IBM 103077
#define global GL_VERTEX_ARRAY_LIST_STRIDE_IBM 103080
#define global GL_NORMAL_ARRAY_LIST_STRIDE_IBM 103081
#define global GL_COLOR_ARRAY_LIST_STRIDE_IBM 103082
#define global GL_INDEX_ARRAY_LIST_STRIDE_IBM 103083
#define global GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM 103084
#define global GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM 103085
#define global GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM 103086
#define global GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM 103087
#define global GL_INGR_color_clamp 1
#define global GL_RED_MIN_CLAMP_INGR 0x8560
#define global GL_GREEN_MIN_CLAMP_INGR 0x8561
#define global GL_BLUE_MIN_CLAMP_INGR 0x8562
#define global GL_ALPHA_MIN_CLAMP_INGR 0x8563
#define global GL_RED_MAX_CLAMP_INGR 0x8564
#define global GL_GREEN_MAX_CLAMP_INGR 0x8565
#define global GL_BLUE_MAX_CLAMP_INGR 0x8566
#define global GL_ALPHA_MAX_CLAMP_INGR 0x8567
#define global GL_INGR_interlace_read 1
#define global GL_INTERLACE_READ_INGR 0x8568
#define global GL_INTEL_parallel_arrays 1
#define global GL_PARALLEL_ARRAYS_INTEL 0x83F4
#define global GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL 0x83F5
#define global GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL 0x83F6
#define global GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL 0x83F7
#define global GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL 0x83F8
#define global GL_INTEL_texture_scissor 1
#define global GL_KTX_buffer_region 1
#define global GL_KTX_FRONT_REGION 0x0
#define global GL_KTX_BACK_REGION 0x1
#define global GL_KTX_Z_REGION 0x2
#define global GL_KTX_STENCIL_REGION 0x3
#define global GL_MESAX_texture_stack 1
#define global GL_TEXTURE_1D_STACK_MESAX 0x8759
#define global GL_TEXTURE_2D_STACK_MESAX 0x875A
#define global GL_PROXY_TEXTURE_1D_STACK_MESAX 0x875B
#define global GL_PROXY_TEXTURE_2D_STACK_MESAX 0x875C
#define global GL_TEXTURE_1D_STACK_BINDING_MESAX 0x875D
#define global GL_TEXTURE_2D_STACK_BINDING_MESAX 0x875E
#define global GL_MESA_pack_invert 1
#define global GL_PACK_INVERT_MESA 0x8758
#define global GL_MESA_resize_buffers 1
#define global GL_MESA_window_pos 1
#define global GL_MESA_ycbcr_texture 1
#define global GL_UNSIGNED_SHORT_8_8_MESA 0x85BA
#define global GL_UNSIGNED_SHORT_8_8_REV_MESA 0x85BB
#define global GL_YCBCR_MESA 0x8757
#define global GL_NV_blend_square 1
#define global GL_NV_conditional_render 1
#define global GL_QUERY_WAIT_NV 0x8E13
#define global GL_QUERY_NO_WAIT_NV 0x8E14
#define global GL_QUERY_BY_REGION_WAIT_NV 0x8E15
#define global GL_QUERY_BY_REGION_NO_WAIT_NV 0x8E16
#define global GL_NV_copy_depth_to_color 1
#define global GL_DEPTH_STENCIL_TO_RGBA_NV 0x886E
#define global GL_DEPTH_STENCIL_TO_BGRA_NV 0x886F
#define global GL_NV_depth_buffer_float 1
#define global GL_DEPTH_COMPONENT32F_NV 0x8DAB
#define global GL_DEPTH32F_STENCIL8_NV 0x8DAC
#define global GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV 0x8DAD
#define global GL_DEPTH_BUFFER_FLOAT_MODE_NV 0x8DAF
#define global GL_NV_depth_clamp 1
#define global GL_DEPTH_CLAMP_NV 0x864F
#define global GL_NV_depth_range_unclamped 1
#define global GL_SAMPLE_COUNT_BITS_NV 0x8864
#define global GL_CURRENT_SAMPLE_COUNT_QUERY_NV 0x8865
#define global GL_QUERY_RESULT_NV 0x8866
#define global GL_QUERY_RESULT_AVAILABLE_NV 0x8867
#define global GL_SAMPLE_COUNT_NV 0x8914
#define global GL_NV_evaluators 1
#define global GL_EVAL_2D_NV 0x86C0
#define global GL_EVAL_TRIANGULAR_2D_NV 0x86C1
#define global GL_MAP_TESSELLATION_NV 0x86C2
#define global GL_MAP_ATTRIB_U_ORDER_NV 0x86C3
#define global GL_MAP_ATTRIB_V_ORDER_NV 0x86C4
#define global GL_EVAL_FRACTIONAL_TESSELLATION_NV 0x86C5
#define global GL_EVAL_VERTEX_ATTRIB0_NV 0x86C6
#define global GL_EVAL_VERTEX_ATTRIB1_NV 0x86C7
#define global GL_EVAL_VERTEX_ATTRIB2_NV 0x86C8
#define global GL_EVAL_VERTEX_ATTRIB3_NV 0x86C9
#define global GL_EVAL_VERTEX_ATTRIB4_NV 0x86CA
#define global GL_EVAL_VERTEX_ATTRIB5_NV 0x86CB
#define global GL_EVAL_VERTEX_ATTRIB6_NV 0x86CC
#define global GL_EVAL_VERTEX_ATTRIB7_NV 0x86CD
#define global GL_EVAL_VERTEX_ATTRIB8_NV 0x86CE
#define global GL_EVAL_VERTEX_ATTRIB9_NV 0x86CF
#define global GL_EVAL_VERTEX_ATTRIB10_NV 0x86D0
#define global GL_EVAL_VERTEX_ATTRIB11_NV 0x86D1
#define global GL_EVAL_VERTEX_ATTRIB12_NV 0x86D2
#define global GL_EVAL_VERTEX_ATTRIB13_NV 0x86D3
#define global GL_EVAL_VERTEX_ATTRIB14_NV 0x86D4
#define global GL_EVAL_VERTEX_ATTRIB15_NV 0x86D5
#define global GL_MAX_MAP_TESSELLATION_NV 0x86D6
#define global GL_MAX_RATIONAL_EVAL_ORDER_NV 0x86D7
#define global GL_NV_explicit_multisample 1
#define global GL_SAMPLE_POSITION_NV 0x8E50
#define global GL_SAMPLE_MASK_NV 0x8E51
#define global GL_SAMPLE_MASK_VALUE_NV 0x8E52
#define global GL_TEXTURE_BINDING_RENDERBUFFER_NV 0x8E53
#define global GL_TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV 0x8E54
#define global GL_TEXTURE_RENDERBUFFER_NV 0x8E55
#define global GL_SAMPLER_RENDERBUFFER_NV 0x8E56
#define global GL_INT_SAMPLER_RENDERBUFFER_NV 0x8E57
#define global GL_UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV 0x8E58
#define global GL_MAX_SAMPLE_MASK_WORDS_NV 0x8E59
#define global GL_NV_fence 1
#define global GL_ALL_COMPLETED_NV 0x84F2
#define global GL_FENCE_STATUS_NV 0x84F3
#define global GL_FENCE_CONDITION_NV 0x84F4
#define global GL_NV_float_buffer 1
#define global GL_FLOAT_R_NV 0x8880
#define global GL_FLOAT_RG_NV 0x8881
#define global GL_FLOAT_RGB_NV 0x8882
#define global GL_FLOAT_RGBA_NV 0x8883
#define global GL_FLOAT_R16_NV 0x8884
#define global GL_FLOAT_R32_NV 0x8885
#define global GL_FLOAT_RG16_NV 0x8886
#define global GL_FLOAT_RG32_NV 0x8887
#define global GL_FLOAT_RGB16_NV 0x8888
#define global GL_FLOAT_RGB32_NV 0x8889
#define global GL_FLOAT_RGBA16_NV 0x888A
#define global GL_FLOAT_RGBA32_NV 0x888B
#define global GL_TEXTURE_FLOAT_COMPONENTS_NV 0x888C
#define global GL_FLOAT_CLEAR_COLOR_VALUE_NV 0x888D
#define global GL_FLOAT_RGBA_MODE_NV 0x888E
#define global GL_NV_fog_distance 1
#define global GL_FOG_DISTANCE_MODE_NV 0x855A
#define global GL_EYE_RADIAL_NV 0x855B
#define global GL_EYE_PLANE_ABSOLUTE_NV 0x855C
#define global GL_NV_fragment_program 1
#define global GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV 0x8868
#define global GL_FRAGMENT_PROGRAM_NV 0x8870
#define global GL_MAX_TEXTURE_COORDS_NV 0x8871
#define global GL_MAX_TEXTURE_IMAGE_UNITS_NV 0x8872
#define global GL_FRAGMENT_PROGRAM_BINDING_NV 0x8873
#define global GL_PROGRAM_ERROR_STRING_NV 0x8874
#define global GL_NV_fragment_program2 1
#define global GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV 0x88F4
#define global GL_MAX_PROGRAM_CALL_DEPTH_NV 0x88F5
#define global GL_MAX_PROGRAM_IF_DEPTH_NV 0x88F6
#define global GL_MAX_PROGRAM_LOOP_DEPTH_NV 0x88F7
#define global GL_MAX_PROGRAM_LOOP_COUNT_NV 0x88F8
#define global GL_NV_fragment_program4 1
#define global GL_NV_fragment_program_option 1
#define global GL_NV_framebuffer_multisample_coverage 1
#define global GL_RENDERBUFFER_COVERAGE_SAMPLES_NV 0x8CAB
#define global GL_RENDERBUFFER_COLOR_SAMPLES_NV 0x8E10
#define global GL_MAX_MULTISAMPLE_COVERAGE_MODES_NV 0x8E11
#define global GL_MULTISAMPLE_COVERAGE_MODES_NV 0x8E12
#define global GL_NV_geometry_program4 1
#define global GL_GEOMETRY_PROGRAM_NV 0x8C26
#define global GL_MAX_PROGRAM_OUTPUT_VERTICES_NV 0x8C27
#define global GL_MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV 0x8C28
#define global GL_NV_geometry_shader4 1
#define global GL_NV_gpu_program4 1
#define global GL_MIN_PROGRAM_TEXEL_OFFSET_NV 0x8904
#define global GL_MAX_PROGRAM_TEXEL_OFFSET_NV 0x8905
#define global GL_PROGRAM_ATTRIB_COMPONENTS_NV 0x8906
#define global GL_PROGRAM_RESULT_COMPONENTS_NV 0x8907
#define global GL_MAX_PROGRAM_ATTRIB_COMPONENTS_NV 0x8908
#define global GL_MAX_PROGRAM_RESULT_COMPONENTS_NV 0x8909
#define global GL_MAX_PROGRAM_GENERIC_ATTRIBS_NV 0x8DA5
#define global GL_MAX_PROGRAM_GENERIC_RESULTS_NV 0x8DA6
#define global GL_NV_half_float 1
#define global GL_HALF_FLOAT_NV 0x140B
#define global GL_NV_light_max_exponent 1
#define global GL_MAX_SHININESS_NV 0x8504
#define global GL_MAX_SPOT_EXPONENT_NV 0x8505
#define global GL_NV_multisample_filter_hint 1
#define global GL_MULTISAMPLE_FILTER_HINT_NV 0x8534
#define global GL_NV_occlusion_query 1
#define global GL_PIXEL_COUNTER_BITS_NV 0x8864
#define global GL_CURRENT_OCCLUSION_QUERY_ID_NV 0x8865
#define global GL_PIXEL_COUNT_NV 0x8866
#define global GL_PIXEL_COUNT_AVAILABLE_NV 0x8867
#define global GL_NV_packed_depth_stencil 1
#define global GL_DEPTH_STENCIL_NV 0x84F9
#define global GL_UNSIGNED_INT_24_8_NV 0x84FA
#define global GL_NV_parameter_buffer_object 1
#define global GL_MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV 0x8DA0
#define global GL_MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV 0x8DA1
#define global GL_VERTEX_PROGRAM_PARAMETER_BUFFER_NV 0x8DA2
#define global GL_GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV 0x8DA3
#define global GL_FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV 0x8DA4
#define global GL_NV_pixel_data_range 1
#define global GL_WRITE_PIXEL_DATA_RANGE_NV 0x8878
#define global GL_READ_PIXEL_DATA_RANGE_NV 0x8879
#define global GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV 0x887A
#define global GL_READ_PIXEL_DATA_RANGE_LENGTH_NV 0x887B
#define global GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV 0x887C
#define global GL_READ_PIXEL_DATA_RANGE_POINTER_NV 0x887D
#define global GL_NV_point_sprite 1
#define global GL_POINT_SPRITE_NV 0x8861
#define global GL_COORD_REPLACE_NV 0x8862
#define global GL_POINT_SPRITE_R_MODE_NV 0x8863
#define global GL_NV_present_video 1
#define global GL_FRAME_NV 0x8E26
#define global GL_FIELDS_NV 0x8E27
#define global GL_CURRENT_TIME_NV 0x8E28
#define global GL_NUM_FILL_STREAMS_NV 0x8E29
#define global GL_PRESENT_TIME_NV 0x8E2A
#define global GL_PRESENT_DURATION_NV 0x8E2B
#define global GL_NV_primitive_restart 1
#define global GL_PRIMITIVE_RESTART_NV 0x8558
#define global GL_PRIMITIVE_RESTART_INDEX_NV 0x8559
#define global GL_NV_register_combiners 1
#define global GL_REGISTER_COMBINERS_NV 0x8522
#define global GL_VARIABLE_A_NV 0x8523
#define global GL_VARIABLE_B_NV 0x8524
#define global GL_VARIABLE_C_NV 0x8525
#define global GL_VARIABLE_D_NV 0x8526
#define global GL_VARIABLE_E_NV 0x8527
#define global GL_VARIABLE_F_NV 0x8528
#define global GL_VARIABLE_G_NV 0x8529
#define global GL_CONSTANT_COLOR0_NV 0x852A
#define global GL_CONSTANT_COLOR1_NV 0x852B
#define global GL_PRIMARY_COLOR_NV 0x852C
#define global GL_SECONDARY_COLOR_NV 0x852D
#define global GL_SPARE0_NV 0x852E
#define global GL_SPARE1_NV 0x852F
#define global GL_DISCARD_NV 0x8530
#define global GL_E_TIMES_F_NV 0x8531
#define global GL_SPARE0_PLUS_SECONDARY_COLOR_NV 0x8532
#define global GL_UNSIGNED_IDENTITY_NV 0x8536
#define global GL_UNSIGNED_INVERT_NV 0x8537
#define global GL_EXPAND_NORMAL_NV 0x8538
#define global GL_EXPAND_NEGATE_NV 0x8539
#define global GL_HALF_BIAS_NORMAL_NV 0x853A
#define global GL_HALF_BIAS_NEGATE_NV 0x853B
#define global GL_SIGNED_IDENTITY_NV 0x853C
#define global GL_SIGNED_NEGATE_NV 0x853D
#define global GL_SCALE_BY_TWO_NV 0x853E
#define global GL_SCALE_BY_FOUR_NV 0x853F
#define global GL_SCALE_BY_ONE_HALF_NV 0x8540
#define global GL_BIAS_BY_NEGATIVE_ONE_HALF_NV 0x8541
#define global GL_COMBINER_INPUT_NV 0x8542
#define global GL_COMBINER_MAPPING_NV 0x8543
#define global GL_COMBINER_COMPONENT_USAGE_NV 0x8544
#define global GL_COMBINER_AB_DOT_PRODUCT_NV 0x8545
#define global GL_COMBINER_CD_DOT_PRODUCT_NV 0x8546
#define global GL_COMBINER_MUX_SUM_NV 0x8547
#define global GL_COMBINER_SCALE_NV 0x8548
#define global GL_COMBINER_BIAS_NV 0x8549
#define global GL_COMBINER_AB_OUTPUT_NV 0x854A
#define global GL_COMBINER_CD_OUTPUT_NV 0x854B
#define global GL_COMBINER_SUM_OUTPUT_NV 0x854C
#define global GL_MAX_GENERAL_COMBINERS_NV 0x854D
#define global GL_NUM_GENERAL_COMBINERS_NV 0x854E
#define global GL_COLOR_SUM_CLAMP_NV 0x854F
#define global GL_COMBINER0_NV 0x8550
#define global GL_COMBINER1_NV 0x8551
#define global GL_COMBINER2_NV 0x8552
#define global GL_COMBINER3_NV 0x8553
#define global GL_COMBINER4_NV 0x8554
#define global GL_COMBINER5_NV 0x8555
#define global GL_COMBINER6_NV 0x8556
#define global GL_COMBINER7_NV 0x8557
#define global GL_NV_register_combiners2 1
#define global GL_PER_STAGE_CONSTANTS_NV 0x8535
#define global GL_NV_texgen_emboss 1
#define global GL_EMBOSS_LIGHT_NV 0x855D
#define global GL_EMBOSS_CONSTANT_NV 0x855E
#define global GL_EMBOSS_MAP_NV 0x855F
#define global GL_NV_texgen_reflection 1
#define global GL_NORMAL_MAP_NV 0x8511
#define global GL_REFLECTION_MAP_NV 0x8512
#define global GL_NV_texture_compression_vtc 1
#define global GL_NV_texture_env_combine4 1
#define global GL_COMBINE4_NV 0x8503
#define global GL_SOURCE3_RGB_NV 0x8583
#define global GL_SOURCE3_ALPHA_NV 0x858B
#define global GL_OPERAND3_RGB_NV 0x8593
#define global GL_OPERAND3_ALPHA_NV 0x859B
#define global GL_NV_texture_expand_normal 1
#define global GL_TEXTURE_UNSIGNED_REMAP_MODE_NV 0x888F
#define global GL_NV_texture_rectangle 1
#define global GL_TEXTURE_RECTANGLE_NV 0x84F5
#define global GL_TEXTURE_BINDING_RECTANGLE_NV 0x84F6
#define global GL_PROXY_TEXTURE_RECTANGLE_NV 0x84F7
#define global GL_MAX_RECTANGLE_TEXTURE_SIZE_NV 0x84F8
#define global GL_NV_texture_shader 1
#define global GL_OFFSET_TEXTURE_RECTANGLE_NV 0x864C
#define global GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV 0x864D
#define global GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV 0x864E
#define global GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV 0x86D9
#define global GL_UNSIGNED_INT_S8_S8_8_8_NV 0x86DA
#define global GL_UNSIGNED_INT_8_8_S8_S8_REV_NV 0x86DB
#define global GL_DSDT_MAG_INTENSITY_NV 0x86DC
#define global GL_SHADER_CONSISTENT_NV 0x86DD
#define global GL_TEXTURE_SHADER_NV 0x86DE
#define global GL_SHADER_OPERATION_NV 0x86DF
#define global GL_CULL_MODES_NV 0x86E0
#define global GL_OFFSET_TEXTURE_2D_MATRIX_NV 0x86E1
#define global GL_OFFSET_TEXTURE_MATRIX_NV 0x86E1
#define global GL_OFFSET_TEXTURE_2D_SCALE_NV 0x86E2
#define global GL_OFFSET_TEXTURE_SCALE_NV 0x86E2
#define global GL_OFFSET_TEXTURE_BIAS_NV 0x86E3
#define global GL_OFFSET_TEXTURE_2D_BIAS_NV 0x86E3
#define global GL_PREVIOUS_TEXTURE_INPUT_NV 0x86E4
#define global GL_CONST_EYE_NV 0x86E5
#define global GL_PASS_THROUGH_NV 0x86E6
#define global GL_CULL_FRAGMENT_NV 0x86E7
#define global GL_OFFSET_TEXTURE_2D_NV 0x86E8
#define global GL_DEPENDENT_AR_TEXTURE_2D_NV 0x86E9
#define global GL_DEPENDENT_GB_TEXTURE_2D_NV 0x86EA
#define global GL_DOT_PRODUCT_NV 0x86EC
#define global GL_DOT_PRODUCT_DEPTH_REPLACE_NV 0x86ED
#define global GL_DOT_PRODUCT_TEXTURE_2D_NV 0x86EE
#define global GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV 0x86F0
#define global GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV 0x86F1
#define global GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV 0x86F2
#define global GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV 0x86F3
#define global GL_HILO_NV 0x86F4
#define global GL_DSDT_NV 0x86F5
#define global GL_DSDT_MAG_NV 0x86F6
#define global GL_DSDT_MAG_VIB_NV 0x86F7
#define global GL_HILO16_NV 0x86F8
#define global GL_SIGNED_HILO_NV 0x86F9
#define global GL_SIGNED_HILO16_NV 0x86FA
#define global GL_SIGNED_RGBA_NV 0x86FB
#define global GL_SIGNED_RGBA8_NV 0x86FC
#define global GL_SIGNED_RGB_NV 0x86FE
#define global GL_SIGNED_RGB8_NV 0x86FF
#define global GL_SIGNED_LUMINANCE_NV 0x8701
#define global GL_SIGNED_LUMINANCE8_NV 0x8702
#define global GL_SIGNED_LUMINANCE_ALPHA_NV 0x8703
#define global GL_SIGNED_LUMINANCE8_ALPHA8_NV 0x8704
#define global GL_SIGNED_ALPHA_NV 0x8705
#define global GL_SIGNED_ALPHA8_NV 0x8706
#define global GL_SIGNED_INTENSITY_NV 0x8707
#define global GL_SIGNED_INTENSITY8_NV 0x8708
#define global GL_DSDT8_NV 0x8709
#define global GL_DSDT8_MAG8_NV 0x870A
#define global GL_DSDT8_MAG8_INTENSITY8_NV 0x870B
#define global GL_SIGNED_RGB_UNSIGNED_ALPHA_NV 0x870C
#define global GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV 0x870D
#define global GL_HI_SCALE_NV 0x870E
#define global GL_LO_SCALE_NV 0x870F
#define global GL_DS_SCALE_NV 0x8710
#define global GL_DT_SCALE_NV 0x8711
#define global GL_MAGNITUDE_SCALE_NV 0x8712
#define global GL_VIBRANCE_SCALE_NV 0x8713
#define global GL_HI_BIAS_NV 0x8714
#define global GL_LO_BIAS_NV 0x8715
#define global GL_DS_BIAS_NV 0x8716
#define global GL_DT_BIAS_NV 0x8717
#define global GL_MAGNITUDE_BIAS_NV 0x8718
#define global GL_VIBRANCE_BIAS_NV 0x8719
#define global GL_TEXTURE_BORDER_VALUES_NV 0x871A
#define global GL_TEXTURE_HI_SIZE_NV 0x871B
#define global GL_TEXTURE_LO_SIZE_NV 0x871C
#define global GL_TEXTURE_DS_SIZE_NV 0x871D
#define global GL_TEXTURE_DT_SIZE_NV 0x871E
#define global GL_TEXTURE_MAG_SIZE_NV 0x871F
#define global GL_NV_texture_shader2 1
#define global GL_DOT_PRODUCT_TEXTURE_3D_NV 0x86EF
#define global GL_NV_texture_shader3 1
#define global GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV 0x8850
#define global GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV 0x8851
#define global GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV 0x8852
#define global GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV 0x8853
#define global GL_OFFSET_HILO_TEXTURE_2D_NV 0x8854
#define global GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV 0x8855
#define global GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV 0x8856
#define global GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV 0x8857
#define global GL_DEPENDENT_HILO_TEXTURE_2D_NV 0x8858
#define global GL_DEPENDENT_RGB_TEXTURE_3D_NV 0x8859
#define global GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV 0x885A
#define global GL_DOT_PRODUCT_PASS_THROUGH_NV 0x885B
#define global GL_DOT_PRODUCT_TEXTURE_1D_NV 0x885C
#define global GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV 0x885D
#define global GL_HILO8_NV 0x885E
#define global GL_SIGNED_HILO8_NV 0x885F
#define global GL_FORCE_BLUE_TO_ONE_NV 0x8860
#define global GL_NV_transform_feedback 1
#define global GL_BACK_PRIMARY_COLOR_NV 0x8C77
#define global GL_BACK_SECONDARY_COLOR_NV 0x8C78
#define global GL_TEXTURE_COORD_NV 0x8C79
#define global GL_CLIP_DISTANCE_NV 0x8C7A
#define global GL_VERTEX_ID_NV 0x8C7B
#define global GL_PRIMITIVE_ID_NV 0x8C7C
#define global GL_GENERIC_ATTRIB_NV 0x8C7D
#define global GL_TRANSFORM_FEEDBACK_ATTRIBS_NV 0x8C7E
#define global GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV 0x8C7F
#define global GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV 0x8C80
#define global GL_ACTIVE_VARYINGS_NV 0x8C81
#define global GL_ACTIVE_VARYING_MAX_LENGTH_NV 0x8C82
#define global GL_TRANSFORM_FEEDBACK_VARYINGS_NV 0x8C83
#define global GL_TRANSFORM_FEEDBACK_BUFFER_START_NV 0x8C84
#define global GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV 0x8C85
#define global GL_TRANSFORM_FEEDBACK_RECORD_NV 0x8C86
#define global GL_PRIMITIVES_GENERATED_NV 0x8C87
#define global GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV 0x8C88
#define global GL_RASTERIZER_DISCARD_NV 0x8C89
#define global GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_NV 0x8C8A
#define global GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV 0x8C8B
#define global GL_INTERLEAVED_ATTRIBS_NV 0x8C8C
#define global GL_SEPARATE_ATTRIBS_NV 0x8C8D
#define global GL_TRANSFORM_FEEDBACK_BUFFER_NV 0x8C8E
#define global GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV 0x8C8F
#define global GL_NV_vertex_array_range 1
#define global GL_VERTEX_ARRAY_RANGE_NV 0x851D
#define global GL_VERTEX_ARRAY_RANGE_LENGTH_NV 0x851E
#define global GL_VERTEX_ARRAY_RANGE_VALID_NV 0x851F
#define global GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV 0x8520
#define global GL_VERTEX_ARRAY_RANGE_POINTER_NV 0x8521
#define global GL_NV_vertex_array_range2 1
#define global GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV 0x8533
#define global GL_NV_vertex_program 1
#define global GL_VERTEX_PROGRAM_NV 0x8620
#define global GL_VERTEX_STATE_PROGRAM_NV 0x8621
#define global GL_ATTRIB_ARRAY_SIZE_NV 0x8623
#define global GL_ATTRIB_ARRAY_STRIDE_NV 0x8624
#define global GL_ATTRIB_ARRAY_TYPE_NV 0x8625
#define global GL_CURRENT_ATTRIB_NV 0x8626
#define global GL_PROGRAM_LENGTH_NV 0x8627
#define global GL_PROGRAM_STRING_NV 0x8628
#define global GL_MODELVIEW_PROJECTION_NV 0x8629
#define global GL_IDENTITY_NV 0x862A
#define global GL_INVERSE_NV 0x862B
#define global GL_TRANSPOSE_NV 0x862C
#define global GL_INVERSE_TRANSPOSE_NV 0x862D
#define global GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV 0x862E
#define global GL_MAX_TRACK_MATRICES_NV 0x862F
#define global GL_MATRIX0_NV 0x8630
#define global GL_MATRIX1_NV 0x8631
#define global GL_MATRIX2_NV 0x8632
#define global GL_MATRIX3_NV 0x8633
#define global GL_MATRIX4_NV 0x8634
#define global GL_MATRIX5_NV 0x8635
#define global GL_MATRIX6_NV 0x8636
#define global GL_MATRIX7_NV 0x8637
#define global GL_CURRENT_MATRIX_STACK_DEPTH_NV 0x8640
#define global GL_CURRENT_MATRIX_NV 0x8641
#define global GL_VERTEX_PROGRAM_POINT_SIZE_NV 0x8642
#define global GL_VERTEX_PROGRAM_TWO_SIDE_NV 0x8643
#define global GL_PROGRAM_PARAMETER_NV 0x8644
#define global GL_ATTRIB_ARRAY_POINTER_NV 0x8645
#define global GL_PROGRAM_TARGET_NV 0x8646
#define global GL_PROGRAM_RESIDENT_NV 0x8647
#define global GL_TRACK_MATRIX_NV 0x8648
#define global GL_TRACK_MATRIX_TRANSFORM_NV 0x8649
#define global GL_VERTEX_PROGRAM_BINDING_NV 0x864A
#define global GL_PROGRAM_ERROR_POSITION_NV 0x864B
#define global GL_VERTEX_ATTRIB_ARRAY0_NV 0x8650
#define global GL_VERTEX_ATTRIB_ARRAY1_NV 0x8651
#define global GL_VERTEX_ATTRIB_ARRAY2_NV 0x8652
#define global GL_VERTEX_ATTRIB_ARRAY3_NV 0x8653
#define global GL_VERTEX_ATTRIB_ARRAY4_NV 0x8654
#define global GL_VERTEX_ATTRIB_ARRAY5_NV 0x8655
#define global GL_VERTEX_ATTRIB_ARRAY6_NV 0x8656
#define global GL_VERTEX_ATTRIB_ARRAY7_NV 0x8657
#define global GL_VERTEX_ATTRIB_ARRAY8_NV 0x8658
#define global GL_VERTEX_ATTRIB_ARRAY9_NV 0x8659
#define global GL_VERTEX_ATTRIB_ARRAY10_NV 0x865A
#define global GL_VERTEX_ATTRIB_ARRAY11_NV 0x865B
#define global GL_VERTEX_ATTRIB_ARRAY12_NV 0x865C
#define global GL_VERTEX_ATTRIB_ARRAY13_NV 0x865D
#define global GL_VERTEX_ATTRIB_ARRAY14_NV 0x865E
#define global GL_VERTEX_ATTRIB_ARRAY15_NV 0x865F
#define global GL_MAP1_VERTEX_ATTRIB0_4_NV 0x8660
#define global GL_MAP1_VERTEX_ATTRIB1_4_NV 0x8661
#define global GL_MAP1_VERTEX_ATTRIB2_4_NV 0x8662
#define global GL_MAP1_VERTEX_ATTRIB3_4_NV 0x8663
#define global GL_MAP1_VERTEX_ATTRIB4_4_NV 0x8664
#define global GL_MAP1_VERTEX_ATTRIB5_4_NV 0x8665
#define global GL_MAP1_VERTEX_ATTRIB6_4_NV 0x8666
#define global GL_MAP1_VERTEX_ATTRIB7_4_NV 0x8667
#define global GL_MAP1_VERTEX_ATTRIB8_4_NV 0x8668
#define global GL_MAP1_VERTEX_ATTRIB9_4_NV 0x8669
#define global GL_MAP1_VERTEX_ATTRIB10_4_NV 0x866A
#define global GL_MAP1_VERTEX_ATTRIB11_4_NV 0x866B
#define global GL_MAP1_VERTEX_ATTRIB12_4_NV 0x866C
#define global GL_MAP1_VERTEX_ATTRIB13_4_NV 0x866D
#define global GL_MAP1_VERTEX_ATTRIB14_4_NV 0x866E
#define global GL_MAP1_VERTEX_ATTRIB15_4_NV 0x866F
#define global GL_MAP2_VERTEX_ATTRIB0_4_NV 0x8670
#define global GL_MAP2_VERTEX_ATTRIB1_4_NV 0x8671
#define global GL_MAP2_VERTEX_ATTRIB2_4_NV 0x8672
#define global GL_MAP2_VERTEX_ATTRIB3_4_NV 0x8673
#define global GL_MAP2_VERTEX_ATTRIB4_4_NV 0x8674
#define global GL_MAP2_VERTEX_ATTRIB5_4_NV 0x8675
#define global GL_MAP2_VERTEX_ATTRIB6_4_NV 0x8676
#define global GL_MAP2_VERTEX_ATTRIB7_4_NV 0x8677
#define global GL_MAP2_VERTEX_ATTRIB8_4_NV 0x8678
#define global GL_MAP2_VERTEX_ATTRIB9_4_NV 0x8679
#define global GL_MAP2_VERTEX_ATTRIB10_4_NV 0x867A
#define global GL_MAP2_VERTEX_ATTRIB11_4_NV 0x867B
#define global GL_MAP2_VERTEX_ATTRIB12_4_NV 0x867C
#define global GL_MAP2_VERTEX_ATTRIB13_4_NV 0x867D
#define global GL_MAP2_VERTEX_ATTRIB14_4_NV 0x867E
#define global GL_MAP2_VERTEX_ATTRIB15_4_NV 0x867F
#define global GL_NV_vertex_program1_1 1
#define global GL_NV_vertex_program2 1
#define global GL_NV_vertex_program2_option 1
#define global GL_NV_vertex_program3 1
#define global MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB 0x8B4C
#define global GL_NV_vertex_program4 1
#define global GL_OES_byte_coordinates 1
#define global GL_OES_compressed_paletted_texture 1
#define global GL_PALETTE4_RGB8_OES 0x8B90
#define global GL_PALETTE4_RGBA8_OES 0x8B91
#define global GL_PALETTE4_R5_G6_B5_OES 0x8B92
#define global GL_PALETTE4_RGBA4_OES 0x8B93
#define global GL_PALETTE4_RGB5_A1_OES 0x8B94
#define global GL_PALETTE8_RGB8_OES 0x8B95
#define global GL_PALETTE8_RGBA8_OES 0x8B96
#define global GL_PALETTE8_R5_G6_B5_OES 0x8B97
#define global GL_PALETTE8_RGBA4_OES 0x8B98
#define global GL_PALETTE8_RGB5_A1_OES 0x8B99
#define global GL_OES_read_format 1
#define global GL_IMPLEMENTATION_COLOR_READ_TYPE_OES 0x8B9A
#define global GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES 0x8B9B
#define global GL_OES_single_precision 1
#define global GL_OML_interlace 1
#define global GL_INTERLACE_OML 0x8980
#define global GL_INTERLACE_READ_OML 0x8981
#define global GL_OML_resample 1
#define global GL_PACK_RESAMPLE_OML 0x8984
#define global GL_UNPACK_RESAMPLE_OML 0x8985
#define global GL_RESAMPLE_REPLICATE_OML 0x8986
#define global GL_RESAMPLE_ZERO_FILL_OML 0x8987
#define global GL_RESAMPLE_AVERAGE_OML 0x8988
#define global GL_RESAMPLE_DECIMATE_OML 0x8989
#define global GL_OML_subsample 1
#define global GL_FORMAT_SUBSAMPLE_24_24_OML 0x8982
#define global GL_FORMAT_SUBSAMPLE_244_244_OML 0x8983
#define global GL_PGI_misc_hints 1
#define global GL_PREFER_DOUBLEBUFFER_HINT_PGI 107000
#define global GL_CONSERVE_MEMORY_HINT_PGI 107005
#define global GL_RECLAIM_MEMORY_HINT_PGI 107006
#define global GL_NATIVE_GRAPHICS_HANDLE_PGI 107010
#define global GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI 107011
#define global GL_NATIVE_GRAPHICS_END_HINT_PGI 107012
#define global GL_ALWAYS_FAST_HINT_PGI 107020
#define global GL_ALWAYS_SOFT_HINT_PGI 107021
#define global GL_ALLOW_DRAW_OBJ_HINT_PGI 107022
#define global GL_ALLOW_DRAW_WIN_HINT_PGI 107023
#define global GL_ALLOW_DRAW_FRG_HINT_PGI 107024
#define global GL_ALLOW_DRAW_MEM_HINT_PGI 107025
#define global GL_STRICT_DEPTHFUNC_HINT_PGI 107030
#define global GL_STRICT_LIGHTING_HINT_PGI 107031
#define global GL_STRICT_SCISSOR_HINT_PGI 107032
#define global GL_FULL_STIPPLE_HINT_PGI 107033
#define global GL_CLIP_NEAR_HINT_PGI 107040
#define global GL_CLIP_FAR_HINT_PGI 107041
#define global GL_WIDE_LINE_HINT_PGI 107042
#define global GL_BACK_NORMALS_HINT_PGI 107043
#define global GL_PGI_vertex_hints 1
#define global GL_VERTEX23_BIT_PGI 0x00000004
#define global GL_VERTEX4_BIT_PGI 0x00000008
#define global GL_COLOR3_BIT_PGI 0x00010000
#define global GL_COLOR4_BIT_PGI 0x00020000
#define global GL_EDGEFLAG_BIT_PGI 0x00040000
#define global GL_INDEX_BIT_PGI 0x00080000
#define global GL_MAT_AMBIENT_BIT_PGI 0x00100000
#define global GL_VERTEX_DATA_HINT_PGI 107050
#define global GL_VERTEX_CONSISTENT_HINT_PGI 107051
#define global GL_MATERIAL_SIDE_HINT_PGI 107052
#define global GL_MAX_VERTEX_HINT_PGI 107053
#define global GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI 0x00200000
#define global GL_MAT_DIFFUSE_BIT_PGI 0x00400000
#define global GL_MAT_EMISSION_BIT_PGI 0x00800000
#define global GL_MAT_COLOR_INDEXES_BIT_PGI 0x01000000
#define global GL_MAT_SHININESS_BIT_PGI 0x02000000
#define global GL_MAT_SPECULAR_BIT_PGI 0x04000000
#define global GL_NORMAL_BIT_PGI 0x08000000
#define global GL_TEXCOORD1_BIT_PGI 0x10000000
#define global GL_TEXCOORD2_BIT_PGI 0x20000000
#define global GL_TEXCOORD3_BIT_PGI 0x40000000
#define global GL_TEXCOORD4_BIT_PGI 0x80000000
#define global GL_REND_screen_coordinates 1
#define global GL_SCREEN_COORDINATES_REND 0x8490
#define global GL_INVERTED_SCREEN_W_REND 0x8491
#define global GL_S3_s3tc 1
#define global GL_RGB_S3TC 0x83A0
#define global GL_RGB4_S3TC 0x83A1
#define global GL_RGBA_S3TC 0x83A2
#define global GL_RGBA4_S3TC 0x83A3
#define global GL_RGBA_DXT5_S3TC 0x83A4
#define global GL_RGBA4_DXT5_S3TC 0x83A5
#define global GL_SGIS_color_range 1
#define global GL_EXTENDED_RANGE_SGIS 0x85A5
#define global GL_MIN_RED_SGIS 0x85A6
#define global GL_MAX_RED_SGIS 0x85A7
#define global GL_MIN_GREEN_SGIS 0x85A8
#define global GL_MAX_GREEN_SGIS 0x85A9
#define global GL_MIN_BLUE_SGIS 0x85AA
#define global GL_MAX_BLUE_SGIS 0x85AB
#define global GL_MIN_ALPHA_SGIS 0x85AC
#define global GL_MAX_ALPHA_SGIS 0x85AD
#define global GL_SGIS_detail_texture 1
#define global GL_SGIS_fog_function 1
#define global GL_SGIS_generate_mipmap 1
#define global GL_GENERATE_MIPMAP_SGIS 0x8191
#define global GL_GENERATE_MIPMAP_HINT_SGIS 0x8192
#define global GL_SGIS_multisample 1
#define global GL_MULTISAMPLE_SGIS 0x809D
#define global GL_SAMPLE_ALPHA_TO_MASK_SGIS 0x809E
#define global GL_SAMPLE_ALPHA_TO_ONE_SGIS 0x809F
#define global GL_SAMPLE_MASK_SGIS 0x80A0
#define global GL_1PASS_SGIS 0x80A1
#define global GL_2PASS_0_SGIS 0x80A2
#define global GL_2PASS_1_SGIS 0x80A3
#define global GL_4PASS_0_SGIS 0x80A4
#define global GL_4PASS_1_SGIS 0x80A5
#define global GL_4PASS_2_SGIS 0x80A6
#define global GL_4PASS_3_SGIS 0x80A7
#define global GL_SAMPLE_BUFFERS_SGIS 0x80A8
#define global GL_SAMPLES_SGIS 0x80A9
#define global GL_SAMPLE_MASK_VALUE_SGIS 0x80AA
#define global GL_SAMPLE_MASK_INVERT_SGIS 0x80AB
#define global GL_SAMPLE_PATTERN_SGIS 0x80AC
#define global GL_SGIS_pixel_texture 1
#define global GL_SGIS_point_line_texgen 1
#define global GL_EYE_DISTANCE_TO_POINT_SGIS 0x81F0
#define global GL_OBJECT_DISTANCE_TO_POINT_SGIS 0x81F1
#define global GL_EYE_DISTANCE_TO_LINE_SGIS 0x81F2
#define global GL_OBJECT_DISTANCE_TO_LINE_SGIS 0x81F3
#define global GL_EYE_POINT_SGIS 0x81F4
#define global GL_OBJECT_POINT_SGIS 0x81F5
#define global GL_EYE_LINE_SGIS 0x81F6
#define global GL_OBJECT_LINE_SGIS 0x81F7
#define global GL_SGIS_sharpen_texture 1
#define global GL_SGIS_texture4D 1
#define global GL_SGIS_texture_border_clamp 1
#define global GL_CLAMP_TO_BORDER_SGIS 0x812D
#define global GL_SGIS_texture_edge_clamp 1
#define global GL_CLAMP_TO_EDGE_SGIS 0x812F
#define global GL_SGIS_texture_filter4 1
#define global GL_SGIS_texture_lod 1
#define global GL_TEXTURE_MIN_LOD_SGIS 0x813A
#define global GL_TEXTURE_MAX_LOD_SGIS 0x813B
#define global GL_TEXTURE_BASE_LEVEL_SGIS 0x813C
#define global GL_TEXTURE_MAX_LEVEL_SGIS 0x813D
#define global GL_SGIS_texture_select 1
#define global GL_SGIX_async 1
#define global GL_ASYNC_MARKER_SGIX 0x8329
#define global GL_SGIX_async_histogram 1
#define global GL_ASYNC_HISTOGRAM_SGIX 0x832C
#define global GL_MAX_ASYNC_HISTOGRAM_SGIX 0x832D
#define global GL_SGIX_async_pixel 1
#define global GL_ASYNC_TEX_IMAGE_SGIX 0x835C
#define global GL_ASYNC_DRAW_PIXELS_SGIX 0x835D
#define global GL_ASYNC_READ_PIXELS_SGIX 0x835E
#define global GL_MAX_ASYNC_TEX_IMAGE_SGIX 0x835F
#define global GL_MAX_ASYNC_DRAW_PIXELS_SGIX 0x8360
#define global GL_MAX_ASYNC_READ_PIXELS_SGIX 0x8361
#define global GL_SGIX_blend_alpha_minmax 1
#define global GL_ALPHA_MIN_SGIX 0x8320
#define global GL_ALPHA_MAX_SGIX 0x8321
#define global GL_SGIX_clipmap 1
#define global GL_SGIX_convolution_accuracy 1
#define global GL_CONVOLUTION_HINT_SGIX 0x8316
#define global GL_SGIX_depth_texture 1
#define global GL_DEPTH_COMPONENT16_SGIX 0x81A5
#define global GL_DEPTH_COMPONENT24_SGIX 0x81A6
#define global GL_DEPTH_COMPONENT32_SGIX 0x81A7
#define global GL_SGIX_flush_raster 1
#define global GL_SGIX_fog_offset 1
#define global GL_FOG_OFFSET_SGIX 0x8198
#define global GL_FOG_OFFSET_VALUE_SGIX 0x8199
#define global GL_SGIX_fog_texture 1
#define global GL_TEXTURE_FOG_SGIX 0
#define global GL_FOG_PATCHY_FACTOR_SGIX 0
#define global GL_FRAGMENT_FOG_SGIX 0
#define global GL_SGIX_fragment_specular_lighting 1
#define global GL_SGIX_framezoom 1
#define global GL_SGIX_interlace 1
#define global GL_INTERLACE_SGIX 0x8094
#define global GL_SGIX_ir_instrument1 1
#define global GL_SGIX_list_priority 1
#define global GL_SGIX_pixel_texture 1
#define global GL_SGIX_pixel_texture_bits 1
#define global GL_SGIX_reference_plane 1
#define global GL_SGIX_resample 1
#define global GL_PACK_RESAMPLE_SGIX 0x842E
#define global GL_UNPACK_RESAMPLE_SGIX 0x842F
#define global GL_RESAMPLE_DECIMATE_SGIX 0x8430
#define global GL_RESAMPLE_REPLICATE_SGIX 0x8433
#define global GL_RESAMPLE_ZERO_FILL_SGIX 0x8434
#define global GL_SGIX_shadow 1
#define global GL_TEXTURE_COMPARE_SGIX 0x819A
#define global GL_TEXTURE_COMPARE_OPERATOR_SGIX 0x819B
#define global GL_TEXTURE_LEQUAL_R_SGIX 0x819C
#define global GL_TEXTURE_GEQUAL_R_SGIX 0x819D
#define global GL_SGIX_shadow_ambient 1
#define global GL_SHADOW_AMBIENT_SGIX 0x80BF
#define global GL_SGIX_sprite 1
#define global GL_SGIX_tag_sample_buffer 1
#define global GL_SGIX_texture_add_env 1
#define global GL_SGIX_texture_coordinate_clamp 1
#define global GL_TEXTURE_MAX_CLAMP_S_SGIX 0x8369
#define global GL_TEXTURE_MAX_CLAMP_T_SGIX 0x836A
#define global GL_TEXTURE_MAX_CLAMP_R_SGIX 0x836B
#define global GL_SGIX_texture_lod_bias 1
#define global GL_SGIX_texture_multi_buffer 1
#define global GL_TEXTURE_MULTI_BUFFER_HINT_SGIX 0x812E
#define global GL_SGIX_texture_range 1
#define global GL_RGB_SIGNED_SGIX 0x85E0
#define global GL_RGBA_SIGNED_SGIX 0x85E1
#define global GL_ALPHA_SIGNED_SGIX 0x85E2
#define global GL_LUMINANCE_SIGNED_SGIX 0x85E3
#define global GL_INTENSITY_SIGNED_SGIX 0x85E4
#define global GL_LUMINANCE_ALPHA_SIGNED_SGIX 0x85E5
#define global GL_RGB16_SIGNED_SGIX 0x85E6
#define global GL_RGBA16_SIGNED_SGIX 0x85E7
#define global GL_ALPHA16_SIGNED_SGIX 0x85E8
#define global GL_LUMINANCE16_SIGNED_SGIX 0x85E9
#define global GL_INTENSITY16_SIGNED_SGIX 0x85EA
#define global GL_LUMINANCE16_ALPHA16_SIGNED_SGIX 0x85EB
#define global GL_RGB_EXTENDED_RANGE_SGIX 0x85EC
#define global GL_RGBA_EXTENDED_RANGE_SGIX 0x85ED
#define global GL_ALPHA_EXTENDED_RANGE_SGIX 0x85EE
#define global GL_LUMINANCE_EXTENDED_RANGE_SGIX 0x85EF
#define global GL_INTENSITY_EXTENDED_RANGE_SGIX 0x85F0
#define global GL_LUMINANCE_ALPHA_EXTENDED_RANGE_SGIX 0x85F1
#define global GL_RGB16_EXTENDED_RANGE_SGIX 0x85F2
#define global GL_RGBA16_EXTENDED_RANGE_SGIX 0x85F3
#define global GL_ALPHA16_EXTENDED_RANGE_SGIX 0x85F4
#define global GL_LUMINANCE16_EXTENDED_RANGE_SGIX 0x85F5
#define global GL_INTENSITY16_EXTENDED_RANGE_SGIX 0x85F6
#define global GL_LUMINANCE16_ALPHA16_EXTENDED_RANGE_SGIX 0x85F7
#define global GL_MIN_LUMINANCE_SGIS 0x85F8
#define global GL_MAX_LUMINANCE_SGIS 0x85F9
#define global GL_MIN_INTENSITY_SGIS 0x85FA
#define global GL_MAX_INTENSITY_SGIS 0x85FB
#define global GL_SGIX_texture_scale_bias 1
#define global GL_POST_TEXTURE_FILTER_BIAS_SGIX 0x8179
#define global GL_POST_TEXTURE_FILTER_SCALE_SGIX 0x817A
#define global GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX 0x817B
#define global GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX 0x817C
#define global GL_SGIX_vertex_preclip 1
#define global GL_VERTEX_PRECLIP_SGIX 0x83EE
#define global GL_VERTEX_PRECLIP_HINT_SGIX 0x83EF
#define global GL_SGIX_vertex_preclip_hint 1
#define global GL_SGIX_ycrcb 1
#define global GL_SGI_color_matrix 1
#define global GL_COLOR_MATRIX_SGI 0x80B1
#define global GL_COLOR_MATRIX_STACK_DEPTH_SGI 0x80B2
#define global GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI 0x80B3
#define global GL_POST_COLOR_MATRIX_RED_SCALE_SGI 0x80B4
#define global GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI 0x80B5
#define global GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI 0x80B6
#define global GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI 0x80B7
#define global GL_POST_COLOR_MATRIX_RED_BIAS_SGI 0x80B8
#define global GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI 0x80B9
#define global GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI 0x80BA
#define global GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI 0x80BB
#define global GL_SGI_color_table 1
#define global GL_COLOR_TABLE_SGI 0x80D0
#define global GL_POST_CONVOLUTION_COLOR_TABLE_SGI 0x80D1
#define global GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI 0x80D2
#define global GL_PROXY_COLOR_TABLE_SGI 0x80D3
#define global GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI 0x80D4
#define global GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI 0x80D5
#define global GL_COLOR_TABLE_SCALE_SGI 0x80D6
#define global GL_COLOR_TABLE_BIAS_SGI 0x80D7
#define global GL_COLOR_TABLE_FORMAT_SGI 0x80D8
#define global GL_COLOR_TABLE_WIDTH_SGI 0x80D9
#define global GL_COLOR_TABLE_RED_SIZE_SGI 0x80DA
#define global GL_COLOR_TABLE_GREEN_SIZE_SGI 0x80DB
#define global GL_COLOR_TABLE_BLUE_SIZE_SGI 0x80DC
#define global GL_COLOR_TABLE_ALPHA_SIZE_SGI 0x80DD
#define global GL_COLOR_TABLE_LUMINANCE_SIZE_SGI 0x80DE
#define global GL_COLOR_TABLE_INTENSITY_SIZE_SGI 0x80DF
#define global GL_SGI_texture_color_table 1
#define global GL_TEXTURE_COLOR_TABLE_SGI 0x80BC
#define global GL_PROXY_TEXTURE_COLOR_TABLE_SGI 0x80BD
#define global GL_SUNX_constant_data 1
#define global GL_UNPACK_CONSTANT_DATA_SUNX 0x81D5
#define global GL_TEXTURE_CONSTANT_DATA_SUNX 0x81D6
#define global GL_SUN_convolution_border_modes 1
#define global GL_WRAP_BORDER_SUN 0x81D4
#define global GL_SUN_global_alpha 1
#define global GL_GLOBAL_ALPHA_SUN 0x81D9
#define global GL_GLOBAL_ALPHA_FACTOR_SUN 0x81DA
#define global GL_SUN_mesh_array 1
#define global GL_QUAD_MESH_SUN 0x8614
#define global GL_TRIANGLE_MESH_SUN 0x8615
#define global GL_SUN_read_video_pixels 1
#define global GL_SUN_slice_accum 1
#define global GL_SLICE_ACCUM_SUN 0x85CC
#define global GL_SUN_triangle_list 1
#define global GL_RESTART_SUN 0x01
#define global GL_REPLACE_MIDDLE_SUN 0x02
#define global GL_REPLACE_OLDEST_SUN 0x03
#define global GL_TRIANGLE_LIST_SUN 0x81D7
#define global GL_REPLACEMENT_CODE_SUN 0x81D8
#define global GL_REPLACEMENT_CODE_ARRAY_SUN 0x85C0
#define global GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN 0x85C1
#define global GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN 0x85C2
#define global GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN 0x85C3
#define global GL_R1UI_V3F_SUN 0x85C4
#define global GL_R1UI_C4UB_V3F_SUN 0x85C5
#define global GL_R1UI_C3F_V3F_SUN 0x85C6
#define global GL_R1UI_N3F_V3F_SUN 0x85C7
#define global GL_R1UI_C4F_N3F_V3F_SUN 0x85C8
#define global GL_R1UI_T2F_V3F_SUN 0x85C9
#define global GL_R1UI_T2F_N3F_V3F_SUN 0x85CA
#define global GL_R1UI_T2F_C4F_N3F_V3F_SUN 0x85CB
#define global GL_SUN_vertex 1
#define global GL_WIN_phong_shading 1
#define global GL_WIN_specular_fog 1
#define global GLEW_FUN_EXPORT GLEWAPI
#define global GLEW_VAR_EXPORT GLEWAPI
#define global GLEW_OK 0
#define global GLEW_NO_ERROR 0
#define global GLEW_ERROR_NO_GL_VERSION 1  /* missing GL version */
#define global GLEW_ERROR_GL_VERSION_10_ONLY 2  /* GL 1.1 and up are not supported */
#define global GLEW_ERROR_GLX_VERSION_11_ONLY 3  /* GLX 1.2 and up are not supported */
#define global GLEW_VERSION 1
#define global GLEW_VERSION_MAJOR 2
#define global GLEW_VERSION_MINOR 3
#define global GLEW_VERSION_MICRO 4
#define global CL_GL_OBJECT_BUFFER                     0x2000
#define global CL_GL_OBJECT_TEXTURE2D                  0x2001
#define global CL_GL_OBJECT_TEXTURE3D                  0x2002
#define global CL_GL_OBJECT_RENDERBUFFER               0x2003
#define global CL_GL_OBJECT_TEXTURE2D_ARRAY            0x200E
#define global CL_GL_OBJECT_TEXTURE1D                  0x200F
#define global CL_GL_OBJECT_TEXTURE1D_ARRAY            0x2010
#define global CL_GL_OBJECT_TEXTURE_BUFFER             0x2011
#define global CL_GL_TEXTURE_TARGET                    0x2004
#define global CL_GL_MIPMAP_LEVEL                      0x2005
#define global CL_GL_NUM_SAMPLES                       0x2012
#define global cl_khr_gl_sharing 1
#define global CL_INVALID_GL_SHAREGROUP_REFERENCE_KHR  -1000
#define global CL_CURRENT_DEVICE_FOR_GL_CONTEXT_KHR    0x2006
#define global CL_DEVICES_FOR_GL_CONTEXT_KHR           0x2007
#define global CL_GL_CONTEXT_KHR                       0x2008
#define global CL_EGL_DISPLAY_KHR                      0x2009
#define global CL_GLX_DISPLAY_KHR                      0x200A
#define global CL_WGL_HDC_KHR                          0x200B
#define global CL_CGL_SHAREGROUP_KHR                   0x200C




























#module hspcl

#deffunc HCLini int scrnflg,int dbgflg
	HCL_err_mes_MODE dbgflg
	hspclnewcmd23 HWND//opengl、glew初期化
	hspclnewcmd1 aehtjsdutklfiykjhergewtruts6kofuyikutjyht//opencl,gl連携
	HCLDevCount@=aehtjsdutklfiykjhergewtruts6kofuyikutjyht
	if HCLDevCount@=0:dialog "OpenCLが使えません",1:HCLbye:end
	cls 0:redraw 1
	if scrnflg{
		ga8724hkftq3a3_3__vc3i2t3v5v42vyw5b=ginfo(3)
		ga8724hkftq3a3_3__vc3i2t3v5v42vyw5c=ginfo(4)
		ga8724hkftq3a3_3__vc3i2t3v5v42vyw5d=ginfo(5)
		ga8724hkftq3a3_3__vc3i2t3v5v42vyw5e=ginfo(12)
		ga8724hkftq3a3_3__vc3i2t3v5v42vyw5f=ginfo(13)
		screen ga8724hkftq3a3_3__vc3i2t3v5v42vyw5b,ga8724hkftq3a3_3__vc3i2t3v5v42vyw5e,ga8724hkftq3a3_3__vc3i2t3v5v42vyw5f,0,-2*ga8724hkftq3a3_3__vc3i2t3v5v42vyw5e,-2*ga8724hkftq3a3_3__vc3i2t3v5v42vyw5f
		wait 2
		screen ga8724hkftq3a3_3__vc3i2t3v5v42vyw5b,ga8724hkftq3a3_3__vc3i2t3v5v42vyw5e,ga8724hkftq3a3_3__vc3i2t3v5v42vyw5f,0,ga8724hkftq3a3_3__vc3i2t3v5v42vyw5c,ga8724hkftq3a3_3__vc3i2t3v5v42vyw5d
	}
	return

#deffunc HCLbye
	hspclnewcmd5
	return

#defcfunc HCLGetDeviceInfo_s int a
	ptrk=0:szs=0
	hspclnewcmdgdi a,ptrk,szs
	dupptr 変数名,ptrk,szs,2;2文字列型、ptrkは整数ポインタ、szsはサイズ、変数名はここで作成された新しい変数
	sdim retstr,szs
	memcpy retstr,変数名,szs
	return retstr

#defcfunc HCLGetDeviceInfo_i int a,int index
	ptrk=0:szs=0
	hspclnewcmdgdi a,ptrk,szs
	dupptr 変数名,ptrk,szs,4;4整数型、ptrkは整数ポインタ、szsはサイズ、変数名はここで作成された新しい変数
	return 変数名.index

#defcfunc HCLGetDeviceInfo_f int a,int index
	ptrk=0:szs=0
	hspclnewcmdgdi a,ptrk,szs
	dupptr 変数名,ptrk,szs,8;8float型、ptrkは整数ポインタ、szsはサイズ、変数名はここで作成された新しい変数
	return double(変数名.index)

#defcfunc HCLGetDevGLflg
	sdim k,1024*16
	hspclnewcmd2 k
	strrep k,"開業","\n"
	notesel k
	sdim asgrhset,2
	noteget asgrhset,43
	efgrag24f=int(asgrhset)
	return efgrag24f

#defcfunc HCLGetDevCLflg int a
	sdim k,1024*16
	hspclnewcmd2 k
	strrep k,"開業","\n"
	notesel k
	sdim asgrhset,2
	noteget asgrhset,45
	efgrag24f=int(asgrhset)
	return efgrag24f

#defcfunc HCLGetDevfp64flg int a
	sdim k,1024*16
	hspclnewcmd2 k
	strrep k,"開業","\n"
	notesel k
	sdim asgrhset,2048
	noteget asgrhset,47
	efgrag24f=instr(asgrhset,0,"64")
	if efgrag24f>0:efgrag24f=1:else:efgrag24f=0
	return efgrag24f


#defcfunc varsize var _p1
	dim size
	dim len,4
	switch vartype(_p1)
	case 2
	dupptr size,varptr(_p1)-16,4
	swbreak
	case 3
	size=8
	swbreak
	case 4
	size=4
	case 8
	size=4
	swbreak
	default
	return -1
	swbreak
	swend
	len=length(_p1),length2(_p1),length3(_p1),length4(_p1)
	repeat 4
	if len(cnt)=0 : len(cnt)++
	loop
	size*=len(0)*len(1)*len(2)*len(3)
	return size

#deffunc HCLCall str so1,int gi,array p1,array p2,array p3,array p4,array p5,array p6,array p7
	sdim so,1024*1024*2
	so=so1
		repeat 30
		strrep so,"  "," "
		if stat=0:break
		loop

	//サイズを測定
	p1sz=varsize(p1)
	p2sz=varsize(p2)
	p3sz=varsize(p3)
	p4sz=varsize(p4)
	p5sz=varsize(p5)
	p6sz=varsize(p6)
	p7sz=varsize(p7)
	//VRAM作成、HSPの変数からVRAMに書き込み
	HCLCreateBuffer vram1,p1sz:HCLWriteBuffer vram1,p1,p1sz,0,0,0
	HCLCreateBuffer vram2,p2sz:HCLWriteBuffer vram2,p2,p2sz,0,0,0
	HCLCreateBuffer vram3,p3sz:HCLWriteBuffer vram3,p3,p3sz,0,0,0
	HCLCreateBuffer vram4,p4sz:HCLWriteBuffer vram4,p4,p4sz,0,0,0
	HCLCreateBuffer vram5,p5sz:HCLWriteBuffer vram5,p5,p5sz,0,0,0
	HCLCreateBuffer vram6,p6sz:HCLWriteBuffer vram6,p6,p6sz,0,0,0
	HCLCreateBuffer vram7,p7sz:HCLWriteBuffer vram7,p7,p7sz,0,0,0
	//ソース文字列コンパイル、カーネル登録
	HCLCreateProgramWithSource so,strlen(so),prgiddmy
	krnsaisyo=instr(so,0,"__kernel void ")+14
	krnmeisaisyo=instr(so,krnsaisyo,"(")
	sdim kansumei,128
	kansumei=strmid(so,krnsaisyo,krnmeisaisyo)
	HCLCreateKernel prgiddmy,kansumei,krn1
	//カーネルにVRAMセット
	HCLSetKernel krn1,0,vram1
	HCLSetKernel krn1,1,vram2
	HCLSetKernel krn1,2,vram3
	HCLSetKernel krn1,3,vram4
	HCLSetKernel krn1,4,vram5
	HCLSetKernel krn1,5,vram6
	HCLSetKernel krn1,6,vram7
	//カーネル実行
	HCLWaitTask
	hspclnewcmd4 krn1,gi//ローカルサイズはNULL
	HCLWaitTask
	//計算後の情報をHSPの変数に読み出し
	HCLReadBuffer vram1,p1,p1sz,0,0,0
	HCLReadBuffer vram2,p2,p2sz,0,0,0
	HCLReadBuffer vram3,p3,p3sz,0,0,0
	HCLReadBuffer vram4,p4,p4sz,0,0,0
	HCLReadBuffer vram5,p5,p5sz,0,0,0
	HCLReadBuffer vram6,p6,p6sz,0,0,0
	HCLReadBuffer vram7,p7,p7sz,0,0,0
	HCLWaitTask
	//後始末
	HCLReleaseKernel krn1
	HCLReleaseMemObject vram1
	HCLReleaseMemObject vram2
	HCLReleaseMemObject vram3
	HCLReleaseMemObject vram4
	HCLReleaseMemObject vram5
	HCLReleaseMemObject vram6
	HCLReleaseMemObject vram7
	HCLReleaseProgram prgiddmy
	return

////////////////////////////////ここまでOpenCL関連
////////////////////////////////以下はOpenGL関連
#deffunc HGLSetView
	win_x=ginfo(12)
	win_y=ginfo(13)
	glViewport 0,0,win_x,win_y
	glMatrixMode GL_PROJECTION
	glLoadIdentity
	gluPerspective 65.0,1.0*win_x/win_y, 0.01,10000.0; //視野の設定
	glPushMatrix
	glEnable GL_DEPTH_TEST
	view3D
	return


#deffunc view3D
    glEnable GL_DEPTH_TEST
    glMatrixMode GL_PROJECTION
    glPopMatrix
    glMatrixMode GL_MODELVIEW
	glLoadIdentity
	return

#deffunc view2D
	dim viewport,4;
	glGetIntegerv GL_VIEWPORT, varptr(viewport)
    glDisable GL_DEPTH_TEST
    glMatrixMode GL_PROJECTION
    glPushMatrix
    glLoadIdentity
    glOrtho 1.0*viewport.0,1.0*viewport.2,1.0*viewport.3,1.0*viewport.1,-1.0,1.0
    glMatrixMode GL_MODELVIEW
	glLoadIdentity
	return



#deffunc HGLgcopy int texid,int p2,int pp3,int p4,int pp5
	glBindTexture GL_TEXTURE_2D,texid
	menx=ginfo_cx
	meny=ginfo_cy
	tmp0=menx+p4
	tmp1=meny+pp5
	viewportx=0;
	viewporty=0;
	glGetTexLevelParameteriv GL_TEXTURE_2D,0,GL_TEXTURE_WIDTH,varptr(viewportx)
	glGetTexLevelParameteriv GL_TEXTURE_2D,0,GL_TEXTURE_HEIGHT,varptr(viewporty)
	p3=viewporty-pp3
	tmp5=pp3+pp5:tmp5=viewporty-tmp5
	tmp4=p2+p4
	invdvx=1.0/(1.0*viewportx)
	invdvy=1.0/(1.0*viewporty)
	glBegin GL_QUADS//OpenGLでは中心が0,0としたら1.0,1.0は右上
		glTexCoord2d invdvx*p2,invdvy*tmp5;テクスチャのUV指定
		glVertex2i menx, tmp1
		glTexCoord2d invdvx*p2,invdvy*p3;テクスチャのUV指定
		glVertex2i menx,meny
		glTexCoord2d invdvx*tmp4,invdvy*p3;テクスチャのUV指定
		glVertex2i tmp0,meny
		glTexCoord2d invdvx*tmp4,invdvy*tmp5;テクスチャのUV指定
		glVertex2i tmp0, tmp1
	glEnd
    glBindTexture GL_TEXTURE_2D,0
	return


#deffunc HGLgrotate int texid,int p2,int pp3,int p4,int pp5,double radiann,int p5,int p6

	glBindTexture GL_TEXTURE_2D,texid
	menx=ginfo_cx
	meny=ginfo_cy

	viewportx=0;
	viewporty=0;
	glGetTexLevelParameteriv GL_TEXTURE_2D,0,GL_TEXTURE_WIDTH,varptr(viewportx)
	glGetTexLevelParameteriv GL_TEXTURE_2D,0,GL_TEXTURE_HEIGHT,varptr(viewporty)
	p3=viewporty-pp3
	tmp5=pp3+pp5:tmp5=viewporty-tmp5
	tmp4=p2+p4
	invdvx=1.0/(1.0*viewportx)
	invdvy=1.0/(1.0*viewporty)
	rad1=atan(-p6/2, p5/2)+radiann+3.14159265358979323846264338328
	rad2=atan( p6/2, p5/2)+radiann+3.14159265358979323846264338328
	rad3=atan( p6/2,-p5/2)+radiann+3.14159265358979323846264338328
	rad4=atan(-p6/2,-p5/2)+radiann+3.14159265358979323846264338328
	lengh=0.5*sqrt(p5*p5+p6*p6)

	glBegin GL_QUADS//OpenGLでは中心が0,0としたら1.0,1.0は右上
		glTexCoord2d invdvx*p2,invdvy*tmp5;テクスチャのUV指定
		glVertex2d lengh*cos(rad1)+menx,lengh*sin(rad1)+meny
		glTexCoord2d invdvx*p2,invdvy*p3;テクスチャのUV指定
		glVertex2d lengh*cos(rad2)+menx,lengh*sin(rad2)+meny
		glTexCoord2d invdvx*tmp4,invdvy*p3;テクスチャのUV指定
		glVertex2d lengh*cos(rad3)+menx,lengh*sin(rad3)+meny
		glTexCoord2d invdvx*tmp4,invdvy*tmp5;テクスチャのUV指定
		glVertex2d lengh*cos(rad4)+menx,lengh*sin(rad4)+meny
	glEnd

    glBindTexture GL_TEXTURE_2D,0
	return










#deffunc HGLCreateBuffer var a,var b,int sz
	glGenBuffers 1,varptr(a)
	glBindBuffer GL_ARRAY_BUFFER,a
	glBufferData GL_ARRAY_BUFFER,sz,0,GL_DYNAMIC_DRAW
	glBindBuffer GL_ARRAY_BUFFER,0
	HCLCreateFromGLBuffer b,a
	return

#deffunc HGLWriteBuffer int a,array arri,int sz
	glBindBuffer GL_ARRAY_BUFFER,a
	glBufferSubData GL_ARRAY_BUFFER,0,sz,varptr(arri)
	glBindBuffer GL_ARRAY_BUFFER,0
	return

#deffunc HGLReleaseBuffer var a
	gldeleteBuffers 1,varptr(a)
	return




#deffunc HGLCreateTexture3 var texid,var clid,var fboid,var fborboid,int szx,int szy,int fmt,int type
//clありレンダあり
	    // FBO作成
	glGenFramebuffers 1, varptr(fboid);
    glBindFramebuffer GL_FRAMEBUFFER, fboid
    // TEX作成
	glGenTextures 1,varptr(texid)
    glBindTexture GL_TEXTURE_2D,texid
    glTexImage2D GL_TEXTURE_2D, 0, fmt, szx,szy, 0,fmt,type,0
	glFramebufferTexture2D GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texid, 0

	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ;
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ;
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ;
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ;
    // RBO作成
    fborboid=0
    glGenRenderbuffers 1, varptr(fborboid);
    glBindRenderbuffer GL_RENDERBUFFER, fborboid;
    glRenderbufferStorage GL_RENDERBUFFER, GL_DEPTH_COMPONENT24, szx,szy
    glFramebufferRenderbuffer GL_FRAMEBUFFER,GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER,fborboid;
    // テクスチャ,RBOと対応付け
	glBindRenderbuffer GL_RENDERBUFFER, 0
	glBindFramebuffer GL_FRAMEBUFFER, 0
	HCLCreateFromGLTexture2D clid,texid

    glBindTexture GL_TEXTURE_2D,0
	return

#deffunc HGLReleaseTexture3 var texid,var fboid,var fborboid
	glDeleteTextures 1,varptr(texid)
	glDeleteFramebuffers 1, varptr(fboid)
	glDeleteRenderbuffers 1, varptr(fborboid)
	texid=0
	fboid=0
	fborboid=0
	return


#deffunc HGLCreateTexture2 var texid,var clid,int szx,int szy,int fmt,int type
//clありレンダなし
    // TEX作成
	glGenTextures 1,varptr(texid)
    glBindTexture GL_TEXTURE_2D,texid
    glTexImage2D GL_TEXTURE_2D, 0, fmt, szx,szy, 0,fmt,type,0
    glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ;
    glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR;
    glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ;
    glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ;
	HCLCreateFromGLTexture2D clid,texid
    glBindTexture GL_TEXTURE_2D,0
	return



#deffunc HGLCreateTexture1 var texid,int szx,int szy,int fmt,int type
//読み込み専用
    // TEX作成
	glGenTextures 1,varptr(texid)
    glBindTexture GL_TEXTURE_2D,texid
    glTexImage2D GL_TEXTURE_2D, 0, fmt, szx,szy, 0,fmt,type,0
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ;
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR;
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ;
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ;
    glBindTexture GL_TEXTURE_2D,0
	return


#deffunc HGLCreateTexture1_texload var texid,str name,int toumeiflg//大きさは4の倍数で
//読み込み専用画像読み込み
// TEX作成
	if toumeiflg:tmpr=ginfo_r:tmpg=ginfo_g:tmpb=ginfo_b
	glGenTextures 1,varptr(texid)
    glBindTexture GL_TEXTURE_2D,texid
	tmp0=ginfo(3)
	buffer 1039:picload name
	mref i,66
	mensekii=varsize(i)
	menx=ginfo(12)
	meny=ginfo(13)
	menseki3=mensekii/meny
	menseki1=menx*3
	if (menseki3!=((menseki1+3)/4)*4):dialog "無効な画像です",1:HCLbye:end

	sdim bdate,meny*menx*3
	repeat meny
		memcpy bdate,i,menseki1,menseki1*cnt,menseki3*cnt
	loop
	sdim i,menx*meny*3
	convRGBtoBGR bdate,i
    dim bdate,menx*meny
   	if toumeiflg:color tmpr,tmpg,tmpb
	convRGBtoRGBA i,bdate,toumeiflg

//	glPixelStorei GL_UNPACK_ALIGNMENT, 4;必要？
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ;必要	
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ;必要
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ;必要？
	glTexParameterf GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ;必要？
    glTexImage2D GL_TEXTURE_2D, 0,GL_RGBA, menx,meny, 0,GL_RGBA,GL_UNSIGNED_BYTE, varptr(bdate);必要
    sdim i,1
    glBindTexture GL_TEXTURE_2D,0
    sdim bdate,1
    buffer 1039,1,1
    gsel tmp0
	return





#deffunc HGLWriteTexture var texid,array dataa,int xoffset, int yoffset ,int szx,int szy,int fmt,int type
    glBindTexture GL_TEXTURE_2D,texid
	glTexSubImage2D GL_TEXTURE_2D, 0, xoffset,yoffset,szx,szy,fmt,type,varptr(dataa)
    glBindTexture GL_TEXTURE_2D,0
	return


#deffunc HGLReadTexture var texid,array data,int fmt,int type
    glBindTexture GL_TEXTURE_2D,texid
	glGetTexImage GL_TEXTURE_2D,0,fmt,type,varptr(data)
    glBindTexture GL_TEXTURE_2D,0
	return

#deffunc HGLReleaseTexture var a
	glDeleteTextures 1,varptr(a)
	return




#deffunc convRGBtoBGR array a,array b
	sizea=varsize(a)
	sizeb=varsize(b)
	if sizea>sizeb:sizea=sizeb
	hspclnewcmdconvRGBtoBGR a,b,sizea
	return
#deffunc convRGBAtoRGB array a,array b
	sizea=varsize(a)
	sizeb=(varsize(b)/3)*4
	if sizea>sizeb:sizea=sizeb
	hspclnewcmdconvRGBAtoRGB a,b,sizea
	return
#deffunc convRGBtoRGBA array a,array b,int toumeiflg
	if toumeiflg:tmpr=ginfo_r:tmpg=ginfo_g:tmpb=ginfo_b
	sizea=varsize(a)
	sizeb=(varsize(b)/4)*3
	if sizea>sizeb:sizea=sizeb
	if toumeiflg=0:hspclnewcmdconvRGBtoRGBA a,b,sizea,0,0,0,0:else:hspclnewcmdconvRGBtoRGBA a,b,sizea,1,tmpr,tmpg,tmpb
	return


















/////////////////////クオーータニオン関連、MQO回転のあれーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー


#deffunc HGLRotate3dbyQuaternion array ten,array ten2,array q2
	ddim Q,4
	ddim R,4
	ddim P,4
	ddim tmp,4
	memcpy P,ten,24,8,0
	rad2=0.5*q2
	rad2cos=cos(rad2)
	rad2sin=sin(rad2)
	Q=rad2cos,q2.1*rad2sin , q2.2*rad2sin, q2.3*rad2sin
	R=rad2cos,-q2.1*rad2sin,-q2.2*rad2sin,-q2.3*rad2sin
	mulq R,P,tmp
	mulq tmp,Q,P
	memcpy ten2,P,24,0,8
	return


#deffunc mulq array q1,array q2,array q3
	q3=q1*q2-q1.1*q2.1-q1.2*q2.2-q1.3*q2.3
	q3.1=q1*q2.1+q2*q1.1 +q1.2*q2.3-q1.3*q2.2
	q3.2=q1*q2.2+q2*q1.2 +q1.3*q2.1-q1.1*q2.3
	q3.3=q1*q2.3+q2*q1.3 +q1.1*q2.2-q1.2*q2.1
	return


#deffunc HGLmulQuaternion array q1,array q2
	if q2!0.0{
		ddim Q,4
		ddim R,4
		rad2=0.5*q1
		sinr2=sin(rad2)
		Q=cos(rad2),q1.1*sinr2,q1.2*sinr2,q1.3*sinr2
		rad2=0.5*q2
		sinr2=sin(rad2)
		R=cos(rad2),q2.1*sinr2,q2.2*sinr2,q2.3*sinr2
		ddim P,4
		mulq Q,R,P
		rad2=hspclacos(P)
		q1=2.0*rad2
		sinr2=sin(rad2)
		if sinr2!0.0{
			sinr2=1.0/sinr2
			f1=P.1*sinr2
			f2=P.2*sinr2
			f3=P.3*sinr2
			w=sqrt(f1*f1+f2*f2+f3*f3)
			if w!0.0{
				w=1.0/w
				f1*=w
				f2*=w
				f3*=w
			}
		}else{
			f1=P.1
			f2=P.2
			f3=P.3
		}
		q1.1=f1
		q1.2=f2
		q1.3=f3
	}
	return
#defcfunc hspclacos double e
	return atan(sqrt(1.0-double(e)*(e)),(e))















#deffunc HGLmqoload str name,var mqoid
//実の内容
	mqoid=裏mqokz
	sdim s4,256
	sdim s5,256
	sdim s6,256
	s5=dir_cur
	s6=getpath(name,32)
	if s6="":s6=s5
	chdir s6
	s4=getpath(name,8)
	exist s4
	sizee=strsize
	sdim dataa,sizee*2
	sdim dataaD0,sizee
	bload s4,dataa,sizee
	notesel dataa:zentaigyou=noteinfo(0)*5//まず全体のおおまかなサイズを把握
	//zentaigyou個の頂点があると思って配列作成
	fdim vt,zentaigyou*3//頂点x,y,z
	fdim nm,zentaigyou*3//法線x,y,z
	fdim uv,zentaigyou*2//UVx,y
	dim mater,zentaigyou//マテリアルno
	foreach mater:mater.cnt=-1:loop
	tmp0=instr(dataa,0,"Material ")
	if tmp0!-1{
		tmp1=tmp0+instr(dataa,tmp0,"\n")+2
		tmp2=tmp1+instr(dataa,tmp1,"\n}")
		dataaD0=strmid(dataa,tmp1,tmp2-tmp1)//マテリアルのtexの部分を読み込み
		notesel dataaD0
		texkz=noteinfo(0)+1
		sdim texname,256,texkz
		sdim tmp3,1024
		dim txidd,texkz//texidを4個登録
		dim tyotk,texkz//マテリアルごとに何個の頂点(x,y,z)があるか
		dim vnuid0,texkz//glidを4個登録、バーテックス→法線→UVの順で登録
		dim vnuid1,texkz//clidを4個登録、バーテックス→法線→UVの順で登録
		kz=0

		foreach txidd:txidd.cnt=-1:loop//texを読み込んでVRAMに転送
		repeat texkz-1
			noteget tmp3,cnt
			tmp4=instr(tmp3,0,"tex(\"")+5
			if tmp4!4{
				tmp5=tmp4+instr(tmp3,tmp4,"\")")
				texname.(cnt+1)=strmid(tmp3,tmp4,tmp5-tmp4)
				HGLCreateTexture1_texload txidd.(cnt+1),texname.(cnt+1)
			}
		loop
	}else{
		texkz=1
		sdim texname,256,texkz
		sdim tmp3,1024
		dim txidd,texkz//texidを4個登録
		dim tyotk,texkz//マテリアルごとに何個の3個セット頂点があるか
		dim vnuid0,texkz//glidを4個登録、バーテックス→法線→UVの順で登録
		dim vnuid1,texkz//clidを4個登録、バーテックス→法線→UVの順で登録
		kz=0
		foreach txidd:txidd.cnt=-1:loop//texを読み込んでVRAMに転送
	}

	strrep dataa,"vertex ","vertex "//vertexとfaceの解析開始
	objkz=stat
	dim mqoverkz,objkz
	dim mqofackz,objkz
	objctvertexbyte=0//vertexという文字を上から検索。cnt番目の検索結果のvertexの文字が何倍とメカを格納
	tmp0a=0
	kz=0
	repeat objkz
		objctvertexbyte=instr(dataa,tmp0a,"vertex ")+tmp0a
		tmp0a=objctvertexbyte+6
		tmp1=instr(dataa,tmp0a,"{")
		mqoverkz.cnt=int(strmid(dataa,tmp0a,tmp1))//vertex 376 の376を抽出
		tmp1+=tmp0a+3
		tmp4=instr(dataa,tmp1,"}")
		dataaD0=strmid(dataa,tmp1,tmp4)
		strrep dataaD0,"	",""//インデントを除去
		tmp2=stat
		repeat 100
			if tmp2!0:strrep dataaD0,"	","":else:break
			tmp2=stat
		loop
		strrep dataaD0," ","\n"//スペースを改行に変換
		notesel dataaD0
		sdim tmp3,1024:sdim tmp5,1024
		fdim tmpvertex,mqoverkz.cnt*3//とりあえず頂点をロード
		repeat mqoverkz.cnt*3//各頂点の座標を読み出し
			noteget tmp3,cnt
			tmpvertex.cnt=float(double(tmp3))
		loop
		tmp1+=tmp4+1//vertexの } まで
		tmp0=tmp1
		tmp1=instr(dataa,tmp0,"face")
		tmp0+=tmp1+4
		tmp1=instr(dataa,tmp0,"{")//face 744 { の { まで
		mqofackz.cnt=int(strmid(dataa,tmp0,tmp1))//face 744 の744を抽出
		tmp1+=tmp0+3//faceの中身の最初
		tmp4=instr(dataa,tmp1,"}")
		dataaD0=strmid(dataa,tmp1,tmp4)//face
		strrep dataaD0,"	",""//インデントを除去
		tmp2=stat
		repeat 100
			if tmp2!0:strrep dataaD0,"	","":else:break
			tmp2=stat
		loop
		strrep dataaD0,"4 V","4 V"//4 Vの数を確認
		tmp2=stat
		repeat tmp2
			tmp0=instr(dataaD0,0   ,"4 V"):if tmp0=-1:break
			tmp1=instr(dataaD0,tmp0,"\n")
			tmp3=strmid(dataaD0,tmp0,tmp1)//4 Vの行だけ抽出
			tmp5=v4v3vhenkan(tmp3)//4 Vのをなんとかして3 Vに変換
			strrep dataaD0,tmp3,tmp5//4vを3vに置き換え
		loop

		notesel dataaD0//faceから頂点インデックス読み込み、MとUVも登録していく
		repeat noteinfo(0)
			noteget tmp3,cnt
			strrep tmp3,"3 V",""
			strrep tmp3,"M","":tmp0=stat-1:if tmp0=-1:mater.kz=-1//マテリアルあるか
			strrep tmp3,"UV","":tmp33=stat-1//UVあるか
			strrep tmp3,"(",""
			strrep tmp3,")",""
			strrep tmp3,"  "," "

			tmp1=instr(tmp3,0," ")
			tmp4=int(strmid(tmp3,0,tmp1))*12
			tmp2=tmp1+1
			kz9=kz*36:kz6=kz*6
			memcpy vt,tmpvertex,12,kz9,tmp4

			tmp1=instr(tmp3,tmp2," ")
			tmp4=int(strmid(tmp3,tmp2,tmp1))*12
			tmp2+=tmp1+1
			memcpy vt,tmpvertex,12,kz9+12,tmp4

			tmp1=instr(tmp3,tmp2," ")
			tmp4=int(strmid(tmp3,tmp2,tmp1))*12
			tmp2+=tmp1+1
			memcpy vt,tmpvertex,12,kz9+24,tmp4

			if tmp0!-1:tmp1=instr(tmp3,tmp2," ")
			if tmp0!-1:mater.kz=int(strmid(tmp3,tmp2,tmp1))
			if tmp0!-1:tmp2+=tmp1+1

			if tmp33!-1{
				tmp1=instr(tmp3,tmp2," ")
				uv.(kz6  )=float(double(strmid(tmp3,tmp2,tmp1)))
				tmp2+=tmp1+1
	
				tmp1=instr(tmp3,tmp2," ")
				uv.(kz6+1)=-float(double(strmid(tmp3,tmp2,tmp1))-1.0)
				tmp2+=tmp1+1
	
				tmp1=instr(tmp3,tmp2," ")
				uv.(kz6+2)=float(double(strmid(tmp3,tmp2,tmp1)))
				tmp2+=tmp1+1
	
				tmp1=instr(tmp3,tmp2," ")
				uv.(kz6+3)=-float(double(strmid(tmp3,tmp2,tmp1))-1.0)
				tmp2+=tmp1+1
	
				tmp1=instr(tmp3,tmp2," ")
				uv.(kz6+4)=float(double(strmid(tmp3,tmp2,tmp1)))
				tmp2+=tmp1+1
	
				uv.(kz6+5)=-float(double(strmid(tmp3,tmp2,strlen(tmp3)-tmp2))-1.0)
			}

			kz++
		loop
	loop

////////////////////////////////////////読み込み完了、つぎはマテリアルごとに仕分け

	repeat kz
		index=mater.cnt+1
		tyotk(index)++
	loop

	dim indexh,texkz//連続メモリに1次元配列をいくつも作る。擬似2次元メモリ。その配列の先頭を記録。ポインタみたいな
	dim indexk,texkz//連続メモリに1次元配列をいくつも作る。擬似2次元メモリ。その配列のsizeを記録。sizeofみたいな
	wwwgahw=0
	repeat texkz
		indexk.cnt=tyotk.cnt
		indexh.cnt=wwwgahw
		wwwgahw+=tyotk.cnt
	loop

	//vertex→normal→uv
	repeat texkz
		cccnt=cnt-1
		mkz=indexk.cnt
		if mkz!0{
			fdim hsp_m_vertex,mkz*9
	//		fdim hsp_m_normal,mkz*9
			fdim hsp_m_UVf   ,mkz*6
			gkkwi0=0
			gkkwi1=0
			repeat kz
				if (cccnt==mater.cnt){
					cnt9=cnt*36
					cnt6=cnt*24
					memcpy hsp_m_vertex,vt,36,gkkwi0,cnt9
					memcpy hsp_m_UVf   ,uv,24,gkkwi1,cnt6
					gkkwi0+=36
					gkkwi1+=24
				}
			loop
			fdim datad4,mkz*24
			memcpy datad4,hsp_m_vertex,mkz*36,0,0//vertex情報コピー
			memcpy datad4,hsp_m_UVf,mkz*24,mkz*72,0//uv情報コピー
			HGLCreateBuffer m_glim,m_clid,mkz*24*4//(9+9+6)*4
			HGLWriteBuffer m_glim,datad4,mkz*24*4//vboに書き込みvertex→normal→uv。normalはあとで作る
			vnuid0.cnt=m_glim
			vnuid1.cnt=m_clid
	}
	loop

//これでテクスチャと頂点とUVをVRAMにセットできた。あとはnormal計算だけ

	if mqouvhenkanyarotatescalenadokrnsetteiflg=0:mqouvhenkanyarotatescalenadokrnsettei 1234

	repeat texkz//normal計算
		mkz=indexk.cnt
		if mkz!0{
			HCLEnqueueAcquireGLObjects vnuid1.cnt//GLバッファから作ったメモリオブジェクトをカーネル関数で使う場合は以下の手順が必要。
			HCLSetKernel mqo_normalcalc_krnid,0,vnuid1.cnt//clid
			HCLSetKernel mqo_normalcalc_krnid,1,mkz*3
			if mkz>1000:lclsz=192:else:lclsz=64
			HCLDoKrn1_sub mqo_normalcalc_krnid,mkz,lclsz//わりきれなくてもいいやつ
			HCLWaitTask
			HCLEnqueueReleaseGLObjects vnuid1.cnt
		}
	loop
/////////////////////////////normal計算ここまで
/////////////////この辞典でGLidには頂点、法線、uvが全部入った
//dGLidとddGLidの作成(回転後の情報を記憶するVRAM、移動後の情報を記憶するVRAM)
	dim dDLid,texkz
	dim ddDLid,texkz
	dim dCLid,texkz
	dim ddCLid,texkz

	repeat texkz
		mkz=indexk.cnt
		if mkz!0{
			HGLCreateBuffer m_glim,m_clid,mkz*18*4//(9+9)*4
			fdim datad4,mkz*18
			HGLReadBuffer vnuid0.cnt,datad4,mkz*18*4//vboによみこみvertexとnormal
			HGLWriteBuffer m_glim,datad4,mkz*18*4//vboにかきこみvertexとnormal

			dDLid.cnt=m_glim
			dCLid.cnt=m_clid


			HGLCreateBuffer m_glim,m_clid,mkz*9*4//(9)*4
			HGLWriteBuffer m_glim,datad4,mkz*9*4//vboにかきこみvertexのみ

			ddDLid.cnt=m_glim
			ddCLid.cnt=m_clid
	}
	loop



	///////////あとは裏配列変数(構造体)にmqoのidを登録していく

	if 裏mqokz!0{
		dim dポ,裏mqokz
		memcpy dポ,ポ,裏mqokz*4
		dim ポ,裏mqokz+1
		memcpy ポ,dポ,裏mqokz*4
		ポ.裏mqokz=ポ(裏mqokz-1)+texkz*mqoteis+mqoteis11

		dim d実,ポ(裏mqokz-1)
		memcpy d実,実,ポ(裏mqokz-1)*4
		dim 実,ポ(裏mqokz)
		memcpy 実,d実,ポ(裏mqokz-1)*4
		sdim d実,1
		sdim dポ,1
		kakikoimiiiti=ポ(裏mqokz-1)//indexのほう　ｂｙてではない
	}else{
		dim ポ,裏mqokz+1
		ポ=texkz*mqoteis+mqoteis11
		dim 実,ポ
		kakikoimiiiti=0
	}

	//実の中身。順番はtxidd tyotk CLid(vnuid1) GLid(vnuid0) dGLid ddGLid  dCLid ddCLid  quo
	memcpy 実,txidd,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	memcpy 実,tyotk,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	memcpy 実,vnuid1,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	memcpy 実,vnuid0,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	memcpy 実,dDLid ,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	memcpy 実,ddDLid,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	memcpy 実,dCLid ,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	memcpy 実,ddCLid,texkz*4,kakikoimiiiti*4,0
	kakikoimiiiti+=texkz
	//こっからはクオータニオンと座標をセット
	ddim tmpquo,4:tmpquo=0.0,0.0,1.0,0.0//クオータニオン
	memcpy 実,tmpquo,32,kakikoimiiiti*4,0
	kakikoimiiiti+=8
	fdim tmpquo,3:tmpquo=float(0.0),float(0.0),float(0.0)//座標
	memcpy 実,tmpquo,12,kakikoimiiiti*4,0
	kakikoimiiiti+=3
	fdim tmpquo,3:tmpquo=float(1.0),float(1.0),float(1.0)//スケール
	memcpy 実,tmpquo,12,kakikoimiiiti*4,0
	kakikoimiiiti+=3

	裏mqokz++









	sdim tmpquo,1
	sdim s4,1
	sdim s6,1
	sdim dataa,1
	sdim dataaD0,1
	sdim vt,1
	sdim nm,1
	sdim uv,1
	sdim mater,1
	sdim texname,1
	sdim tmp3,1
	sdim txidd,1
	sdim tyotk,1
	sdim vnuid0,1
	sdim vnuid1,1
	sdim mqoverkz,1
	sdim mqofackz,1
	sdim tmp5,1
	sdim hsp_m_vertex,1
	sdim hsp_m_UVf,1
	sdim syuturyoku,1
	sdim dmy0,1
	sdim dmy1,1
	sdim dmy2,1
	sdim facee,1
	sdim uvvv,1

	chdir s5
	sdim s5,1
	return

#defcfunc v4v3vhenkan str stdat
	sdim syuturyoku,1024
	sdim dmy0,256:dmy0=stdat
	sdim dmy1,256
	sdim dmy2,256
	strrep dmy0,"4 V(",""
	dmy1=strmid(dmy0,0,instr(dmy0,0,")"))//まずfaceを認識
	strrep dmy1," ","\n"
	notesel dmy1
	dim facee,4
	repeat 4
		noteget dmy2,cnt
		facee.cnt=int(dmy2)
	loop

	mqom=-1
	dmy3=0
	dmy3=instr(dmy0,0,"M(")
	if dmy3!-1{
		dmy3+=2
		mqom=int(strmid(dmy0,dmy3,instr(dmy0,dmy3,")")))//次にM(1)の1を認識
	}

	dmy33=instr(dmy0,0,"UV(")//次にUV認識
	dmy3=dmy33+3
	if (dmy33!=-1){//uvがあれば
		dmy1=strmid(dmy0,dmy3,instr(dmy0,dmy3,")"))//UVの中身
		strrep dmy1," ","\n"
		notesel dmy1
		ddim uvvv,8
		repeat 8
			noteget dmy2,cnt
			uvvv.cnt=double(dmy2)
		loop
			//４頂点（四角）は３頂点（三角）ｘ２に分割
			//  0  3      0    0  3
			//   □   →　△　　▽
			//  1  2     1  2   2
			// ４頂点の平面データは
			// ３頂点の平面データｘ２個
	}
	syuturyoku="3 V("
	syuturyoku+=str(facee.0)+" "
	syuturyoku+=str(facee.1)+" "
	syuturyoku+=str(facee.2)+") "
	if mqom!-1:syuturyoku+="M("+mqom+") "
	if dmy33!-1{
		syuturyoku+="UV("
		syuturyoku+=str(uvvv.0)+" "
		syuturyoku+=str(uvvv.1)+" "
		syuturyoku+=str(uvvv.2)+" "
		syuturyoku+=str(uvvv.3)+" "
		syuturyoku+=str(uvvv.4)+" "
		syuturyoku+=str(uvvv.5)+")\n"
	}else{
		syuturyoku+="\n"
	}


	syuturyoku+="3 V("
	syuturyoku+=str(facee.0)+" "
	syuturyoku+=str(facee.2)+" "
	syuturyoku+=str(facee.3)+") "
	if mqom!-1:syuturyoku+="M("+mqom+") "
	if dmy33!-1{
		syuturyoku+="UV("
		syuturyoku+=str(uvvv.0)+" "
		syuturyoku+=str(uvvv.1)+" "
		syuturyoku+=str(uvvv.4)+" "
		syuturyoku+=str(uvvv.5)+" "
		syuturyoku+=str(uvvv.6)+" "
		syuturyoku+=str(uvvv.7)+")"
	}
	return syuturyoku


#deffunc mqouvhenkanyarotatescalenadokrnsettei int tdw2bwvr
	mqouvhenkanyarotatescalenadokrnsetteiflg=1
	sdim kkk,65536
		kkk={"
typedef struct{
	float x;
	float y;
	float z;
} Vec3;

typedef struct{
	float x;
	float y;
	float z;
	float w;
} Vec4;

int mqoSnormal(Vec3 A, Vec3 B, Vec3 C, Vec3 *normal)
{
	float norm;
	Vec3 vec0;
	Vec3 vec1;

	// ベクトルBA
	vec0.x = A.x - B.x; 
	vec0.y = A.y - B.y;
	vec0.z = A.z - B.z;

	// ベクトルBC
	vec1.x = C.x - B.x;
	vec1.y = C.y - B.y;
	vec1.z = C.z - B.z;

	// 法線ベクトル
	normal->x = vec0.y * vec1.z - vec0.z * vec1.y;
	normal->y = vec0.z * vec1.x - vec0.x * vec1.z;
	normal->z = vec0.x * vec1.y - vec0.y * vec1.x;

	// 正規化
	norm = normal->x * normal->x + normal->y * normal->y + normal->z * normal->z;
	norm = 1.0f/sqrt ( norm );

	normal->x *= norm;
	normal->y *= norm;
	normal->z *= norm;
}

__kernel void normalcalc(__global Vec3 *vnuid1,int indexk) 
{
	int icx = (get_global_id(0))*3;
	Vec3 v0;
	Vec3 v1;
	Vec3 v2;
	Vec3 v3;
	v0=vnuid1[icx  ];
	v1=vnuid1[icx+1];
	v2=vnuid1[icx+2];
	mqoSnormal(v0,v1,v2,&v3);
	icx+=indexk;
	vnuid1[icx  ]=v3;
	vnuid1[icx+1]=v3;
	vnuid1[icx+2]=v3;
}








int mulqarray(Vec4 q1, Vec4 q2,Vec4 *q3)
{
	q3->x=q1.x*q2.x-q1.y*q2.y-q1.z*q2.z-q1.w*q2.w;
	q3->y=q1.x*q2.y+q2.x*q1.y +q1.z*q2.w-q1.w*q2.z;
	q3->z=q1.x*q2.z+q2.x*q1.z +q1.w*q2.y-q1.y*q2.w;
	q3->w=q1.x*q2.w+q2.x*q1.w +q1.y*q2.z-q1.z*q2.y;
}



__kernel void mqorotate(__global Vec3 *dCLid,__global Vec3 *vnuid,int mkz,float setposfx,float setposfy,float setposfz,float q20,float q21,float q22,float q23,float scx,float scy,float scz)
{
	int icx=get_global_id(0);
	Vec3 vert=dCLid[icx];
	Vec4 P;
	P.x=0.0;
	P.y=vert.x*scx;
	P.z=vert.y*scy;
	P.w=vert.z*scz;
	Vec4 R;
	R.x=q20;
	R.y=-q21;
	R.z=-q22;
	R.w=-q23;
	Vec4 Q;
	Q.x=q20;
	Q.y=q21;
	Q.z=q22;
	Q.w=q23;
	Vec4 tmp;
	mulqarray(R,P,&tmp);
	mulqarray(tmp,Q,&P);
	vert.x=P.y+setposfx;
	vert.y=P.z+setposfy;
	vert.z=P.w+setposfz;
	vnuid[icx]=vert;
//ノーマル回転開始
	icx+=mkz;
	vert=dCLid[icx];
	P.x=0.0;
	P.y=vert.x;
	P.z=vert.y;
	P.w=vert.z;
	mulqarray(R,P,&tmp);
	mulqarray(tmp,Q,&P);
	vert.x=P.y;
	vert.y=P.z;
	vert.z=P.w;
	vnuid[icx]=vert;
}


//スケール変更は、移動後→移動前、スケール倍率変更→移動後にする
__kernel void mqoscale(__global Vec3 *vnuid,float setposfx,float setposfy,float setposfz,float q20,float q21,float q22)
{
	int icx=get_global_id(0);
	Vec3 vert=vnuid[icx];
	vert.x-=setposfx;
	vert.y-=setposfy;
	vert.z-=setposfz;
	vert.x*=q20;
	vert.y*=q21;
	vert.z*=q22;
	vert.x+=setposfx;
	vert.y+=setposfy;
	vert.z+=setposfz;
	vnuid[icx]=vert;
}




__kernel void mqosetpos(__global Vec3 *vnuid,float setposfx,float setposfy,float setposfz) {
	int icx=get_global_id(0);
	Vec3 vert=vnuid[icx];
	vert.x+=setposfx;
	vert.y+=setposfy;
	vert.z+=setposfz;
	vnuid[icx]=vert;
}
"}


	HCLCreateProgramWithSource kkk,strlen(kkk),mqo_normalcalcnado_prgmid
	HCLCreateKernel mqo_normalcalcnado_prgmid,"normalcalc",mqo_normalcalc_krnid
	HCLCreateKernel mqo_normalcalcnado_prgmid,"mqorotate",mqo_rotate_krnid
	HCLCreateKernel mqo_normalcalcnado_prgmid,"mqoscale",mqo_scale_krnid
	HCLCreateKernel mqo_normalcalcnado_prgmid,"mqosetpos",mqo_setpos_krnid
	dim kkk,1
	return




#deffunc HGLMqoDraw int mqoid
	if mqoid!0:kakikoimiiiti=ポ(mqoid-1):else:kakikoimiiiti=0
	texkz=(ポ.mqoid-kakikoimiiiti-mqoteis11)/mqoteis
	dim txidd,texkz
	dim tyotk,texkz
	dim vnuid0,texkz

	//実の中身。順番はtxidd tyotk CLid(vnuid1) GLid(vnuid0) dGLid ddGLid  dCLid ddCLid
	memcpy txidd ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy tyotk ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz*2
	memcpy vnuid0,実,texkz*4,0,kakikoimiiiti*4

	//////////////////////描画
	repeat texkz
		mkz=tyotk.cnt
		if mkz!0{
			if txidd.cnt!-1:glBindTexture GL_TEXTURE_2D,txidd.cnt:else:glBindTexture GL_TEXTURE_2D,0
			/* 頂点データ，法線データ，テクスチャ座標の配列を有効にする */
			glEnableClientState GL_VERTEX_ARRAY
			glEnableClientState GL_NORMAL_ARRAY
			if txidd.cnt!-1:glEnableClientState GL_TEXTURE_COORD_ARRAY

			/* 頂点データ，法線データ，テクスチャ座標の場所を指定する */
			glBindBuffer GL_ARRAY_BUFFER,vnuid0.cnt
			glVertexPointer 3,GL_FLOAT,0,0//頂点データの場所を指定する。VBOを指定しててもp4はオフセットとして使える
			glNormalPointer GL_FLOAT,0,mkz*36//VBOを指定しててもp4はオフセットとして使える
			if txidd.cnt!-1:glTexCoordPointer 2,GL_FLOAT,0,mkz*72//VBOを指定しててもp4はオフセットとして使える

			/* 頂点のインデックスを順番通りに使って図形を描く */
			glDrawArrays GL_TRIANGLES,0,mkz*3//頂点を4*6こ使います＝QUADSを6こ表示します
	
			/* 頂点データ，法線データ，テクスチャ座標の配列を無効にする */
			glDisableClientState GL_VERTEX_ARRAY//後片付け
			glDisableClientState GL_NORMAL_ARRAY//後片付け
			if txidd.cnt!-1:glDisableClientState GL_TEXTURE_COORD_ARRAY//後片付け
		}
	loop
	glBindBuffer GL_ARRAY_BUFFER,0//後片付け。バインド解除
	////////////////////ここまで
	return


#deffunc HGLMqoSetAng int mqoid,double quot0,double quot1,double quot2,double quot3
	if mqoid!0:kakikoimiiiti=ポ(mqoid-1):else:kakikoimiiiti=0
	texkz=(ポ.mqoid-kakikoimiiiti-mqoteis11)/mqoteis
	dim txidd,texkz
	dim tyotk,texkz
	dim vnuid1,texkz
	dim vnuid0,texkz
	dim dDLid,texkz
	dim ddDLid,texkz
	dim dCLid,texkz
	dim ddCLid,texkz
	ddim tmpquo,4
	fdim setposf,3
	fdim setscalef,3

	//実の中身。順番はtxidd tyotk CLid(vnuid1) GLid(vnuid0) dGLid ddGLid  dCLid ddCLid
	memcpy txidd ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy tyotk ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid1,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid0,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dDLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddDLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dCLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddCLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	//こっからはクオータニオンと座標を読み込み
	memcpy tmpquo,実,32,0,kakikoimiiiti*4
	kakikoimiiiti+=8
	memcpy setposf,実,12,0,kakikoimiiiti*4
	kakikoimiiiti+=3
	memcpy setscalef,実,12,0,kakikoimiiiti*4
	kakikoimiiiti+=3
	if (quot0==tmpquo.0):if (quot1==tmpquo.1):if (quot2==tmpquo.2):if (quot3==tmpquo.3):return//クオータニオンが同じなら何も計算しないで戻る
	tmpquo.0=quot0
	tmpquo.1=quot1
	tmpquo.2=quot2
	tmpquo.3=quot3


	rad2=0.5*tmpquo
	HCLSetKernel mqo_rotate_krnid,3,setposf
	HCLSetKernel mqo_rotate_krnid,4,setposf.1
	HCLSetKernel mqo_rotate_krnid,5,setposf.2
	HCLSetKernel mqo_rotate_krnid,6,float(cos(rad2))
	HCLSetKernel mqo_rotate_krnid,7,float(tmpquo.1*sin(rad2))
	HCLSetKernel mqo_rotate_krnid,8,float(tmpquo.2*sin(rad2))
	HCLSetKernel mqo_rotate_krnid,9,float(tmpquo.3*sin(rad2))
	HCLSetKernel mqo_rotate_krnid,10,setscalef
	HCLSetKernel mqo_rotate_krnid,11,setscalef.1
	HCLSetKernel mqo_rotate_krnid,12,setscalef.2

	repeat texkz//ang計算
		mkz=tyotk.cnt*3
		if mkz!0{
			HCLEnqueueAcquireGLObjects vnuid1.cnt//GLバッファから作ったメモリオブジェクトをカーネル関数で使う場合は以下の手順が必要。
			HCLEnqueueAcquireGLObjects  dCLid.cnt//GLバッファから作ったメモリオブジェクトをカーネル関数で使う場合は以下の手順が必要。

			//まずはdGLid→GLidにvertex回転後移動後代入、dGLid→GLidにnormalの回転後代入
			HCLSetKernel mqo_rotate_krnid,0, dCLid.cnt
			HCLSetKernel mqo_rotate_krnid,1,vnuid1.cnt
			HCLSetKernel mqo_rotate_krnid,2,mkz
			if mkz>1000:lclsz=192:else:lclsz=64
			HCLDoKrn1_sub mqo_rotate_krnid,mkz,lclsz//わりきれなくてもいいやつ
			HCLWaitTask
			HCLEnqueueReleaseGLObjects vnuid1.cnt
			HCLEnqueueReleaseGLObjects  dCLid.cnt
		}
	loop


	//こっからはクオータニオンと座標をセット
	kakikoimiiiti-=mqoteis11
	memcpy 実,tmpquo,32,kakikoimiiiti*4,0
	kakikoimiiiti+=8
//	fdim tmpquo,3:tmpquo=float(0.0),float(0.0),float(0.0)//座標
//	memcpy 実,tmpquo,12,kakikoimiiiti*4,0
	kakikoimiiiti+=3


	sdim dDLid,1
	sdim ddDLid,1
	sdim dCLid,1
	sdim ddCLid,1
	sdim txidd,1
	sdim tyotk,1
	sdim vnuid0,1
	sdim vnuid1,1
	sdim tmpquo,1
	sdim setposf,1
	return








#deffunc HGLMqoSetScale int mqoid,double Scale0,double Scale1,double Scale2
	if mqoid!0:kakikoimiiiti=ポ(mqoid-1):else:kakikoimiiiti=0
	texkz=(ポ.mqoid-kakikoimiiiti-mqoteis11)/mqoteis
	dim txidd,texkz
	dim tyotk,texkz
	dim vnuid1,texkz
	dim vnuid0,texkz
	dim dDLid,texkz
	dim ddDLid,texkz
	dim dCLid,texkz
	dim ddCLid,texkz
	ddim tmpquo,4
	fdim setposf,3
	fdim setscalef,3

	//実の中身。順番はtxidd tyotk CLid(vnuid1) GLid(vnuid0) dGLid ddGLid  dCLid ddCLid
	memcpy txidd ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy tyotk ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid1,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid0,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dDLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddDLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dCLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddCLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	//こっからはクオータニオンと座標を読み込み
	memcpy tmpquo,実,32,0,kakikoimiiiti*4
	kakikoimiiiti+=8
	memcpy setposf,実,12,0,kakikoimiiiti*4
	kakikoimiiiti+=3
	memcpy setscalef,実,12,0,kakikoimiiiti*4
	kakikoimiiiti+=3

	scbairx=float(Scale0)/setscalef.0
	scbairy=float(Scale1)/setscalef.1
	scbairz=float(Scale2)/setscalef.2

	HCLSetKernel mqo_scale_krnid,1,setposf
	HCLSetKernel mqo_scale_krnid,2,setposf.1
	HCLSetKernel mqo_scale_krnid,3,setposf.2
	HCLSetKernel mqo_scale_krnid,4,scbairx
	HCLSetKernel mqo_scale_krnid,5,scbairy
	HCLSetKernel mqo_scale_krnid,6,scbairz

	repeat texkz//ang計算
		mkz=tyotk.cnt*3
		if mkz!0{
			HCLEnqueueAcquireGLObjects vnuid1.cnt//GLバッファから作ったメモリオブジェクトをカーネル関数で使う場合は以下の手順が必要。

			//まずはdGLid→GLidにvertex回転後移動後代入、dGLid→GLidにnormalの回転後代入
			HCLSetKernel mqo_scale_krnid,0,vnuid1.cnt
			if mkz>1000:lclsz=192:else:lclsz=64
			HCLDoKrn1_sub mqo_scale_krnid,mkz,lclsz//わりきれなくてもいいやつ
			HCLWaitTask
			HCLEnqueueReleaseGLObjects vnuid1.cnt
		}
	loop


	setscalef.0=float(Scale0)
	setscalef.1=float(Scale1)
	setscalef.2=float(Scale2)
	//こっからはクオータニオンと座標をセット
	kakikoimiiiti-=mqoteis11
	kakikoimiiiti+=8
	kakikoimiiiti+=3
	memcpy 実,setscalef,12,kakikoimiiiti*4,0
	kakikoimiiiti+=3


	sdim dDLid,1
	sdim ddDLid,1
	sdim dCLid,1
	sdim ddCLid,1
	sdim txidd,1
	sdim tyotk,1
	sdim vnuid0,1
	sdim vnuid1,1
	sdim tmpquo,1
	sdim setposf,1
	return




#deffunc HGLMqoSetPos int mqoid,double d1,double d2,double d3
	if mqoid!0:kakikoimiiiti=ポ(mqoid-1):else:kakikoimiiiti=0
	texkz=(ポ.mqoid-kakikoimiiiti-mqoteis11)/mqoteis
	dim txidd,texkz
	dim tyotk,texkz
	dim vnuid1,texkz
	dim vnuid0,texkz
	dim dDLid,texkz
	dim ddDLid,texkz
	dim dCLid,texkz
	dim ddCLid,texkz
	ddim tmpquo,4
	fdim setposf,3
	fdim setscalef,3

	//実の中身。順番はtxidd tyotk CLid(vnuid1) GLid(vnuid0) dGLid ddGLid  dCLid ddCLid
	memcpy txidd ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy tyotk ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid1,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid0,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dDLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddDLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dCLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddCLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	//こっからはクオータニオンと座標を読み込み
	memcpy tmpquo,実,32,0,kakikoimiiiti*4
	kakikoimiiiti+=8
	memcpy setposf,実,12,0,kakikoimiiiti*4
	kakikoimiiiti+=3
	memcpy setscalef,実,12,0,kakikoimiiiti*4
	kakikoimiiiti+=3


	scbairx=float(d1)-setposf.0
	scbairy=float(d2)-setposf.1
	scbairz=float(d3)-setposf.2

	HCLSetKernel mqo_setpos_krnid,1,scbairx
	HCLSetKernel mqo_setpos_krnid,2,scbairy
	HCLSetKernel mqo_setpos_krnid,3,scbairz

	repeat texkz//ang計算
		mkz=tyotk.cnt*3
		if mkz!0{
			HCLEnqueueAcquireGLObjects vnuid1.cnt//GLバッファから作ったメモリオブジェクトをカーネル関数で使う場合は以下の手順が必要。
			//まずはdGLid→GLidにvertex回転後移動後代入、dGLid→GLidにnormalの回転後代入
			HCLSetKernel mqo_setpos_krnid,0,vnuid1.cnt
			if mkz>1000:lclsz=192:else:lclsz=64
			HCLDoKrn1_sub mqo_setpos_krnid,mkz,lclsz//わりきれなくてもいいやつ
			HCLWaitTask
			HCLEnqueueReleaseGLObjects vnuid1.cnt
		}
	loop


	setscalef.0=float(d1)
	setscalef.1=float(d2)
	setscalef.2=float(d3)
	//こっからはクオータニオンと座標をセット
	kakikoimiiiti-=mqoteis11
	kakikoimiiiti+=8
	memcpy 実,setscalef,12,kakikoimiiiti*4,0
	kakikoimiiiti+=3
	kakikoimiiiti+=3


	sdim dDLid,1
	sdim ddDLid,1
	sdim dCLid,1
	sdim ddCLid,1
	sdim txidd,1
	sdim tyotk,1
	sdim vnuid0,1
	sdim vnuid1,1
	sdim tmpquo,1
	sdim setposf,1
	return


#defcfunc HGLGetMqoPolygonNUM int mqoid
	if mqoid!0:kakikoimiiiti=ポ(mqoid-1):else:kakikoimiiiti=0
	texkz=(ポ.mqoid-kakikoimiiiti-mqoteis11)/mqoteis
	dim txidd,texkz
	dim tyotk,texkz
	dim vnuid1,texkz
	dim vnuid0,texkz
	dim dDLid,texkz
	dim ddDLid,texkz
	dim dCLid,texkz
	dim ddCLid,texkz
	ddim tmpquo,4
	fdim setposf,3

	//実の中身。順番はtxidd tyotk CLid(vnuid1) GLid(vnuid0) dGLid ddGLid  dCLid ddCLid
	memcpy txidd ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy tyotk ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid1,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy vnuid0,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dDLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddDLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy dCLid ,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	memcpy ddCLid,実,texkz*4,0,kakikoimiiiti*4
	kakikoimiiiti+=texkz
	//こっからはクオータニオンと座標をセット
	memcpy tmpquo,実,32,0,kakikoimiiiti*4
	kakikoimiiiti+=8
	memcpy setposf,実,12,0,kakikoimiiiti*4
	kakikoimiiiti+=3


	gkw=0
		repeat texkz
		gkw+=tyotk.cnt
		loop


	sdim dDLid,1
	sdim ddDLid,1
	sdim dCLid,1
	sdim ddCLid,1
	sdim txidd,1
	sdim tyotk,1
	sdim vnuid0,1
	sdim vnuid1,1
	sdim tmpquo,1
	sdim setposf,1
	return gkw









/////////////////////クオーータニオン関連、MQO回転のあれここまで＾ーーーーーーーーーーーーーーーーーーーーー








#global




*hspclenf2