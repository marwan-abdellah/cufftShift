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

#ifndef CUFFTSHIFT_INTERFACE_H
#define CUFFTSHIFT_INTERFACE_H

#include "cufftShiftShared.h"

template <typename T>
extern
void cufftShift_1D_impl(T* input, T* output, int NX);

template <typename T>
extern
void cufftShift_2D_impl(T* input, T* output, int NX, int NY);

template <typename T>
extern
void cufftShift_3D_impl(T* input, T* output, int NX, int NY, int NZ);

template <typename T>
extern
void cufftShift_1D_config_impl(T* input, T* output, int NX, kernelConf* conf);

template <typename T>
extern
void cufftShift_2D_config_impl(T* input, T* output, int NX, int NY, kernelConf* conf);

template <typename T>
extern
void cufftShift_3D_config_impl(T* input, T* output, int NX, int NY, int NZ, kernelConf* conf);

template <typename T>
extern
void cufftShift_1D_impl(T* input, int NX);

template <typename T>
extern
void cufftShift_2D_impl(T* input, int NX, int NY);

template <typename T>
extern
void cufftShift_3D_impl(T* input, int NX, int NY, int NZ);

template <typename T>
extern
void cufftShift_1D_config_impl(T* input, int NX, kernelConf* conf);

template <typename T>
extern
void cufftShift_2D_config_impl(T* input, int NX, int NY, kernelConf* conf);

template <typename T>
extern
void cufftShift_3D_config_impl(T* input, int NX, int NY, int NZ, kernelConf* conf);



#endif // CUFFTSHIFT_INTERFACE_H
