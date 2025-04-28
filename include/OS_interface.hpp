#ifndef CC_OS_INTERFACE_HPP
#define CC_OS_INTERFACE_HPP

#include <iostream>
#include <string>

class SystemSettings {
    public:
    virtual ~SystemSettings() = default;
    virtual bool CheckPermLevel() = 0;

    virtual bool SettingExists() = 0;

    virtual std::string SettingGet() = 0;

    virtual int SettingSet() = 0;

    virtual void SaveSettings() = 0;

    virtual void LoadSettings() = 0;
};


#endif
