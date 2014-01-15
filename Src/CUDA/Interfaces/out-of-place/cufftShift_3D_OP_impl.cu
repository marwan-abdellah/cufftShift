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

#ifndef CUFFTSHIFT_3D_IMPL_CU
#define CUFFTSHIFT_3D_IMPL_CU

#include "configGPU.h"
#include "cufftShiftShared.h"
#include "out-of-place/cufftShift_3D_OP.cu"

template <typename T>
extern
void cufftShift_3D_impl(T* input, T* output, int NX, int NY, int NZ)
{
    if (NX == NY && NX == NZ)
    {
        const int N = NX;
        kernelConf* conf = cufftShift::GenAutoConf_3D(N);
        cufftShift_3D_kernel(input, output, N, conf->block, conf->grid);
    }
    else
    {
        printf("The library is supporting NxNxN arrays only \n");
        exit(0);
    }
}

template <typename T>
extern
void cufftShift_3D_config_impl(T* input, T* output, int NX, int NY, int NZ, kernelConf* conf)
{
    if (NX == NY && NX == NZ)
    {
        const int N = NX;
        cufftShift_3D_kernel(input, output, N, conf->block, conf->grid);
    }
    else
    {
        printf("The library is supporting NxNxN arrays only \n");
        exit(0);
    }
}

template void cufftShift_3D_impl <cufftReal>
(cufftReal* input, cufftReal* output, int NX, int NY, int NZ);

template void cufftShift_3D_impl <cufftDoubleReal>
(cufftDoubleReal* input, cufftDoubleReal* output, int NX, int NY, int NZ);

template void cufftShift_3D_impl <cufftComplex>
(cufftComplex* input, cufftComplex* output, int NX, int NY, int NZ);

template void cufftShift_3D_impl <cufftDoubleComplex>
(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX, int NY, int NZ);

template void cufftShift_3D_config_impl <cufftReal>
(cufftReal* input, cufftReal* output, int NX, int NY, int NZ, kernelConf* conf);

template void cufftShift_3D_config_impl <cufftDoubleReal>
(cufftDoubleReal* input, cufftDoubleReal* output, int NX, int NY, int NZ, kernelConf* conf);

template void cufftShift_3D_config_impl <cufftComplex>
(cufftComplex* input, cufftComplex* output, int NX, int NY, int NZ, kernelConf* conf);

template void cufftShift_3D_config_impl <cufftDoubleComplex>
(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX, int NY, int NZ, kernelConf* conf);

#endif // CUFFTSHIFT_3D_IMPL_CU
