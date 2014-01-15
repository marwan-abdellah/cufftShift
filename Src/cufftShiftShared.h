#ifndef CUFFTSHIFTSHARED_H
#define CUFFTSHIFTSHARED_H

#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cutil_inline.h>

#define WAIT_TIME 50000000

#define PRINT_AUTO_CONFIG 0

struct kernelConf
{
    dim3 block;
    dim3 grid;
};

namespace Utils
{
    void PrintMemory(int size);
}

#endif // CUFFTSHIFTSHARED_H
