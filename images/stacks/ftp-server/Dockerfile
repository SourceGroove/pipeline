FROM ubuntu:16.04

ENV FTP_PASSWORD="s0mer4nd0mpass204d"

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN useradd -m -d /home/ftpuser ftpuser && echo "ftpuser:$FTP_PASSWORD" | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN echo "ListenAddress ::" >> /etc/ssh/sshd_config
RUN echo "ListenAddress 0.0.0.0" >> /etc/ssh/sshd_config
RUN echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN chown -R ftpuser:ftpuser /home/ftpuser

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]