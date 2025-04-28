#ifdef _WIN32
#ifndef CC_WIN32_INTERFACE_HPP
#define CC_WIN32_INTERFACE_HPP

#include "../OS_interface.hpp"

class setting {
    private:
        
};

class WindowsSystemSettings : public SystemSettings {
    public:
        virtual bool CheckPermLevel() override;
        virtual bool SettingExists() override;
        virtual std::string SettingGet() override;
        virtual int SettingSet() override;
        virtual void SaveSettings() override;
        virtual void LoadSettings() override;
};





#endif
#endif
