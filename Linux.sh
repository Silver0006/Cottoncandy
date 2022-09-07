PS3='Please enter your choice: '
options=("Update" "Basic Programs" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Update")
            sudo apt update
            ;;
            
        "Basic Programs")
            sudo apt-get install libpam-cracklib -y
sudo apt-get install pam.d -y
sudo apt-get install gufw -y
sudo apt-get install clamav -y
sudo apt-get install clamtk -y
sudo apt-get install auditd -y (sudo auditctl -e 1)(to config, not 100% tested)
sudo apt-get install bum -y
sudo apt-get install gnome-system-tools -y

            ;;
        "3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "All")
            
            ;;            
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
