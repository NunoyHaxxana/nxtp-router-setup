# Script for install NXTP Router `V.0.2.0-alpha.10`

## Router Setup Using Linux & Docker

### Requirements

- Ubuntu 18.04 or 20.04 
- Super user or root



### Option 1 (Automatic setup and gen private key)

1. Clone and Install Scripts

```

wget -q -O nxtp-router-pk.sh https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-docker-config/main/nxtp-router-pk.sh && chmod +x nxtp-router-pk.sh && sudo /bin/bash nxtp-router-pk.sh
```






### Option 2 (manual your private key)
`How to find your privatekey`: https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key

1. Clone and Install Scripts

```

wget -q -O nxtp-router.sh https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-docker-config/main/nxtp-router.sh && chmod +x nxtp-router.sh && sudo /bin/bash nxtp-router.sh
```


2. Enter Private_Key when script show `Enter Your Private_Key:`

![image](https://user-images.githubusercontent.com/83507970/168775317-0b1f344b-cc5b-4fc8-8239-dce6b7cee3dc.png)


3. Wait 1-2 Mins for Automatic setup.


4. Fisnish install command pmpt show `Your Router installed and works!`






5. (Optional) Command
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



### Update Router Version

1. Modify `.env` to change `NXTP_VERSION`

ROUTER_VERSION=xxxxxxx

2. Update stack

```
docker-compose pull
docker-compose up -d
```
