#ifndef CUFFTSHIFT_1D_H
#define CUFFTSHIFT_1D_H

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cutil_inline.h>

namespace cufftShift
{
    void cufftShift_2D(cufftReal* input, cufftReal* output, int NX, int NY);
    void cufftShift_2D(cufftDoubleReal* input, cufftDoubleReal* output, int NX, int NY);
    void cufftShift_2D(cufftComplex* input, cufftComplex* output, int NX, int NY);
    void cufftShift_2D(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX, int NY);

    void cufftShift_2D(cufftReal* data, int NX, int NY);
    void cufftShift_2D(cufftDoubleReal* data, int NX, int NY);
    void cufftShift_2D(cufftComplex* data, int NX, int NY);
    void cufftShift_2D(cufftDoubleComplex* data, int NX, int NY);
}

#endif // CUFFTSHIFT_1D_H
