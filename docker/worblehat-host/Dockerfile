FROM java:8-jre

# worblehat stuff
COPY application.properties /opt/worblehat/
COPY init_env.sh /opt/worblehat/
RUN touch /opt/worblehat/worblehat.jar && chmod 755 /opt/worblehat/worblehat.jar && ln -s /opt/worblehat/worblehat.jar /etc/init.d/worblehat

# Create sshd image, see https://docs.docker.com/examples/running_ssh_service/
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

CMD ["/opt/worblehat/init_env.sh"]
