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

#ifndef CUFFTSHIFT_1D_IMPL_CU
#define CUFFTSHIFT_1D_IMPL_CU

#include "configGPU.h"
#include "cufftShiftShared.h"
#include "out-of-place/cufftShift_1D_OP.cu"

template <typename T>
extern
void cufftShift_1D_impl(T* input, T* output, int NX)
{
    kernelConf* conf = cufftShift::GenAutoConf_1D(NX);
    cufftShift_1D_kernel <<< conf->grid, conf->block >>> (input, output, NX);
}

template <typename T>
extern
void cufftShift_1D_config_impl(T* input, T* output, int NX, kernelConf* conf)
{
    cufftShift_1D_kernel <<< conf->grid, conf->block >>> (input, output, NX);
}

template void cufftShift_1D_impl <cufftReal>
(cufftReal* input, cufftReal* output, int NX);

template void cufftShift_1D_impl <cufftDoubleReal>
(cufftDoubleReal* input, cufftDoubleReal* output, int NX);

template void cufftShift_1D_impl <cufftComplex>
(cufftComplex* input, cufftComplex* output, int NX);

template void cufftShift_1D_impl <cufftDoubleComplex>
(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX);

template void cufftShift_1D_config_impl <cufftReal>
(cufftReal* input, cufftReal* output, int NX, kernelConf* conf);

template void cufftShift_1D_config_impl <cufftDoubleReal>
(cufftDoubleReal* input, cufftDoubleReal* output, int NX, kernelConf* conf);

template void cufftShift_1D_config_impl <cufftComplex>
(cufftComplex* input, cufftComplex* output, int NX, kernelConf* conf);

template void cufftShift_1D_config_impl <cufftDoubleComplex>
(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX, kernelConf* conf);

#endif // CUFFTSHIFT_1D_IMPL_CU
