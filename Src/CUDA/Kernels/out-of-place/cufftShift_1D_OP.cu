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
