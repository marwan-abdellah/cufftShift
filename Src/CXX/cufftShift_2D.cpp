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

#include "cufftShift_2D.h"
#include "cufftShiftInterface.h"

void cufftShift::cufftShift_2D(cufftReal *input, cufftReal *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleReal *input, cufftDoubleReal *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftComplex *input, cufftComplex *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleComplex *input, cufftDoubleComplex *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftReal *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleReal *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}

void cufftShift::cufftShift_2D(cufftComplex *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleComplex *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}


