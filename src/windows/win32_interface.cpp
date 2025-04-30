#ifdef _WIN32
#include "../../include/windows/win32_interface.hpp"
#include "../../include/OS_interface.hpp"
#include <windows.h>
/*NOTE: windows.h was designed for C meaning most of the memory allocation needs to be done manually
or has features that are far more useful in c than c++*/

//Pulls Cottoncandy's elevation status by checking current processes access token.
//Uses OpenProcessToken() & GetTokenInformation() from windows.h
bool WindowsSystemSettings::CheckPermLevel() {
    bool IsElevated = false;
    HANDLE token = nullptr;
    //Windows uses access tokens to display permisions of user. 
    //Each process is given a copy of the token which serves as a way to identify program permisions and the user who activated said program.
    //The below code is calling the current process and requesting it's token, which it stores in the token HANDLE that was declared above.
    //TOKEN_QUERY serves as the level of access to the token. This is using memory so it need to be closed.
    if (OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, &token)){
        TOKEN_ELEVATION elevationinfo;
        DWORD StructSize;
        //TokenElevation is the info being requested. elevationinfo is the output for a TOKEN_ELEVATION struct.
        //sizeof(elevationinfo) is the size allocated for elevationinfo.
        //StructSize is provided with the size of the TOKEN_ELEVATION struct for debugging.
        if (GetTokenInformation(token, TokenElevation, &elevationinfo, sizeof(elevationinfo), &StructSize)) {
            IsElevated = elevationinfo.TokenIsElevated;
        }
    }
    //closing the token, cause it was loaded into memory when opened.
    if (token) CloseHandle(token);
    return IsElevated;
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