#include "cufftShift_3D.h"
#include "cufftShiftInterface.h"

void cufftShift::cufftShift_3D(cufftReal *input, cufftReal *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleReal *input, cufftDoubleReal *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftComplex *input, cufftComplex *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleComplex *input, cufftDoubleComplex *output, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (input, output, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftReal *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleReal *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftComplex *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

void cufftShift::cufftShift_3D(cufftDoubleComplex *data, int NX, int NY, int NZ)
{
    cufftShift_3D_impl (data, NX, NY, NZ);
}

