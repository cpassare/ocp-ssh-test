FROM registry.fedoraproject.org/fedora
RUN dnf -y install openssh-server openssh openssh-clients iproute strace && dnf clean all && /usr/bin/ssh-keygen -A
RUN useradd test && echo 'test:test' | chpasswd
RUN chmod 644 /etc/ssh/sshd_config
#RUN echo "LogLevel DEBUG3" >> /etc/ssh/sshd_config
ENTRYPOINT /usr/sbin/sshd -Dddd
