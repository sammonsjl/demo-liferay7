FROM mdelapenya/liferay-portal:7-ce-ga4-tomcat-hsql

USER root

FROM mdelapenya/jdk:8-openjdk
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && useradd -ms /bin/bash liferay

ENV LIFERAY_HOME=/usr/local/liferay-ce-portal-7.0-ga4
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-8.0.32
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/7.0.3%20GA4/liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip/download

WORKDIR /usr/local

RUN mkdir -p "$LIFERAY_HOME" \
    && set -x \
    && curl -fSL "$LIFERAY_TOMCAT_URL" -o liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip \
    && unzip liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip \
    && rm liferay-ce-portal-tomcat-7.0-ga4-20170613175008905.zip \
    && mkdir -p /wedeploy-data/liferay/cluster01/node01 \
    && mkdir -p $LIFERAY_HOME/osgi/war \
    && cp -Rv $LIFERAY_HOME/osgi /wedeploy-data/liferay/cluster01/node01

COPY configs/portal-ext.properties $LIFERAY_HOME
COPY configs/osgi/ /wedeploy-data/liferay/cluster01/node01/osgi/configs/
COPY configs/setenv.sh $CATALINA_HOME/bin
COPY deploy/ $LIFERAY_HOME/deploy/

RUN chown -R liferay:liferay $LIFERAY_HOME \
    && chown -R liferay:liferay /wedeploy-data/liferay

EXPOSE 8080/tcp
EXPOSE 11311/tcp

ENTRYPOINT ["catalina.sh", "run"]