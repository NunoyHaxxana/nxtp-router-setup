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
- 
---

# Option — Limits IP Address for Allowlist.


Using the list of allowed IP addresses, you can be sure that you can log in only from approved IP addresses. This greatly reduces the risk of leaking your private key and/or password.

## Be careful before proceeding with the settings. You have to make sure your ip is Static internet Protocol Address.

`AllowUsers *@your Static internet Protocol Address`

# Example 
Allow ip setup.

`AllowUsers *@123.123.123.123 >> /etc/ssh/sshd_config` 

Test your configuration syntax.

`sudo sshd -t`

Reload OpenSSH server to apply your configuration.

`sudo service sshd reload`


