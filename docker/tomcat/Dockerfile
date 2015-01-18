FROM tomcat:7.0.57-jre8

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY server.xml /usr/local/tomcat/conf/server.xml
COPY context.xml /usr/local/tomcat/conf/context.xml
RUN cd /tmp && \
    curl -L -o mysql-connector-java-5.1.34.zip http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.34.zip && \
    unzip mysql-connector-java-5.1.34.zip && \
    cp  mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.34.jar && \
    rm -r mysql-connector-java-5.1.34
