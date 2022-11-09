sudo
echo -n "Enter your menu choice [1-4]: "


while :
do

read choice

case $choice in
  
  1)  sudo apt-get upgrade
  ;;
  2)
      read user
      echo '$user:AegisHolo0006!' | sudo chpasswd"
  ;;
  3)  echo "You have selected the option 3"
      echo "Selected Fruit is Mango. ";;    
  Help)  echo "SELECT YOUR FAVORITE FRUIT";
      echo "1. Update"
      echo "2. Change User Password"
      echo "3. Mango"
      echo "4. Exit from menu ";;
  *) echo "invalid option";;
  
esac
  echo -n "Enter your menu choice [1-4]: "
done
