#ifndef CUFFTSHIFT_2D_IMPL_CU
#define CUFFTSHIFT_2D_IMPL_CU

#include "configGPU.h"
#include "cufftShiftShared.h"
#include "out-of-place/cufftShift_2D_OP.cu"

template <typename T>
extern
void cufftShift_2D_impl(T* input, T* output, int NX, int NY)
{
    if (NX == NY)
    {
        const int N = NX;
        kernelConf* conf = cufftShift::GenAutoConf_2D(N);
        cufftShift_2D_kernel <<< conf->grid, conf->block >>> (input, output, N);
    }
    else
    {
        printf("The library is supporting NxN arrays only \n");
        exit(0);
    }
}

template <typename T>
extern
void cufftShift_2D_config_impl(T* input, T* output, int NX, int NY, kernelConf* conf)
{
    if (NX == NY)
    {
        const int N = NX;
        cufftShift_2D_kernel <<< conf->grid, conf->block >>> (input, output, N);
    }

    else
    {
        printf("The library is supporting NxN arrays only \n");
        exit(0);
    }
}

template void cufftShift_2D_impl <cufftReal>
(cufftReal* input, cufftReal* output, int NX, int NY);

template void cufftShift_2D_impl <cufftDoubleReal>
(cufftDoubleReal* input, cufftDoubleReal* output, int NX, int NY);

template void cufftShift_2D_impl <cufftComplex>
(cufftComplex* input, cufftComplex* output, int NX, int NY);

template void cufftShift_2D_impl <cufftDoubleComplex>
(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX, int NY);

template void cufftShift_2D_config_impl <cufftReal>
(cufftReal* input, cufftReal* output, int NX, int NY, kernelConf* conf);

template void cufftShift_2D_config_impl <cufftDoubleReal>
(cufftDoubleReal* input, cufftDoubleReal* output, int NX, int NY, kernelConf* conf);

template void cufftShift_2D_config_impl <cufftComplex>
(cufftComplex* input, cufftComplex* output, int NX, int NY, kernelConf* conf);

template void cufftShift_2D_config_impl <cufftDoubleComplex>
(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX, int NY, kernelConf* conf);

#endif // CUFFTSHIFT_2D_IMPL_CU
