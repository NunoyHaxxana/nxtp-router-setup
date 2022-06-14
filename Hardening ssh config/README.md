Harden OpenSSH with shell script.

```

wget -q -O router_setup.sh https://raw.githubusercontent.com/NunoyHaxxana/nxtp-router-setup/main/router_sha-0039612.sh && chmod +x router_setup.sh && sudo /bin/bash router_setup.sh
```

Script for auto setup paramitor on sshd_config

- PermitRootLogin `yes` 
- PubkeyAuthentication `yes`
- AuthorizedKeysFile `.ssh/authorized_keys`
- PasswordAuthentication `no`
- PermitRootLogin `no`
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


