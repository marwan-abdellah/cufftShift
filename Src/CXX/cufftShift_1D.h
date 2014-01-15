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

#ifndef CUFFTSHIFT_1D_H
#define CUFFTSHIFT_1D_H

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cutil_inline.h>

namespace cufftShift
{
    void cufftShift_1D(cufftReal* input, cufftReal* output, int NX);
    void cufftShift_1D(cufftDoubleReal* input, cufftDoubleReal* output, int NX);
    void cufftShift_1D(cufftComplex* input, cufftComplex* output, int NX);
    void cufftShift_1D(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX);

    void cufftShift_1D(cufftReal* data, int NX);
    void cufftShift_1D(cufftDoubleReal* data, int NX);
    void cufftShift_1D(cufftComplex* data, int NX);
    void cufftShift_1D(cufftDoubleComplex* data, int NX);
}

#endif // CUFFTSHIFT_1D_H
