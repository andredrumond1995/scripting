istory#!/bin/bash
function justforannotation(){
  echo "###########################################################"
  echo "    ####   ####   #   #               #  #### #    "
  echo "    #   #  #   #  #   #              #  #     #"
  echo "    #   #  # #    #   #   ####      #    ###  ####"
  echo "    #  #   #  #   #   #            #       #  #   #"
  echo "    ##     #   #  #####         # #    ###    #   #"
  echo "###########################################################"
}
justforannotation;

echo -e "Type the full path with IP address in accordance to the shared's folder path"
echo -e "ex: //127.0.0.1/folder/folder: \c"
read ipaddress
echo -e "Type the domain alias: \c"
read domain
echo -e "\c"
echo -e "Type the username to login in "$domain:" \c"
read username
zecho -e "\c"
read -s -p "Type the password to login in "$domain/$username": " password
echo -e "\n"
echo -e "You will try to mount in $PWD/networkmount the path $ipaddress using $domain/$username credentials;"
OPTIONS="0"
select opt in $OPTIONS; do
  if [ "$opt" = "0" ]; then
    echo "Exiting software..."
    exit 0
  elif [ "$opt" != "0" ]; then
    mount.cifs -o username=$username,password=$password,dom=$domain $ipaddress $PWD/networkmount 2> /dev/null
    check=$(df -h | grep "$PWD/networkmount")
    if [[ -z $check ]]; then
      echo "The $ipaddress might be invalid. Try again."
      exit 0
    else
      echo "The $ipaddress was mounted successfully"
      exit 0
    fi
  else
    clear
    echo bad option
  fi
done
