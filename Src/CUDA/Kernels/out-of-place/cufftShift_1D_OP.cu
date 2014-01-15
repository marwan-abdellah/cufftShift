#ifndef CUFFTSHIFT_1D_CU
#define CUFFTSHIFT_1D_CU

#include <cuda.h>
#include <cutil_inline.h>

template <typename T>
__global__
void cufftShift_1D_kernel(T* input, T* output, int NX)
{
    int threadIdxX = threadIdx.x;
    int blockDimX = blockDim.x;
    int blockIdxX = blockIdx.x;

    int index = ((blockIdxX * blockDimX) + threadIdxX);

    if (index < (NX / 2))
        output[index] = (T) input[index + (NX / 2)];
    else
        output[index] = (T) input[index - (NX / 2)];
}


#endif // CUFFTSHIFT_1D_CU
