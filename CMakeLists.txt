#####################################################################
# Copyright © 2011-2014,
# Marwan Abdellah: <abdellah.marwan@gmail.com>
#
# This library (cufftShift) is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation.

# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.
#####################################################################

#########################################################
#! Minimum required CMake version
#########################################################
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

#########################################################
#! Project name
#########################################################
PROJECT(cufftShift)

#########################################################
#! Add CMake customized modules
#########################################################
SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake)

#########################################################
#! Finders 
#########################################################
# @ CUDA
INCLUDE(Find_CUDA)

# @ CUDA GPU Computing SDK
INCLUDE(Find_CUDA_SDK)

#########################################################
#! Include directories (for the CXX interfaces - headers)
#########################################################
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/cuUtils)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/CXX)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/cxxUtils)

#########################################################
#! Include CUDA kernels and interfaces - headers
#########################################################
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Kernels)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/in-place)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/out-of-place)

#########################################################
#! Include internal CMake files
#########################################################
INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/Src/Src.cmake)

SET(CUDA_SOURCES "")
LIST(APPEND CUDA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/in-place/cufftShift_1D_IP_impl.cu)
LIST(APPEND CUDA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/in-place/cufftShift_2D_IP_impl.cu)
LIST(APPEND CUDA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/in-place/cufftShift_3D_IP_impl.cu)
LIST(APPEND CUDA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/out-of-place/cufftShift_1D_OP_impl.cu)
LIST(APPEND CUDA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/out-of-place/cufftShift_2D_OP_impl.cu)
LIST(APPEND CUDA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/CUDA/Interfaces/out-of-place/cufftShift_3D_OP_impl.cu)

#########################################################
#! Doxygen documentation
#########################################################
# ADD_SUBDIRECTORY(doc)

#########################################################
#! Compiler Flags
#########################################################
SET(CMAKE_C_FLAGS " -fpermissive -fPIC -pthread -pipe -fopenmp -DLINUX -D_BOOL -DREQUIRE_IOSTREAM -Wno-deprecated -fno-gnu-keywords -w")
SET(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")

#########################################################
#! Generate the cufftShift library
#########################################################
CUDA_ADD_LIBRARY(cufftShift ${CUDA_SOURCES} ${CXX_SOURCES})
