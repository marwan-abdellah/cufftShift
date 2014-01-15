#ifndef CUFFTSHIFT_3D_SINGLE_ARRAY_CU
#define CUFFTSHIFT_3D_SINGLE_ARRAY_CU

#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cutil_inline.h>

template <typename T>
__global__
void cufftShift_3D_slice_kernel(T* data, int N, int zIndex)
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

    T regTemp;

    if (zIndex < N / 2)
    {
        if (xIndex < N / 2)
        {
            if (yIndex < N / 2)
            {
                regTemp = data[index];

                // First Quad
                data[index] = data[index + sEq1];

                // Fourth Quad
                data[index + sEq1] = regTemp;
            }
            else
            {
                regTemp = data[index];

                // Third Quad
                data[index] = data[index + sEq3];

                // Second Quad
                data[index + sEq3] = regTemp;
            }
        }
        else
        {
            if (yIndex < N / 2)
            {
                regTemp = data[index];

                // Second Quad
                data[index] = data[index + sEq2];

                // Third Quad
                data[index + sEq2] = regTemp;
            }
            else
            {
                regTemp = data[index];

                // Fourth Quad
                data[index] = data[index + sEq4];

                // First Quad
                data[index + sEq4] = regTemp;
            }
        }
    }
}

template <typename T>
void cufftShift_3D_kernel(T* data, int N, dim3 block, dim3 grid)
{
    for (int i = 0; i < N; i++)
        cufftShift_3D_slice_kernel <<< grid, block >>> (data, N, i);
}

template
void cufftShift_3D_kernel <cufftReal>
(cufftReal* data, int N, dim3 block, dim3 grid);

template
void cufftShift_3D_kernel <cufftDoubleReal>
(cufftDoubleReal* data, int N, dim3 block, dim3 grid);

template
void cufftShift_3D_kernel <cufftComplex>
(cufftComplex* data, int N, dim3 block, dim3 grid);

template
void cufftShift_3D_kernel <cufftDoubleComplex>
(cufftDoubleComplex* data, int N, dim3 block, dim3 grid);

#endif // CUFFTSHIFT_3D_SINGLE_ARRAY_CU
