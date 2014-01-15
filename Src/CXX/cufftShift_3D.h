#ifndef CUFFTSHIFT_1D_H
#define CUFFTSHIFT_1D_H

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cutil_inline.h>

namespace cufftShift
{
    void cufftShift_3D(cufftReal* input, cufftReal* output, int NX, int NY, int NZ);
    void cufftShift_3D(cufftDoubleReal* input, cufftDoubleReal* output, int NX, int NY, int NZ);
    void cufftShift_3D(cufftComplex* input, cufftComplex* output, int NX, int NY, int NZ);
    void cufftShift_3D(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX, int NY, int NZ);

    void cufftShift_3D(cufftReal* data, int NX, int NY, int NZ);
    void cufftShift_3D(cufftDoubleReal* data, int NX, int NY, int NZ);
    void cufftShift_3D(cufftComplex* data, int NX, int NY, int NZ);
    void cufftShift_3D(cufftDoubleComplex* data, int NX, int NY, int NZ);
}

#endif // CUFFTSHIFT_1D_H
