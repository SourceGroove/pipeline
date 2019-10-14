FROM openjdk:8-jdk-alpine

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}

# install docker
RUN apk update && apk add docker && apk add openssh
# setup SSH server
#RUN apt-get update \ 
#    && apt-get install --no-install-recommends -y openssh-server \
#    && sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
    #&& rm -rf /var/lib/apt/lists/* \
    #&& sed -i /etc/ssh/sshd_config \
    #    -e 's/#PermitRootLogin.*/PermitRootLogin yes/' \
    #    -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
    #    -e 's/#PasswordAuthentication.*/PasswordAuthentication yes/' \
    #    -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
    #    -e 's/#LogLevel.*/LogLevel INFO/' \ 
    #&& mkdir /var/run/sshd

# setup user    
RUN groupadd -g ${gid} ${group} \
    && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}" \
    && echo "${group}:${user}" | chpasswd \
    && mkdir -p ${JENKINS_AGENT_HOME}/.m2 \
    && mkdir -p ${JENKINS_AGENT_HOME}/.ssh \
    && echo "" > ${JENKINS_AGENT_HOME}/.ssh/authorized_keys \
    && chown -R jenkins:jenkins ${JENKINS_AGENT_HOME}  

RUN chmod -R 777 /usr/local/openjdk-8 && ln -s /usr/local/openjdk-8/bin/java /usr/bin/java

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]