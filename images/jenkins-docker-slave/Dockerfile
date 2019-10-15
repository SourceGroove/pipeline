FROM jenkins/ssh-slave
USER root
VOLUME /tmp

RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        xenial \
        stable"

RUN apt-get update && \ 
    apt-get install -qy docker-ce && \
    apt-get -qy full-upgrade && \
    apt-get install -qy git && \
    apt-get install -qy openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
    apt-get install -qy openjdk-8-jdk && \
    apt-get -qy autoremove

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]