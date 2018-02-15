# Dockerfile for rundeck
# https://github.com/

FROM openjdk:8-jre-alpine

LABEL maintainer="Maximilian Mayer <mayer.maximilian@gmail.com>"
LABEL version="2.10.6"

ENV SERVER_URL=https://localhost:4443 \
    RUNDECK_STORAGE_PROVIDER=file \
    RUNDECK_PROJECT_STORAGE_TYPE=file \
    NO_LOCAL_MYSQL=false \
    LOGIN_MODULE=RDpropertyfilelogin \
    JAAS_CONF_FILE=jaas-loginmodule.conf \
    KEYSTORE_PASS=adminadmin \
    TRUSTSTORE_PASS=adminadmin

RUN apk update --no-cache && \
		apk add --no-cache curl && \
		mkdir -p /opt/rundeck/bin

RUN curl -sLo /opt/rundeck/bin/rundeck-launcher.jar http://download.rundeck.org/jar/rundeck-launcher-2.10.6.jar && \
		curl -sLo /opt/rundeck/bin/rundeck-cli.jar https://github.com/rundeck/rundeck-cli/releases/download/v1.0.22/rundeck-cli-1.0.22-all.jar

COPY content/ /

ADD ./start.sh .

EXPOSE 4440 4443

VOLUME  ["/etc/rundeck", "/var/rundeck", "/var/lib/rundeck", "/var/lib/mysql", "/var/log/rundeck", "/opt/rundeck-plugins"]

ENTRYPOINT ./start.sh
