Harden OpenSSH with shell script.



## Important :: Script disable login with password. Please setup authorized_keys before runscript.

### How To Configure SSH Key on Server. : https://github.com/NunoyHaxxana/nxtp-router-setup/tree/main/SSH-KEYs


---

## Clone and Install Scripts

```

wget -q -O sshconfig.sh https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-setup/main/Hardening%20ssh%20config/sshconfig.sh && chmod +x sshconfig.sh && sudo /bin/bash sshconfig.sh
```

Script for auto setup paramitor on sshd_config

- PermitRootLogin `yes` 
- PubkeyAuthentication `yes`
- AuthorizedKeysFile `.ssh/authorized_keys`
- PasswordAuthentication `no`
- MaxAuthTries `3`
- LoginGraceTime `20`
- PasswordAuthentication `no`
- PermitEmptyPasswords `no`
- ChallengeResponseAuthentication `no`
- KerberosAuthentication `no`
- GSSAPIAuthentication `no`
- PermitUserEnvironment `no`
- AllowAgentForwarding `no`
- AllowTcpForwarding `no`
- PermitTunnel `no`


