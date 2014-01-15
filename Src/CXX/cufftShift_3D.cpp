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

#include "cufftShift_3D.h"
#include "cufftShiftInterface.h"

void cufftShift::cufftShift_3D(cufftReal *input, cufftReal *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleReal *input, cufftDoubleReal *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftComplex *input, cufftComplex *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleComplex *input, cufftDoubleComplex *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftReal *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleReal *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftComplex *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleComplex *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

