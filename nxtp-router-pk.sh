#For router:0.2.0-alpha.10 Only
#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi
bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi
sleep 1 
echo -e '\e[40m\e[92m'
echo -e ' @@@@@@@@@@@@@@@&BG5YYYYYJJJJJJJY5G#@@@@@@@@@@@@@@@'
echo -e ' @@@@@@@@@@@&BP55PGB#&@@@@@@@@&#BG5YJYP#@@@@@@@@@@@'
echo -e ' @@@@@@@@&#PPG#&@@@@@@@@@@@@@@@@@@@@&B5JJP&@@@@@@@@'
echo -e ' @@@@@@&BPG#@@@@@@@@@@@@@@@@@@@@@@@@@@@@#5?Y&@@@@@@'
echo -e ' @@@@@BPG&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&575@@@@@'
echo -e ' @@@&PP#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#J?#@@@'
echo -e ' @@#5P@@@@@@@@@@@@@@&&@@@@@@@@@@@@@@@@@@@@@@@@5!B@@'
echo -e ' @&YP@@@@@@@@@@@@@@7.:J#@@@@@@&#&@@@@@@@@@@@@@@P!#@'
echo -e ' @55&@@@@@@@@@@@@@B:   .?#@@@&~ :?#@@@@@@@@@@@@@Y?&'
echo -e ' BJB@@@@@@@@@@@@G!  :?^  .7#@@G~  .7B@@@@@@@@@@@&7P'
echo -e ' 5Y&@@@@@@@@@@G!  :J&@@5~. Y@@@@G7  .7#@@@@@@@@@@Y?'
echo -e ' J5@@@@@@@@@@J  .Y&@@@@@@#&@@@@@@@#~  :#@@@@@@@@@P7'
echo -e ' J5@@@@@@@@@@7  :P@@@@@@@&#&@@@@@@P^  ~&@@@@@@@@@G7'
echo -e ' YJ&@@@@@@@@@&Y:  ^5@@@@B. :J#@@5^  ^5@@@@@@@@@@@5J'
echo -e ' G?B@@@@@@@@@@@&Y:  ^Y&@&Y:  .7^  ^5@@@@@@@@@@@@&?P'
echo -e ' @YJ&@@@@@@@@@@@@&5^ .B@@@&5^    5@@@@@@@@@@@@@@PY&'
echo -e ' @#?Y@@@@@@@@@@@@@@@#&@@@@@@@5~.^#@@@@@@@@@@@@@BJ#@'
echo -e ' @@#?Y&@@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@@@@@@BY#@@'
echo -e ' @@@#JJB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&G5&@@@'
echo -e ' @@@@@P?5#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@BPB@@@@@'
echo -e ' @@@@@@&5JYB@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGB&@@@@@@'
echo -e ' @@@@@@@@&GYJ5B&@@@@@@@@@@@@@@@@@@@@@#BGG#&@@@@@@@@'
echo -e ' @@@@@@@@@@@&G5YYPGB#&@@@@@@@@&&#BGGPG#&@@@@@@@@@@@'
echo -e ' @@@@@@@@@@@@@@@#BP55YY55555555PPG#&@@@@@@@@@@@@@@@'
echo -e '\e[0m'
sleep 1

echo -e "\e[1m\e[32m Installing required tool... \e[0m" && sleep 1
apt update && apt install git sudo unzip wget -y

mkdir -p $HOME/connext

echo " "
echo -e "\e[1m\e[32m1. Create Private Key... \e[0m" && sleep 1
openssl rand -hex 32 > $HOME/connext/your.key




echo " "
#Install Docker & Docker-Compose
echo -e "\e[1m\e[32m2. Checking Docker ... \e[0m" && sleep 1
if ! command -v docker &> /dev/null
then
echo " "
    echo -e "\e[1m\e[32m2.1 Installing Docker... \e[0m" && sleep 1
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
fi
echo " "
echo -e "\e[1m\e[32m3. Checking Docker Compose ... \e[0m" && sleep 1
docker compose version
if [ $? -ne 0 ]
then
echo " "
    echo -e "\e[1m\e[32m3.1 Installing Docker Compose v2.5.0 ... \e[0m" && sleep 1
curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi







#setup nxtp-route 
echo " "
echo -e "\e[1m\e[32m4. Downloading nxtp-route ... \e[0m" && sleep 1
cd $HOME/connext
git clone https://github.com/connext/nxtp-router-docker-compose.git
sleep 2 
cd $HOME/connext/nxtp-router-docker-compose
sleep 2 

echo " "
echo -e "\e[1m\e[32m5. Check amarok version ... \e[0m" && sleep 1
git checkout amarok
sleep 2 

echo " "
echo -e "\e[1m\e[32m6. Updating configuration 0.2.0-alpha.10 ... \e[0m" && sleep 1
docker pull ghcr.io/connext/router:0.2.0-alpha.10


#create env config  key file config files
echo " "
echo -e "\e[1m\e[32m7. Create .env config.json key.yaml files ... \e[0m" && sleep 1
cd $HOME/connext/nxtp-router-docker-compose
cp .env.example .env
sleep 2
wget -O config.json https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-docker-config/main/config.json
sleep 2
cp key.example.yaml key.yaml
sleep 2
sed -i 's/dkadkjasjdlkasdladadasda/'$(cat $HOME/connext/your.key)'/g' key.yaml
sleep 2
sed -i 's/latest/0.2.0-alpha.10/g' .env
sleep 2

docker-compose down   

sleep 2
docker-compose up -d
sleep 12

echo "=================================================================="

echo -e "\e[1m\e[32m nxtp-router Started \e[0m"
echo -e "\e[1m\e[92m Private Key:  \e[0m" $(cat $HOME/connext/your.key)
echo -e "\e[1m\e[92m Address:  \e[0m" $(curl -s localhost:8000/config | cut -d '"' -f 4)

echo "=================================================================="
