#ifndef CONFIGGPU_H
#define CONFIGGPU_H

#include "cufftShiftShared.h"

namespace cufftShift
{
    kernelConf* GenAutoConf_1D(int N);
    kernelConf* GenAutoConf_2D(int N);
    kernelConf* GenAutoConf_3D(int N);
}

#endif // CONFIGGPU_H
