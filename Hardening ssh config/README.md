Harden OpenSSH with shell script.


### Please setup authorized_keys before runscript.
## Important :: Script disable login with password.

# How To Configure SSH Key on Server.


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

