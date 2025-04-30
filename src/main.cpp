#ifdef _WIN32
    #include "../include/windows/win32_interface.hpp"
#endif
#include <iostream>



int main() {
    WindowsSystemSettings current;

    std::cout << "This is a test" << std::endl;
    //Checks if running with Elevated Privileges
    if (current.CheckPermLevel()) {
        std::cout << "This Program is running with Elevated Privileges" << std::endl;
    } else {
        std::cout << "This Program is not running with Elevated Privileges. Some features may be limited." 
        "\nIt is recommened you run as administrator for the full experience." << std::endl;
    }
    //
    current.SettingExists();
    


    //delete below when done with testing
    char UserWantsToExit = 0;
    while (UserWantsToExit != 'q' && UserWantsToExit != 'Q')
    {
        std::cout << "\n\ntype q or Q to exit program: ";
        std::cin >> UserWantsToExit;
    }
    return 0;

}