#ifndef CUFFTSHIFT_1D_SINGLE_ARRAY_IMPL_CU
#define CUFFTSHIFT_1D_SINGLE_ARRAY_IMPL_CU

#include "configGPU.h"
#include "cufftShiftShared.h"
#include "in-place/cufftShift_1D_IP.cu"

template <typename T>
extern
void cufftShift_1D_impl(T* data, int NX)
{
    kernelConf* conf = cufftShift::GenAutoConf_1D(NX/2);
    cufftShift_1D_kernel <<< conf->grid, conf->block >>> (data, NX);
}

template <typename T>
extern
void cufftShift_1D_config_impl(T* data, int NX, kernelConf* conf)
{
    cufftShift_1D_kernel <<< conf->grid, conf->block >>> (data, NX);
}

template void cufftShift_1D_impl <cufftReal>
(cufftReal* data, int NX);

template void cufftShift_1D_impl <cufftDoubleReal>
(cufftDoubleReal* data, int NX);

template void cufftShift_1D_impl <cufftComplex>
(cufftComplex* data, int NX);

template void cufftShift_1D_impl <cufftDoubleComplex>
(cufftDoubleComplex* data, int NX);

template void cufftShift_1D_config_impl <cufftReal>
(cufftReal* data, int NX, kernelConf* conf);

template void cufftShift_1D_config_impl <cufftDoubleReal>
(cufftDoubleReal* data, int NX, kernelConf* conf);

template void cufftShift_1D_config_impl <cufftComplex>
(cufftComplex* data, int NX, kernelConf* conf);

template void cufftShift_1D_config_impl <cufftDoubleComplex>
(cufftDoubleComplex* data, int NX, kernelConf* conf);

#endif // CUFFTSHIFT_1D_SINGLE_ARRAY_IMPL_CU
