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

#include "cufftShift_1D.h"
#include "cufftShiftInterface.h"

void cufftShift::cufftShift_1D(cufftReal *input, cufftReal *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleReal *input, cufftDoubleReal *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftComplex *input, cufftComplex *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleComplex *input, cufftDoubleComplex *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftReal *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleReal *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

void cufftShift::cufftShift_1D(cufftComplex *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleComplex *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

