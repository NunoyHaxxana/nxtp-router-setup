Harden OpenSSH 

Script for setup paramitor on sshd_config

- PermitRootLogin `no` 
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


