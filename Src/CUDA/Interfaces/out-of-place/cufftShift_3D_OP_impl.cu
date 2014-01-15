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
