#!/bin/bash

if [ $# -eq 1 ]; then

    echo " \n \n \n \n " >> $1
    echo "########################## ANDROID ######################" >> $1

    echo "export ANDROID_HOME=$HOME/Android/Sdk" >> $1
    echo "export PATH=$PATH:$ANDROID_HOME/emulator" >> $1
    echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> $1

    echo "#########################################################" >> $1
    echo " \n \n \n \n " >> $1


    #echo "alias ip="ifconfig wlp3s0 | grep inet|head -n 1 | awk '{printf \$2}';echo "" >> $1
    #echo "alias ip="hostname -I | awk '{printf \$1}'"" >> $1
    echo "alias l='ls -lrtha --color=auto'" >> $1
    echo "alias i='sudo apt install'" >> $1
    echo "alias u='sudo apt update && sudo apt upgrade -y'" >> $1
    echo "alias thm='cd ~/Desktop/ctf/thm'" >> $1
    echo "alias htb='cd ~/Desktop/ctf/htb'" >> $1
    echo "alias live='cd ~/Desktop/ctf/ctfTime'" >> $1
    echo "alias up='python3 -m http.server'" >> $1  
    echo "alias pi='curl https://ifconfig.me '" >> $1
    echo "alias m='function _m() { mkdir "$1" && cd "$1"; }; _m'" >> $1
    echo "alias ovpn='sudo openvpn ~/vpn/SplitUnknown.ovpn'" >> $1
    echo "alias pc='function pc() { ping "$1" "$2"; }; pc'" >> $1
    echo "alias clone='function clone() { git clone "$1"; }; clone'" >> $1
    echo "alias initial='nmap -Pn -sVC -oN initial -A -vv'" >> $1

else

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
    echo "alias initial='nmap -Pn -sVC -oN initial -A -vv'" >> ~/.bashrc
fi


# Installing SecList
echo "Installing SecList"

sudo apt install git
mkdir ~/Tools;cd ~/Tools;git clone https://github.com/danielmiessler/SecLists.git

# Installing SearchSploit
echo "Installing SearchSploit"

sudo git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploitdb
sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit


# Installing hashid
echo "Installing hashid"
sudo apt install hashid

echo "Installing smbclient"
sudo apt install smbclient

echo "Installing terminator"
sudo apt install terminator

echo "Installing flameshot"
sudo apt install flameshot

echo "creating dir for ctf's vpn files"
mkdir ~/vpn