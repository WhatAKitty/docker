FROM whatakitty/oracle-jdk:7

MAINTAINER WhatAKitty 104xuqiang@gmail.com

ENV TEMP_PATH       /tmp/tomcat
ENV TOMCAT_VERSION  8.5.20
ENV CATALINA_HOME     /home/web/apache-tomcat
ENV TOMCAT_DATA     /mnt/tomcat/WebRoot
ENV TOMCAT_CONF     $CATALINA_HOME/conf
WORKDIR $CATALINA_HOME

# TEMP PATH
RUN mkdir -p $TEMP_PATH
COPY "apache-tomcat-${TOMCAT_VERSION}.tar.gz" "${TEMP_PATH}/apache-tomcat-${TOMCAT_VERSION}.tar.gz"

RUN groupadd docker && adduser --disabled-password --gecos "" tomcat \
	&& sed -i -e "s/%sudo.*$/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers \
	&& usermod -a -G docker,sudo tomcat

RUN mkdir -p          $CATALINA_HOME $TOMCAT_DATA \
  && tar -xzf         "${TEMP_PATH}/apache-tomcat-${TOMCAT_VERSION}.tar.gz" -C "${CATALINA_HOME}" --strip-components=1 \
  && chmod +x         "${CATALINA_HOME}/bin/startup.sh" "${CATALINA_HOME}/bin/shutdown.sh" "${CATALINA_HOME}/bin/catalina.sh" \
  && chown -R tomcat  "${CATALINA_HOME}" \
  && chown -R tomcat  "${TOMCAT_DATA}"

USER tomcat

VOLUME [$TOMCAT_DATA, $TOMCAT_CONF]

COPY "docker-entrypoint.sh" "/"
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
