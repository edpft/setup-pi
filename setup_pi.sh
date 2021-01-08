#! /bin/bash

# Update system
sudo apt-get update \
&& sudo apt-get -y dist-upgrade \
&& sudo apt-get -y autoremove \
&& sudo apt-get -y autoclean

# Disable password login
sudo nano /etc/ssh/sshd_config
# edit firewall
sudo service ssh reload

# reboot system
sudo reboot

# Install a firewall
sudo apt-get install ufw \
&& sudo update-alternatives --set iptables /usr/sbin/iptables-legacy \
&& sudo allow ssh \
&& sudo ufw limit ssh/tcp \
&& sudo ufw enable
