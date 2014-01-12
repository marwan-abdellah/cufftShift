#####################################################################
# Copyright © 2011-2012,
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


#########################################################
#! Project
#########################################################
PROJECT(cufftShift)

#########################################################
#! Minimum required CMake version
#########################################################
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

#########################################################
#! CMake customized modules
#########################################################
SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake)

### Link to the SRC directory
SET(SRC_DIR ${CMAKE_SOURCE_DIR}/Src/)

#########################################################
#! Headers
#########################################################

LIST(APPEND CMAKE_INCLUDE_CURRENT_DIR ${SRC_DIR}/CXX)
LIST(APPEND CMAKE_INCLUDE_CURRENT_DIR ${SRC_DIR}/CXX_Utils)
LIST(APPEND CMAKE_INCLUDE_CURRENT_DIR ${SRC_DIR}/GPU_Utils)
LIST(APPEND CMAKE_INCLUDE_CURRENT_DIR ${SRC_DIR}/Interfaces)

#########################################################
#! Add CMake customized modules
#########################################################
SET(CXX_LIST main.cpp)

#########################################################
#! Doxygen documentation
#########################################################
# ADD_SUBDIRECTORY(Doc)

#########################################################
#! Compiler Flags
#########################################################
SET(CMAKE_C_FLAGS " -fpermissive -fPIC -pthread -pipe -DLINUX -D_BOOL -DREQUIRE_IOSTREAM -Wno-deprecated -fno-gnu-keywords -w")
SET(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")

# Generate Executable
ADD_EXECUTABLE(${PROJECT_NAME} ${CXX_LIST})

