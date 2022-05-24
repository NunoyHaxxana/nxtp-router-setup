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
mkdir -p $HOME/connext
if [ ! $Private_Key ]; then
read -p "Enter Your Private_Key: " Private_Key
echo 'export Private_Key='\"${Private_Key}\" >> $HOME/connext/your.key
fi

apt update && apt install git sudo unzip wget -y
#install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
#install docker-compose
curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
 
#install nxtp-route
cd $HOME/connext
git clone https://github.com/connext/nxtp-router-docker-compose.git
sleep 2 
cd $HOME/connext/nxtp-router-docker-compose
sleep 2 
git checkout amarok
sleep 2 
#docker pull ghcr.io/connext/router:0.2.0-alpha.10


#create env config  key file
cp .env.example .env
sleep 2
wget -O config.json https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-docker-config/main/config.json
sleep 2
wget -O key.yaml https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-docker-config/main/key.yaml
sleep 2

sed -i 's/you_privatekey/'$Private_Key'/g' key.yaml
sleep 2
sed -i 's/latest/0.2.0-alpha.10/g' .env
sleep 2
docker-compose down   

sleep 2
docker compose up -d
echo -e "Your Router \e[32minstalled and works\e[39m!"
