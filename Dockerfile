FROM registry.fedoraproject.org/fedora
RUN dnf -y install openssh-server openssh openssh-clients iproute && dnf clean all && /usr/bin/ssh-keygen -A
RUN useradd test && echo 'test:test' | chpasswd
//RUN echo "LogLevel DEBUG3" >> /etc/ssh/sshd_config
ENTRYPOINT /usr/sbin/sshd -Dddd
