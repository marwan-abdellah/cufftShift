#ifndef CUFFTSHIFT_1D_SINGLE_ARRAY_CU
#define CUFFTSHIFT_1D_SINGLE_ARRAY_CU

#include <cuda.h>
#include <cutil_inline.h>

template <typename T>
__global__
void cufftShift_1D_kernel(T* data, int NX)
{
    int threadIdxX = threadIdx.x;
    int blockDimX = blockDim.x;
    int blockIdxX = blockIdx.x;

    int index = ((blockIdxX * blockDimX) + threadIdxX);
    if (index < NX/2)
    {
        // Save the first value
        T regTemp = data[index];

        // Swap the first element
        data[index] = (T) data[index + (NX / 2)];

        // Swap the second one
        data[index + (NX / 2)] = (T) regTemp;
    }
}

#endif // CUFFTSHIFT_1D_SINGLE_ARRAY_CU
