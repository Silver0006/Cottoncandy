#ifdef _WIN32
#include "../../include/OS_interface.hpp"
#include "../../include/windows/win32_interface.hpp"



bool WindowsSystemSettings::CheckPermLevel() {
    std::cout << "Windows check perm test" << std::endl;
    return true;
}
bool WindowsSystemSettings::SettingExists() {
    std::cout << "Windows check settings exist" << std::endl;
    return true;
}
std::string WindowsSystemSettings::SettingGet() {
    std::cout << "Windows check setting get" << std::endl;
    return "true";
}
int WindowsSystemSettings::SettingSet() {
    std::cout << "Windows check perm test" << std::endl;
    return 0;
}
void WindowsSystemSettings::SaveSettings() {
    std::cout << "Windows check save settings" << std::endl;
}
void WindowsSystemSettings::LoadSettings() {
    std::cout << "Windows check load settings" << std::endl;

}



#endif