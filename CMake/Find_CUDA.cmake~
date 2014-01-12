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

# Find CUDA package
FIND_PACKAGE(CUDA REQUIRED)

IF(CUDA_FOUND)
    MESSAGE(STATUS "CUDA Found")
    INCLUDE_DIRECTORIES(${CUDA_INCLUDE_DIRS})
    LINK_LIBRARIES(${CUDA_LIBRARIES})
ELSE(CUDA_FOUND)
    MESSAGE(FATAL_ERROR "CUDA NOT Found")
ENDIF(CUDA_FOUND)
