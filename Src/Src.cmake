#####################################################################
# Copyright © 2011-2014,
# Marwan Abdellah: <abdellah.marwan@gmail.com>

# This library (cufftShift) is free software; you can redistribute it
# and/or modify it under the terms of the GNU Lesser General Public
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
#! C++ invokation methods for the CUDA implementation
#########################################################
SET(CXX_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/CXX/cufftShift_1D.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Src/CXX/cufftShift_2D.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Src/CXX/cufftShift_3D.cpp)

#########################################################
#! GPU (CUDA) utilities
#########################################################
LIST(APPEND CXX_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/cuUtils/configGPU.cpp)

#########################################################
#! C++ utility functions 
#########################################################
LIST(APPEND CXX_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Src/cxxUtils/PrintMemory.cpp)
