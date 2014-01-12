#include <iostream>

using namespace std;

int main()
{
    cout << "Hello World!" << endl;
    return 0;
}

template < class T >
T* cufftShift_1D ( const T* dataArray, const int length )
{
    // Allocation
    T* output = MEMORY_ALLOCATION();

    // Implementation

    return output;
}

template < class T >
T* cufftShift_2D ( const T* dataArray, const int length, const int height )
{
    // Allocation
    T* output = MEMORY_ALLOCATION();

    // Implementation

    return output;
}

template < class T >
T* cufftShift_1D ( const T* dataArray, const int length, const int height, const int depth )
{
    // Allocation
    T* output = MEMORY_ALLOCATION();

    // Implementation

    return output;
}

template < class T >
void cufftShift_1D ( T* dataArray, const int length )
{
    // Implementaion
}

template < class T >
void cufftShift_2D ( T* dataArray, const int lenght, const int height )
{
    // Implementaion
}

template < class T >
void cufftShift_3D ( T* dataArray, const int lenght, const int height, const int depth )
{
    // Implementaion
}

