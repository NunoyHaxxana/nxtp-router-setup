#!/bin/bash


#PARAM
file="/etc/ssh/sshd_config"
param[1]="PermitRootLogin"
param[2]="PubkeyAuthentication"
param[3]="AuthorizedKeysFile"
param[4]="PasswordAuthentication"
param[5]="MaxAuthTries"
param[6]="LoginGraceTime"
param[7]="PermitEmptyPasswords"
param[8]="ChallengeResponseAuthentication"
param[9]="KerberosAuthentication"
param[10]="GSSAPIAuthentication"
param[11]="PermitUserEnvironment"
param[12]="AllowAgentForwarding"
param[13]="AllowTcpForwarding"
param[14]="PermitTunnel"
#param[15]="AllowUsers"


#BACKUP

  if [ -f ${file} ]
  then
    cp ${file} ${file}.connext
  else
    echo "File ${file} not found."
    exit 1
  fi


#EDIT
for PARAM in ${param[@]}
  do
    sed -i '/^'"${PARAM}"'/d' ${file}
  done
  
  echo " " >> ${file}
  echo "#Setup for Connext" >> ${file}
  
  
  
  echo -e "\e[1m\e[32m${param[1]} set to no\e[0m" && sleep 1
  echo "${param[1]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[2]} set to yes\e[0m" && sleep 1
  echo "${param[2]} yes" >> ${file}

  echo -e "\e[1m\e[32m${param[3]} set up\e[0m" && sleep 1
  echo "${param[3]} .ssh/authorized_keys" >> ${file}

  echo -e "\e[1m\e[32m${param[4]} set to no\e[0m" && sleep 1  
  echo "${param[4]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[5]} set to 3\e[0m" && sleep 1  
  echo "${param[5]} 3" >> ${file}

  echo -e "\e[1m\e[32m${param[6]} set to 20\e[0m" && sleep 1  
  echo "${param[6]} 20" >> ${file}

  echo -e "\e[1m\e[32m${param[7]} set to no\e[0m" && sleep 1
  echo "${param[7]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[8]} set to no\e[0m" && sleep 1
  echo "${param[8]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[9]} set to no\e[0m" && sleep 1
  echo "${param[9]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[10]} set to no\e[0m" && sleep 1
  echo "${param[10]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[11]} set to no\e[0m" && sleep 1
  echo "${param[11]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[12]} set to no\e[0m" && sleep 1
  echo "${param[12]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[13]} set to no\e[0m" && sleep 1
  echo "${param[13]} no" >> ${file}

  echo -e "\e[1m\e[32m${param[14]} set to no\e[0m" && sleep 1
  echo "${param[14]} no" >> ${file}
