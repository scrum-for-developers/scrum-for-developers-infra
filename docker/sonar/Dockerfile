FROM java:8-jdk

RUN curl -L -O http://dist.sonar.codehaus.org/sonarqube-4.5.2.zip && \
    unzip sonarqube-4.5.2.zip -d /opt && \
    rm sonarqube-4.5.2.zip

RUN mv /opt/sonarqube-4.5.2 /opt/sonar

RUN sed -i 's|#wrapper.java.additional.6=-server|wrapper.java.additional.6=-server|g' /opt/sonar/conf/wrapper.conf && \
    sed -i 's|#sonar.jdbc.password=sonar|sonar.jdbc.password=123qwe|g' /opt/sonar/conf/sonar.properties && \
    sed -i 's|#sonar.jdbc.user=sonar|sonar.jdbc.user=sonar|g' /opt/sonar/conf/sonar.properties && \
    sed -i 's|sonar.jdbc.url=jdbc:h2|#sonar.jdbc.url=jdbc:h2|g' /opt/sonar/conf/sonar.properties && \
    sed -i 's|#sonar.jdbc.url=jdbc:mysql://localhost|sonar.jdbc.url=jdbc:mysql://db|g' /opt/sonar/conf/sonar.properties && \
    sed -i 's|#sonar.web.context=|sonar.web.context=/sonar|g' /opt/sonar/conf/sonar.properties

COPY sonar-java-plugin-2.8.jar  /opt/sonar/extensions/downloads/sonar-java-plugin-2.2.jar
COPY sonar-javascript-plugin-2.2.jar /opt/sonar/extensions/downloads/sonar-javascript-plugin-2.1.jar
COPY sonar-web-plugin-2.3.jar /opt/sonar/extensions/downloads/sonar-web-plugin-2.3.jar

CMD ["/opt/sonar/bin/linux-x86-64/sonar.sh","console"]
