![router setup](https://user-images.githubusercontent.com/83507970/170120644-be13ee8c-486c-43e5-a2ce-f88c4f2aaaa5.png)

# Script for install Connext Router `Last release version` + Auto update last version.

# Detailed of script:
- Automate to install Docker.
- Automate to install Docker-compose v2.5.1
- Automate to install nxtp-router.
- Automate to get & install Latest version.
- Automate to get & update Latest version.
- Manual update version.
- Automate to generate private key.
- Automate to backup private key.
- Automate to swith to amarok.
- Automate to create and config file .env, key.yaml, config.json
- Automate to delete nxtp-router file and docker-compose.



### Requirements

- OS Ubuntu 18.04 or 20.04 
>:black_square_button: 8GB RAM<br>
>:black_square_button: 30GB Storage<br>
- Need Super user or root for run this script.
- You can check the current Router version in the https://github.com/connext/nxtp/releases


## Clone and Install Scripts

```

wget -q -O router_setup.sh https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-setup/main/nxtp-router.sh && chmod +x router_setup.sh && sudo /bin/bash router_setup.sh
```



![image](https://user-images.githubusercontent.com/83507970/171801249-e684a66a-2f01-4746-a913-f46f99c33896.png)


Choose you wanted option (for example option 1 Install with Auto PKey), press enter and wait for installation to complete.


# Menu options:


| No           | Menu | Detail | 
| ------------ | :--------: | :--------: | 
| 1            | Install + Auto PKey | Automatically Install router and generate private key| 
| 2            | Install + Your PKey | Automatically Install router with your private key| 
| 3            | Auto Upgrade | Auto upgrade router to new version | 
| 4            | Manual Upgrade | Manual upgrade router version |  
| 5            | Backup PKey | Backup and show your private key | 
| 6            | Delete | Delete Router and Data File |  
| 7            | Quit | Quit on menu | 


- Auto Switched to a new branch 'amarok' and Auto get Last NXTP Version
![image](https://user-images.githubusercontent.com/83507970/171803537-053a5b3f-b807-4eb5-b6c6-e230e8f9796e.png)

- On menu Manual Upgrade, Your can insert NXTP Version need to upgade.
![image](https://user-images.githubusercontent.com/83507970/171803972-353f9884-9c77-4e85-a576-4cb556c78995.png)

---














### (Optional) Command
- Monitor router real time log.
```
docker logs --follow --tail 100 router
```


- Check the status.
```
docker-compose ps 
OR 
docker ps -a
```

- Restart Docker
```
docker-compose restart
```

- Stop and delete containers.

```
docker-compose down
```




