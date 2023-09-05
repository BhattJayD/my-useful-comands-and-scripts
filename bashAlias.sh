#!/bin/bash
echo " \n \n \n \n " >> ~/.bashrc
echo "########################## ANDROID ######################" >> ~/.bashrc

echo "export ANDROID_HOME=$HOME/Android/Sdk" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/emulator" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> ~/.bashrc

echo "#########################################################" >> ~/.bashrc
echo " \n \n \n \n " >> ~/.bashrc


#echo "alias ip="ifconfig wlp3s0 | grep inet|head -n 1 | awk '{printf \$2}';echo "" >> ~/.bashrc
#echo "alias ip="hostname -I | awk '{printf \$1}'"" >> ~/.bashrc
echo "alias l='ls -lrtha --color=auto'" >> ~/.bashrc
echo "alias i='sudo apt install'" >> ~/.bashrc
echo "alias u='sudo apt update && sudo apt upgrade -y'" >> ~/.bashrc
echo "alias thm='cd ~/Desktop/ctf/thm'" >> ~/.bashrc
echo "alias htb='cd ~/Desktop/ctf/htb'" >> ~/.bashrc
echo "alias live='cd ~/Desktop/ctf/ctfTime'" >> ~/.bashrc
echo "alias up='python3 -m http.server'" >> ~/.bashrc  
echo "alias pi='curl https://ifconfig.me '" >> ~/.bashrc
echo "alias m='function _m() { mkdir "$1" && cd "$1"; }; _m'" >> ~/.bashrc
echo "alias ovpn='sudo openvpn ~/vpn/SplitUnknown.ovpn'" >> ~/.bashrc
echo "alias pc='function pc() { ping "$1" "$2"; }; pc'" >> ~/.bashrc
echo "alias clone='function clone() { git clone "$1"; }; clone'" >> ~/.bashrc



# Installing SecList
echo "Installing SecList"

sudo apt install git
mkdir ~/a;cd ~/a;git clone https://github.com/danielmiessler/SecLists.git

# Installing SearchSploit
echo "Installing SearchSploit"

sudo git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploitdb
sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit