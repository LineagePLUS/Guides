#!/bin/bash

sudo apt-get update -qq && sudo apt-get dist-upgrade -y
sudo apt-get install -y preload
sudo dd if=/dev/zero of=/swap bs=1024 count=1024k
sudo mkswap /swap
sudo swapon /swap
echo "/swap       none    swap    sw      0       0 " >> /etc/fstab
sudo chown root:root /swap
sudo chmod 0600 /swap
echo "vm.swappiness=90" >> /etc/sysct1.conf
sudo apt-get install -y mumble-server
dpkg-reconfigure mumble-server
mkdir /apps
mkdir /apps/mumble
nano /etc/mumble-server.ini
service mumble-server restart
echo "# ======================================================================="
echo "# Your system needs to reboot, would you like to restart now?            "
echo "# ======================================================================="
read -p "Y or N: " reboot
if [[ $reboot == [Yy] ]] ; then
  rm ~/install.sh
  reboot
fi
if [[ $reboot == [Yy] ]] ; then
  rm ~/install.sh
  exit
fi
