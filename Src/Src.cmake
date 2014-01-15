
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
