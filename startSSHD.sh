#!/bin/bash

KDIR=/tmp/host_keys
mkdir ${KDIR}

### debug1: Unable to load host key: /etc/ssh/ssh_host_ed25519_key
### sshd: no hostkeys available -- exiting.
ssh-keygen -b 1024 -t rsa -N '' -f ${KDIR}/ssh_host_rsa_key > /dev/null
ssh-keygen -b 1024 -t dsa -N '' -f ${KDIR}/ssh_host_dsa_key > /dev/null

echo "USERNAME: test  PASSWORD: test"

### Bind to port 22 on :: failed: Permission denied.
/usr/sbin/sshd -Dddd -h /tmp/host_keys/ssh_host_dsa_key -h /tmp/host_keys/ssh_host_rsa_key -p 2222
