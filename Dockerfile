FROM registry.fedoraproject.org/fedora
COPY ./startSSHD.sh /usr/sbin
RUN dnf -y install openssh-server openssh openssh-clients iproute && dnf clean all
RUN useradd test && echo 'test:test' | chpasswd
### debug2: load_server_config: filename /etc/ssh/sshd_config
### /etc/ssh/sshd_config: Permission denied
RUN chmod 644 /etc/ssh/sshd_config && chmod 755 /usr/sbin/startSSHD.sh
ENTRYPOINT /usr/sbin/startSSHD.sh
