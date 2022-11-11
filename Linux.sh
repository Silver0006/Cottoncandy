sudo
echo -n "Enter your menu choice [1-4]: "


while :
do

read choice

case $choice in
  
  1)  sudo apt-get upgrade
  ;;
  2)
      getent passwd
      read user
      echo '$user:AegisHolo0006!' | sudo chpasswd"
  ;;
  3)  
      getent passwd
      read user
      read group
      adduser $user $group
  ;;   
  4)
      getent passwd
      read id
      id $id 
  5) 
  
  
  Help)  echo "SELECT YOUR FAVORITE FRUIT";
      echo "1. Update"
      echo "2. Change User Password"
      echo "3. Add User to Group"
      echo "4. Exit from menu ";;
  *) echo "invalid option";;
  
esac
  echo -n "Enter your menu choice [1-4]: "
done
