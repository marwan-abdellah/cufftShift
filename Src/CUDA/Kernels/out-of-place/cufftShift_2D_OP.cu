/*********************************************************************
 * Copyright © 2011-2014,
 * Marwan Abdellah: <abdellah.marwan@gmail.com>
 *
 * This library (cufftShift) is free software; you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 ********************************************************************/
 
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
