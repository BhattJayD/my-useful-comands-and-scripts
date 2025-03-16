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
    echo "alias full='nmap -Pn -p- --min-rate 10000 -oN full -vv'" >> $1

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
    echo "alias full='nmap -Pn -p- --min-rate 10000 -oN full -vv'" >> ~/.bashrc

fi


# Installing SecList
echo "Installing SecList"

sudo apt install git
mkdir ~/Tools;cd ~/Tools;git clone https://github.com/danielmiessler/SecLists.git

echo install usefull john srcs
cd ~/Tools;git clone https://github.com/openwall/john.git

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


echo "Installing checksec"
sudo apt install checksec

echo "Installing ffuf dirb wfuzz gobuster nmap"
sudo apt install fuzz dirb wfuzz gobuster nmap

echo "creating dir for ctf's vpn files"
mkdir ~/vpn

echo "Checking from snap... to install obsidian"
[ -x "$(command -v snap)" ] && sudo snap install obsidian --classic || echo "snap not found"

echo "Checking from snap... to install keepassxc"
[ -x "$(command -v snap)" ] && sudo snap install keepassxc --classic || echo "snap not found"

echo "Checking from snap... to install john-the-ripper"
[ -x "$(command -v snap)" ] && sudo snap install john-the-ripper --classic || echo "snap not found"

echo "Installing flameshot"
[ -x "$(command -v snap)" ] && sudo snap install flameshot --classic || echo "snap not found"


echo "download jadxgui from browser..."
[ -x "$(command -v firefox)" ] && firefox https://github.com/skylot/jadx/releases || echo "firefox not found"


echo "Installing docker"
[ -x "$(command -v snap)" ] && sudo snap install docker || echo "snap not found"

echo "Installing sqlmap"
[ -x "$(command -v snap)" ] && sudo snap install sqlmap || echo "snap not found"


# Adding scan() function to ~/.bashrc
echo "scan() {" >> $1
echo "    if ping -c 1 \"\$1\" &>/dev/null; then" >> $1
echo "        echo \"[+] Host is up. Starting full scan...\"" >> $1
echo "        nmap -Pn -p- --min-rate 10000 -oN full -vv \"\$1\"" >> $1
echo "" >> $1
echo "        open_ports=\$(grep /tcp full | awk '{print \$1}' | cut -d'/' -f1 | paste -sd,)" >> $1
echo "" >> $1
echo "        if [[ -n \"\$open_ports\" ]]; then" >> $1
echo "            echo \"[+] Open ports found: \$open_ports\"" >> $1
echo "            echo \"[+] Starting initial scan on open ports...\"" >> $1
echo "            nmap -Pn -sVC -oN initial -A -vv -p \"\$open_ports\" \"\$1\"" >> $1
echo "        else" >> $1
echo "            echo \"[-] No open ports found in full scan.\"" >> $1
echo "        fi" >> $1
echo "    else" >> $1
echo "        echo \"[-] Host is down or unreachable.\"" >> $1
echo "    fi" >> $1
echo "}" >> $1