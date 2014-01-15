#ifndef CUFFTSHIFT_3D_SINGLE_ARRAY_IMPL_CU
#define CUFFTSHIFT_3D_SINGLE_ARRAY_IMPL_CU

#include "configGPU.h"
#include "cufftShiftShared.h"
#include "in-place/cufftShift_3D_IP.cu"

template <typename T>
extern
void cufftShift_3D_impl(T* data, int NX, int NY, int NZ)
{
    if (NX == NY && NX == NZ)
    {
        const int N = NX;
        kernelConf* conf = cufftShift::GenAutoConf_3D(N/2);
        cufftShift_3D_kernel(data, N, conf->block, conf->grid);
    }
    else
    {
        printf("The library is supporting NxNxN arrays only \n");
        exit(0);
    }
}

template <typename T>
extern
void cufftShift_3D_config_impl(T* data, int NX, int NY, int NZ, kernelConf* conf)
{
    if (NX == NY && NX == NZ)
    {
        const int N = NX;
        cufftShift_3D_kernel(data, N, conf->block, conf->grid);
    }
    else
    {
        printf("The library is supporting NxNxN arrays only \n");
        exit(0);
    }
}

template void cufftShift_3D_impl <cufftReal>
(cufftReal* data, int NX, int NY, int NZ);

template void cufftShift_3D_impl <cufftDoubleReal>
(cufftDoubleReal* data, int NX, int NY, int NZ);

template void cufftShift_3D_impl <cufftComplex>
(cufftComplex* data, int NX, int NY, int NZ);

template void cufftShift_3D_impl <cufftDoubleComplex>
(cufftDoubleComplex* data, int NX, int NY, int NZ);

template void cufftShift_3D_config_impl <cufftReal>
(cufftReal* data, int NX, int NY, int NZ, kernelConf* conf);

template void cufftShift_3D_config_impl <cufftDoubleReal>
(cufftDoubleReal* data, int NX, int NY, int NZ, kernelConf* conf);

template void cufftShift_3D_config_impl <cufftComplex>
(cufftComplex* data, int NX, int NY, int NZ, kernelConf* conf);

template void cufftShift_3D_config_impl <cufftDoubleComplex>
(cufftDoubleComplex* data, int NX, int NY, int NZ, kernelConf* conf);

#endif // CUFFTSHIFT_3D_SINGLE_ARRAY_IMPL_CU
