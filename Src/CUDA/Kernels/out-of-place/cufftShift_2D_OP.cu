#ifndef CUFFTSHIFT_2D_CU
#define CUFFTSHIFT_2D_CU

#include <cuda.h>
#include <cutil_inline.h>

template <typename T>
__global__
void cufftShift_2D_kernel(T* input, T* output, int N)
{
    // 2D Slice & 1D Line
    int sLine = N;
    int sSlice = N * N;

    // Transformations Equations
    int sEq1 = (sSlice + sLine) / 2;
    int sEq2 = (sSlice - sLine) / 2;

    __syncthreads();

    // Thread Index (1D)
    int xThreadIdx = threadIdx.x;
    int yThreadIdx = threadIdx.y;

    __syncthreads();

    // Block Width & Height
    int blockWidth = blockDim.x;
    int blockHeight = blockDim.y;

    __syncthreads();

    // Thread Index (2D)
    int xIndex = blockIdx.x * blockWidth + xThreadIdx;
    int yIndex = blockIdx.y * blockHeight + yThreadIdx;

    __syncthreads();

    // Thread Index Converted into 1D Index
    int index = (yIndex * N) + xIndex;

    __syncthreads();

    if (xIndex < N / 2)
    {
        if (yIndex < N / 2)
        {
            // First Quad
            output[index] = input[index + sEq1];
            __syncthreads();
        }
        else
        {
            // Third Quad
            output[index] = input[index - sEq2];
            __syncthreads();
        }
    }
    else
    {
        if (yIndex < N / 2)
        {
            // Second Quad
            output[index] = input[index + sEq2];
            __syncthreads();
        }
        else
        {
            // Fourth Quad
            output[index] = input[index - sEq1];
            __syncthreads();
        }
    }
}

#endif // CUFFTSHIFT_2D_CU
