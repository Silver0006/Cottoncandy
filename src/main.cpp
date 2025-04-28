#ifdef _WIN32
    #include "../include/windows/win32_interface.hpp"
#endif
#include <iostream>



int main() {
    WindowsSystemSettings current;

    std::cout << "This is a test" << std::endl;
    current.CheckPermLevel();
    
}