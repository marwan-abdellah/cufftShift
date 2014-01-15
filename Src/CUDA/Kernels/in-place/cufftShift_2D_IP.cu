#ifndef CUFFTSHIFT_2D_SINGLE_ARRAY_CU
#define CUFFTSHIFT_2D_SINGLE_ARRAY_CU

#include <cuda.h>
#include <cutil_inline.h>

template <typename T>
__global__
void cufftShift_2D_kernel(T* data, int N)
{
    // 2D Slice & 1D Line
    int sLine = N;
    int sSlice = N * N;

    // Transformations Equations
    int sEq1 = (sSlice + sLine) / 2;
    int sEq2 = (sSlice - sLine) / 2;

    // Thread Index (1D)
    int xThreadIdx = threadIdx.x;
    int yThreadIdx = threadIdx.y;

    // Block Width & Height
    int blockWidth = blockDim.x;
    int blockHeight = blockDim.y;

    // Thread Index (2D)
    int xIndex = blockIdx.x * blockWidth + xThreadIdx;
    int yIndex = blockIdx.y * blockHeight + yThreadIdx;

    // Thread Index Converted into 1D Index
    int index = (yIndex * N) + xIndex;

    T regTemp;

    if (xIndex < N / 2)
    {
        if (yIndex < N / 2)
        {
            regTemp = data[index];

            // First Quad
            data[index] = data[index + sEq1];

            // Third Quad
            data[index + sEq1] = regTemp;
        }
    }
    else
    {
        if (yIndex < N / 2)
        {
            regTemp = data[index];

            // Second Quad
            data[index] = data[index + sEq2];

            // Fourth Quad
            data[index + sEq2] = regTemp;
        }
    }
}

#endif // CUFFTSHIFT_2D_SINGLE_ARRAY_CU
