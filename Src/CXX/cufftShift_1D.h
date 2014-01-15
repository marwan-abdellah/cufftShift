#ifndef CUFFTSHIFT_1D_H
#define CUFFTSHIFT_1D_H

#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cutil_inline.h>

namespace cufftShift
{
    void cufftShift_1D(cufftReal* input, cufftReal* output, int NX);
    void cufftShift_1D(cufftDoubleReal* input, cufftDoubleReal* output, int NX);
    void cufftShift_1D(cufftComplex* input, cufftComplex* output, int NX);
    void cufftShift_1D(cufftDoubleComplex* input, cufftDoubleComplex* output, int NX);

    void cufftShift_1D(cufftReal* data, int NX);
    void cufftShift_1D(cufftDoubleReal* data, int NX);
    void cufftShift_1D(cufftComplex* data, int NX);
    void cufftShift_1D(cufftDoubleComplex* data, int NX);
}

#endif // CUFFTSHIFT_1D_H
