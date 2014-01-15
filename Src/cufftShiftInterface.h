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
