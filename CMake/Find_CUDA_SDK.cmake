#####################################################################
# Copyright © 2011-2014,
# Marwan Abdellah: <abdellah.marwan@gmail.com>
#
# This library is free software; you can redistribute it and/or
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

# CUDA SDK root directory
MARK_AS_ADVANCED(CUDA_SDK_ROOT)

IF(APPLE)
    SET(CUDA_SDK_ROOT "/Developer/NVIDIA_GPU_Computing_SDK")
ELSE(APPLE)
    SET(CUDA_SDK_ROOT "/home/abdellah/NVIDIA_GPU_Computing_SDK")
ENDIF(APPLE)

# SDK include directory
SET(CUDA_SDK_INC_DIR "${CUDA_SDK_ROOT}/C/common/inc")

# SDK libraries directory
SET(CUDA_SDK_LIB_DIR "${CUDA_SDK_ROOT}/C/lib")

# Find cutil library
FIND_LIBRARY(LIB_CUTIL NAMES cutil_x86_64
    HINTS ${CUDA_SDK_LIB_DIR}
    PATHS
        /usr/lib
        /usr/local/lib
        /opt/local/lib
    )

# Add the include directories to the system tree
INCLUDE_DIRECTORIES(${CUDA_SDK_INC_DIR})

# Link against the cutil library
LINK_LIBRARIES(${LIB_CUTIL})

IF(CUDA_SDK_INC_DIR AND LIB_CUTIL)
    MESSAGE(STATUS "Found CUDA-SDK in
        ${CUDA_SDK_ROOT}
        ${CUDA_SDK_INC_DIR}
        ${CUDA_SDK_LIB_DIR}
        ${LIB_CUTIL}")
ELSE(CUDA_SDK_INC_DIR AND LIB_CUTIL)
    MESSAGE(FATAL_ERROR "CUDA SDK NOT Found")
ENDIF(CUDA_SDK_INC_DIR AND LIB_CUTIL)

