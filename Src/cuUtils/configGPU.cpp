/*********************************************************************
 * Copyright © 2011-2014,
 * Marwan Abdellah: <abdellah.marwan@gmail.com>
 *
 * This library (cufftShift) is free software; you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 ********************************************************************/

#include "configGPU.h"

kernelConf* cufftShift::GenAutoConf_1D(int N)
{
    kernelConf* autoConf = (kernelConf*) malloc(sizeof(kernelConf));

    int threadsPerBlock_X;

    if (2 <= N && N < 4)      threadsPerBlock_X = 2;
    if (4 <= N && N < 8)      threadsPerBlock_X = 4;
    if (8 <= N && N < 16)     threadsPerBlock_X = 8;
    if (16 <= N && N < 32)    threadsPerBlock_X = 16;
    if (32 <= N && N < 64)    threadsPerBlock_X = 32;
    if (64 <= N && N < 128)   threadsPerBlock_X = 64;
    if (128 <= N && N < 256)  threadsPerBlock_X = 128;
    if (256 <= N && N < 512)  threadsPerBlock_X = 256;
    if (N >= 512)              threadsPerBlock_X = 1024;

    autoConf->block = dim3(threadsPerBlock_X, 1, 1);
    autoConf->grid = dim3((N / threadsPerBlock_X), 1, 1);

    printf("Auto Block Conf [%d]x[%d] \n", autoConf->block.x, autoConf->block.y);
    printf("Auto Grid Conf [%d]x[%d] \n", autoConf->grid.x, autoConf->grid.y);

    return autoConf;
}

kernelConf* cufftShift::GenAutoConf_2D(int N)
{
    kernelConf* autoConf = (kernelConf*) malloc(sizeof(kernelConf));

    int threadsPerBlock_X;
    int threadsPerBlock_Y;

    if (2 <= N && N < 4)
    {
        threadsPerBlock_X = 2;
        threadsPerBlock_Y = 2;
    }
    if (4 <= N && N < 8)
    {
        threadsPerBlock_X = 4;
        threadsPerBlock_Y = 4;
    }
    if (8 <= N && N < 16)
    {
        threadsPerBlock_X = 8;
        threadsPerBlock_Y = 8;
    }
    if (16 <= N && N < 32)
    {
        threadsPerBlock_X = 16;
        threadsPerBlock_Y = 16;
    }
    if (N >= 32)
    {
        threadsPerBlock_X = 16;
        threadsPerBlock_Y = 16;
    }

    autoConf->block = dim3(threadsPerBlock_X, threadsPerBlock_Y, 1);
    autoConf->grid = dim3((N / threadsPerBlock_X), (N / threadsPerBlock_Y), 1);

    printf("Auto Block Conf [%d]x[%d] \n", autoConf->block.x, autoConf->block.y);
    printf("Auto Grid Conf [%d]x[%d] \n", autoConf->grid.x, autoConf->grid.y);

    return autoConf;
}

kernelConf* cufftShift::GenAutoConf_3D(int N)
{
    kernelConf* autoConf = (kernelConf*) malloc(sizeof(kernelConf));

    int threadsPerBlock_X;
    int threadsPerBlock_Y;

    if (2 <= N && N < 4)
    {
        threadsPerBlock_X = 2;
        threadsPerBlock_Y = 2;
    }
    if (4 <= N && N < 8)
    {
        threadsPerBlock_X = 4;
        threadsPerBlock_Y = 4;
    }
    if (8 <= N && N < 16)
    {
        threadsPerBlock_X = 8;
        threadsPerBlock_Y = 8;
    }
    if (16 <= N && N < 32)
    {
        threadsPerBlock_X = 16;
        threadsPerBlock_Y = 16;
    }
    if (N >= 32)
    {
        threadsPerBlock_X = 16;
        threadsPerBlock_Y = 16;
    }

    autoConf->block = dim3(threadsPerBlock_X, threadsPerBlock_Y, 1);
    autoConf->grid = dim3((N / threadsPerBlock_X), (N / threadsPerBlock_Y), 1);


    printf("Auto Block Conf [%d]x[%d] \n", autoConf->block.x, autoConf->block.y);
    printf("Auto Grid Conf [%d]x[%d] \n", autoConf->grid.x, autoConf->grid.y);

    return autoConf;
}
