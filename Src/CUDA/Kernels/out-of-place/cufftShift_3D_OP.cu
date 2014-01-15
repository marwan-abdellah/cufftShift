#ifndef CUFFTSHIFT_3D_CU
#define CUFFTSHIFT_3D_CU

#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cutil_inline.h>

template <typename T>
__global__
void cufftShift_3D_slice_kernel(T* input, T* output, int N, int zIndex)
{
    // 3D Volume & 2D Slice & 1D Line
    int sLine = N;
    int sSlice = N * N;
    int sVolume = N * N * N;

    // Transformations Equations
    int sEq1 = (sVolume + sSlice + sLine) / 2;
    int sEq2 = (sVolume + sSlice - sLine) / 2;
    int sEq3 = (sVolume - sSlice + sLine) / 2;
    int sEq4 = (sVolume - sSlice - sLine) / 2;

    // Thread
    int xThreadIdx = threadIdx.x;
    int yThreadIdx = threadIdx.y;

    // Block Width & Height
    int blockWidth = blockDim.x;
    int blockHeight = blockDim.y;

    // Thread Index 2D
    int xIndex = blockIdx.x * blockWidth + xThreadIdx;
    int yIndex = blockIdx.y * blockHeight + yThreadIdx;

    // Thread Index Converted into 1D Index
    int index = (zIndex * sSlice) + (yIndex * sLine) + xIndex;

    if (zIndex < N / 2)
    {
        if (xIndex < N / 2)
        {
            if (yIndex < N / 2)
            {
                // First Quad
                output[index] = input[index + sEq1];
            }
            else
            {
                // Third Quad
                output[index] = input[index + sEq3];
            }
        }
        else
        {
            if (yIndex < N / 2)
            {
                // Second Quad
                output[index] = input[index + sEq2];
            }
            else
            {
                // Fourth Quad
                output[index] = input[index + sEq4];
            }
        }
    }

    else
    {
        if (xIndex < N / 2)
        {
            if (yIndex < N / 2)
            {
                // First Quad
                output[index] = input[index - sEq4];
            }
            else
            {
                // Third Quad
                output[index] = input[index - sEq2];
            }
        }
        else
        {
            if (yIndex < N / 2)
            {
                // Second Quad
                output[index] = input[index - sEq3];
            }
            else
            {
                // Fourth Quad
                output[index] = input[index - sEq1];
            }
        }
    }
}

template <typename T>
void cufftShift_3D_kernel(T* input, T* output, int N, dim3 block, dim3 grid)
{
    for (int i = 0; i < N; i++)
        cufftShift_3D_slice_kernel <<< grid, block >>> (input, output, N, i);
}

template
void cufftShift_3D_kernel <cufftReal>
(cufftReal* input, cufftReal* output, int N, dim3 block, dim3 grid);

template
void cufftShift_3D_kernel <cufftDoubleReal>
(cufftDoubleReal* input, cufftDoubleReal* output, int N, dim3 block, dim3 grid);

template
void cufftShift_3D_kernel <cufftComplex>
(cufftComplex* input, cufftComplex* output, int N, dim3 block, dim3 grid);

template
void cufftShift_3D_kernel <cufftDoubleComplex>
(cufftDoubleComplex* input, cufftDoubleComplex* output, int N, dim3 block, dim3 grid);

#endif // CUFFTSHIFT_3D_CU
