#include "cufftShift_1D.h"
#include "cufftShiftInterface.h"

void cufftShift::cufftShift_1D(cufftReal *input, cufftReal *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleReal *input, cufftDoubleReal *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftComplex *input, cufftComplex *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleComplex *input, cufftDoubleComplex *output, int NX)
{
    cufftShift_1D_impl (input, output, NX);
}

void cufftShift::cufftShift_1D(cufftReal *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleReal *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

void cufftShift::cufftShift_1D(cufftComplex *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

void cufftShift::cufftShift_1D(cufftDoubleComplex *data, int NX)
{
    cufftShift_1D_impl (data, NX);
}

