#define TSN 128
#define TSM 128
#define TSK 16
#define WPTN 8
#define WPTM 8
#define RTSN (TSN/WPTN)		// The reduced tile-size in dimension N
#define RTSM (TSM/WPTM)		// The reduced tile-size in dimension M
#define LPTA ((TSK*TSN)/(RTSN*RTSM)) // Loads-per-thread for A
#define LPTB ((TSK*TSM)/(RTSN*RTSM)) // Loads-per-thread for B



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
		barrier(CLK_LOCAL_MEM_FENCE);
		
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
	__local float4 Asub[TSN*TSK/4];
	__local float4 Bsub[TSK*TSM/4];
	
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
	int tid = tidm * 16 + tidn;
	int maxAidx = M * K - 1;
	int maxBidx = N * K - 1;
	int nowAoffset = min(Aoffset, maxAidx);
	int nowBoffset = min(Boffset, maxBidx);
	for (int t = 0; t < K; t += 16) {
		// Load one tile of A and B into local memory
		//AB load software pipelining
		float4 dta;
		float4 dtb;
		dta.x = A[nowAoffset]; nowAoffset = min(Aoffset + 16 * K, maxAidx);
		dtb.x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
		dta.y = A[nowAoffset]; nowAoffset = min(Aoffset + 32 * K, maxAidx);
		dtb.y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
		dta.z = A[nowAoffset]; nowAoffset = min(Aoffset + 48 * K, maxAidx);
		dtb.z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
		dta.w = A[nowAoffset]; nowAoffset = min(Aoffset + 64 * K, maxAidx);
		dtb.w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
		Asub[tid] = dta;
		Bsub[tid] = dtb;
		dta.x = A[nowAoffset]; nowAoffset = min(Aoffset + 80 * K, maxAidx);
		dtb.x = B[nowBoffset]; nowBoffset = min(Boffset + 16, maxBidx);
		dta.y = A[nowAoffset]; nowAoffset = min(Aoffset + 96 * K, maxAidx);
		dtb.y = B[nowBoffset]; nowBoffset = min(Boffset + 32, maxBidx);
		dta.z = A[nowAoffset]; nowAoffset = min(Aoffset + 112 * K, maxAidx);
		dtb.z = B[nowBoffset]; nowBoffset = min(Boffset + 48, maxBidx);
		dta.w = A[nowAoffset]; Aoffset += 16; nowAoffset = min(Aoffset, maxAidx);
		dtb.w = B[nowBoffset]; Boffset += 8 * N; nowBoffset = min(Boffset, maxBidx);
		Asub[tid + 256] = dta;
		Bsub[tid + 256] = dtb;

		// Synchronise to make sure the tile is loaded
		barrier(CLK_LOCAL_MEM_FENCE);

		int tidnk = tidn;
		int tidmk = tidm * 16;
		// Loop over the values of a single tile
		int kmin = min(K - t, 16);
		for (int k = 0; k < kmin; k++) {
			// Cache the values of Bsub in registers
			Breg[0] = Bsub[tidnk]; tidnk += 16;
			Areg = Asub[tidmk]; tidmk += 256;
			Breg[1] = Bsub[tidnk]; tidnk += 16;
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


			Areg = Asub[tidmk]; tidmk -= 255;
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
		int globalRow = offsetN + wn * RTSN;
		if (globalRow >= N) break;
		for (int wm = 0; wm < 8; wm++) {
			int globalCol = offsetM + wm * RTSM;
			if (globalCol >= M) break;
			C[globalCol * N + globalRow] = acc[wm * 8 + wn];
		}
	}
}







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
	sub[tidoffset + tidm * 16] = A[offsetN + offsetM * N];
	barrier(CLK_LOCAL_MEM_FENCE);
	AT[woffsetN * M + woffsetM] = sub[tidoffset + tidn * 16];
}






__kernel void SGEMV(__global float* A,__global float* X,__global float* Y,int col){
	int gi=get_group_id(0);
	int i=get_local_id(0);
	int li=i;
	float r=0.0;
	for(;i<col;i+=256)
		r+=A[gi*col+i]*X[i];
	__local float S[256];
	S[li]=r;
	i=128;
	for(;i>0;i/=2)
	{
		barrier(CLK_LOCAL_MEM_FENCE);
		if (li<i)S[li]+=S[li+i];
	}
	if (li==0){Y[gi]=S[0];}
}



__kernel void SGEVM(__global float* A,__global float* X,__global float* Y,int col,int raw){
	int idx=get_global_id(0);
	if (idx>=col)return;
	float r=0.0;
	for(int j=0;j<raw;j++)
	{
		r+=A[idx+j*col]*X[j];
	}
	Y[idx]=r;
}