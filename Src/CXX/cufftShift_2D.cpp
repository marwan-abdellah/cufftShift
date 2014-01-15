#include "cufftShift_2D.h"
#include "cufftShiftInterface.h"

void cufftShift::cufftShift_2D(cufftReal *input, cufftReal *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleReal *input, cufftDoubleReal *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftComplex *input, cufftComplex *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleComplex *input, cufftDoubleComplex *output, int NX, int NY)
{
    cufftShift_2D_impl (input, output, NX, NY);
}

void cufftShift::cufftShift_2D(cufftReal *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleReal *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}

void cufftShift::cufftShift_2D(cufftComplex *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}

void cufftShift::cufftShift_2D(cufftDoubleComplex *data, int NX, int NY)
{
    cufftShift_2D_impl (data, NX, NY);
}


