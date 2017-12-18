# Dockerfile for rundeck
# https://github.com/

FROM alpine:3.6

LABEL maintainer="Maximilian Mayer <mayer.maximilian@gmail.com>"

ENV SERVER_URL=https://localhost:4443 \
    RUNDECK_STORAGE_PROVIDER=file \
    RUNDECK_PROJECT_STORAGE_TYPE=file \
    NO_LOCAL_MYSQL=false \
    LOGIN_MODULE=RDpropertyfilelogin \
    JAAS_CONF_FILE=jaas-loginmodule.conf \
    KEYSTORE_PASS=adminadmin \
    TRUSTSTORE_PASS=adminadmin

RUN apk update --no-cache && \
		apk add --no-cache openjdk8-jre curl && \
		mkdir -p /opt/rundeck/bin

RUN curl -sLo /opt/rundeck/bin/rundeck-launcher-2.10.0.jar http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-2.10.0.jar && \
		curl -sLo /opt/rundeck/bin/rundeck-cli-1.0.21.jar https://github.com/rundeck/rundeck-cli/releases/download/v1.0.21/rundeck-cli-1.0.21-all.jar

#    chown rundeck:rundeck /var/lib/rundeck/.ssh && \
#    sed -i "s/export RDECK_JVM=\"/export RDECK_JVM=\"\${RDECK_JVM} /" /etc/rundeck/profile && \
#    curl -Lo /var/lib/rundeck/libext/rundeck-slack-incoming-webhook-plugin-0.6.jar https://github.com/higanworks/rundeck-slack-incoming-webhook-plugin/releases/download/v0.6.dev/rundeck-slack-incoming-webhook-plugin-0.6.jar && \
#    echo 'd23b31ec4791dff1a7051f1f012725f20a1e3e9f85f64a874115e46df77e00b5  rundeck-slack-incoming-webhook-plugin-0.6.jar' > /tmp/rundeck-slack-plugin.sig && \
#    cd /var/lib/rundeck/libext/ && \
#    shasum -a256 -c /tmp/rundeck-slack-plugin.sig && \
#    cd - && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*
#
ADD content/ /
RUN chmod u+x /opt/run && \
    mkdir -p /var/log/supervisor && mkdir -p /opt/supervisor && \
    chmod u+x /opt/supervisor/rundeck && chmod u+x /opt/supervisor/mysql_supervisor

ADD ./start.sh .

EXPOSE 4440 4443

VOLUME  ["/etc/rundeck", "/var/rundeck", "/var/lib/rundeck", "/var/lib/mysql", "/var/log/rundeck", "/opt/rundeck-plugins", "/var/lib/rundeck/logs", "/var/lib/rundeck/var/storage"]
# run as rundeck user
#USER rundeck

#ENTRYPOINT ["/usr/bin/java"]
ENTRYPOINT ./start.sh
#CMD ["-XX:MaxPermSize=256m", "-Xmx1024m", "-jar", "/opt/rundeck/bin/rundeck-launcher-2.10.0.jar", "-c" , "/etc/rundeck"]
