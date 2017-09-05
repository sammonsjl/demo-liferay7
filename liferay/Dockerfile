FROM mdelapenya/jdk:8-openjdk
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && useradd -ms /bin/bash liferay

ENV LIFERAY_HOME=/opt/liferay
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-8.0.32
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/7.0.3%20GA4/liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip/download

WORKDIR /opt

RUN set -x \
			&& curl -fSL "$LIFERAY_TOMCAT_URL" -o liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip \
			&& unzip liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip \
			&& rm liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip \
      && mv liferay-ce-portal-7.0-ga4 liferay \
      && mkdir -p $LIFERAY_HOME/shared/liferay

COPY config/portal-ext.properties $LIFERAY_HOME
COPY config/osgi/ $LIFERAY_HOME/osgi/configs/
COPY config/setenv.sh $CATALINA_HOME/bin
COPY deploy/ $LIFERAY_HOME/deploy/

RUN chown -R liferay:liferay /opt

USER root

EXPOSE 8080/tcp
EXPOSE 11311/tcp

ENTRYPOINT ["catalina.sh", "run"]