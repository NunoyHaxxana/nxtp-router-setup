#!/bin/bash

echo "=============================================================="
echo -e "\033[0;35m"
echo " ██████╗ ██████╗ ███╗   ██╗███╗   ██╗███████╗██╗  ██╗████████╗";
echo "██╔════╝██╔═══██╗████╗  ██║████╗  ██║██╔════╝╚██╗██╔╝╚══██╔══╝";
echo "██║     ██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗   ╚███╔╝    ██║   ";
echo "██║     ██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝   ██╔██╗    ██║   ";
echo "╚██████╗╚██████╔╝██║ ╚████║██║ ╚████║███████╗██╔╝ ██╗   ██║   ";
echo " ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝   ";
echo -e "\e[0m"          
echo "=============================================================="
sleep 3
echo " "



function Installingrequiredtool {
echo -e "\e[1m\e[32mInstalling required tool ... \e[0m" && sleep 1
sudo apt install curl -y < "/dev/null"
apt update && apt install git sudo unzip wget -y < "/dev/null"
}


function Installingdocker {
echo " "
echo -e "\e[1m\e[32mInstalling Docker ... \e[0m" && sleep 1
if ! command -v docker &> /dev/null
then
echo " "
echo -e "\e[1m\e[32mInstalling Docker ... \e[0m" && sleep 1
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh < "/dev/null"
fi
echo " "
echo -e "\e[1m\e[32mInstalling Docker Compose v2.5.1 ... \e[0m" && sleep 1
curl -SL https://github.com/docker/compose/releases/download/v2.5.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}


function backupPK {
echo " "
echo -e "\e[1m\e[32mPreparing to backup router private key ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
cat key.yaml |grep privateKey | awk -F'"' '{print $2}' > $HOME/connext/router_private_key.json
echo -e "\e[1m\e[92mYour Private Key:  \e[0m" $(cat $HOME/connext/router_private_key.json)
pkBkpPath="$HOME/connext/router_private_key.json"
echo -e "\e[7mYour Private Key on $pkBkpPath\e[0m"
cd $HOME
}


function createpk {
echo " "
echo -e "\e[1m\e[32mCreate Private Key ... \e[0m" && sleep 1
openssl rand -hex 32 > $HOME/connext/router_private_key.json
echo -e "\e[1m\e[92mYour Private Key:  \e[0m" $(cat $HOME/connext/router_private_key.json)
}


function installnxtp {
echo " "
echo -e "\e[1m\e[32mPreparing to install Router ... \e[0m" && sleep 1
mkdir -p $HOME/connext
cd $HOME/connext
git clone https://github.com/connext/nxtp-router-docker-compose.git
}


function coreversion_amarok {
echo " "
echo -e "\e[1m\e[32mSwitch to amarok version ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
git checkout amarok
}



function createConfig {
cd $HOME/connext/nxtp-router-docker-compose
cp config.example.json config.json
}


function setenvfile {
cd $HOME/connext/nxtp-router-docker-compose
cp .env.example .env
sed -i 's/latest/0.2.0-beta.1/g' .env
}


function upvernxtp {
cd $HOME/connext/nxtp-router-docker-compose
read -p "Insert Router Version: " nxtpv
cp .env.example .env
sed -i 's/latest/'${nxtpv}'/g' .env
docker pull ghcr.io/connext/router:${nxtpv}
}


function setautokeyfile {
cd $HOME/connext/nxtp-router-docker-compose
cp key.example.yaml key.yaml
sed -i 's/dkadkjasjdlkasdladadasda/'$(cat $HOME/connext/router_private_key.json)'/g' key.yaml
}

function setyourkeyfile {
echo " "
echo -e "\e[1m\e[32mPreparing your Private Key ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
cp key.example.yaml key.yaml
read -p "Insert your Private Key: " yourpk
sed -i 's/dkadkjasjdlkasdladadasda/'${yourpk}'/g' key.yaml
}


function set0.2.0-beta.1 {
echo " "
echo -e "\e[1m\e[32mPreparing Router v0.2.0-beta.1 ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
docker pull ghcr.io/connext/router:0.2.0-beta.1
}


function dockerpull {
echo " "
echo -e "\e[1m\e[32mPreparing pull docker ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
docker-compose pull
}

function dockerdown {
echo " "
echo -e "\e[1m\e[32mPreparing down Router ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
docker-compose down
}

function dockerup {
echo " "
echo -e "\e[1m\e[32mPreparing Start Router ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
docker-compose up -d
}

function delete {
echo " "
echo -e "\e[1m\e[32mPreparing Delete Router ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
docker-compose down
cd $HOME
rm -rf $HOME/connext/nxtp-router-docker-compose
}






PS3='Please enter your choice (input your option number and press enter): '
options=("Install with Auto PKey" "Install with Your PKey" "Upgrade Version" "Backup PKey" "Delete" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Install with Auto PKey")
            echo -e '\e[1m\e[32mYou choose Install Router with auto Private Key ...\e[0m' && sleep 1
Installingrequiredtool
Installingdocker
installnxtp
coreversion_amarok
set0.2.0-beta.1
createConfig
setenvfile
createpk
setautokeyfile
dockerpull
dockerup
echo -e "\e[1m\e[32mYour Router was Install!\e[0m" && sleep 1
break
;;

"Install with Your PKey")
            echo -e '\e[1m\e[32mYou choose Install Router with your Private Key ...\e[0m' && sleep 1
Installingrequiredtool
Installingdocker
installnxtp
coreversion_amarok
set0.2.0-beta.1
createConfig
setenvfile
setyourkeyfile
dockerpull
dockerup
echo -e "\e[1m\e[32mYour Router was Install!\e[0m" && sleep 1
break
;;

"Upgrade Version")
            echo -e '\e[1m\e[32mYou choose Upgrade Version ...\e[0m' && sleep 1
dockerdown
upvernxtp
dockerpull
dockerup
echo -e "\e[1m\e[32mYour Router was upgraded!\e[0m" && sleep 1
break


;;
"Backup PKey")
echo -e '\e[1m\e[32mYou choose Backup Private Key ...\e[0m' && sleep 1
backupPK
break

;;
"Delete")
echo -e '\e[1m\e[32mYou choose Delete All Router File and Data ...\e[0m' && sleep 1
delete
break

;;
"Quit")
break
;;

*) echo -e "\e[91minvalid option $REPLY\e[0m";;
    esac
done
