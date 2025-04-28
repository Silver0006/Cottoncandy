sudo


while :
do

read choice

case $choice in
  
  1)  sudo apt-get upgrade
  ;;
  2)
      getent passwd
      read user
      echo '$user:peachjam!' | sudo chpasswd"
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
  locate ' *.mp3'
  
  Help)  echo "SELECT YOUR FAVORITE FRUIT";
      echo "1. Update"
      echo "2. Change User Password"
      echo "3. Add User to Group"
      echo "4. List User Id"
      echo "5. aChange User Password"
      echo "6. Add User to Group"
  *) echo "invalid option";;
  
esac

done
