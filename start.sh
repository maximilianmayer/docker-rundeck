#!/bin/sh


/usr/bin/java  -Djava.security.auth.login.config=/etc/rundeck/jaas-loginmodule.conf \
  -Dloginmodule.name=RDpropertyfilelogin -Drdeck.config=/etc/rundeck \
  -Drundeck.server.configDir=/etc/rundeck \
  -Dserver.datastore.path=/var/lib/rundeck/data/rundeck \
	-Drundeck.server.serverDir=/var/lib/rundeck \
	-Drdeck.projects=/var/lib/rundeck/projects \
	-Drdeck.runlogs=/var/lib/rundeck/logs \
	-Drundeck.config.location=/etc/rundeck/rundeck-config.properties \
	-Djava.io.tmpdir=/tmp/rundeck \
	-Drundeck.server.workDir=/tmp/rundeck \
	-Dserver.http.port=4440 \
	-Xmx2048m \
	-Xms256m \
	-XX:MaxMetaspaceSize=256m\
	-jar /opt/rundeck/bin/rundeck-launcher-2.10.0.jar \
	-c /etc/rundeck
#/usr/bin/java -XX:MaxPermSize=256m -Xmx1024m -jar /opt/rundeck/bin/rundeck-launcher-2.10.0.jar -c /etc/rundeck


## taken from current working config on workstation
#java -Djava.security.auth.login.config=/etc/rundeck/jaas-loginmodule.conf -Dloginmodule.name=RDpropertyfilelogin -Drdeck.config=/etc/rundeck -Drundeck.server.configDir=/etc/rundeck -Dserver.datastore.path=/var/lib/rundeck/data/rundeck -Drundeck.server.serverDir=/var/lib/rundeck -Drdeck.projects=/var/lib/rundeck/projects -Drdeck.runlogs=/var/lib/rundeck/logs -Drundeck.config.location=/etc/rundeck/rundeck-config.properties -Djava.io.tmpdir=/tmp/rundeck -Drundeck.server.workDir=/tmp/rundeck -Dserver.http.port=4440 -Xmx2048m -Xms256m -XX:MaxMetaspaceSize=256m -server -cp /var/lib/rundeck/bootstrap/jetty-io-9.0.7.v20131107.jar:/var/lib/rundeck/bootstrap/jetty-security-9.0.7.v20131107.jar:/var/lib/rundeck/bootstrap/jetty-server-9.0.7.v20131107.jar:/var/lib/rundeck/bootstrap/javax.servlet-3.0.0.v201112011016.jar:/var/lib/rundeck/bootstrap/not-yet-commons-ssl-0.3.17.jar:/var/lib/rundeck/bootstrap/jna-3.2.2.jar:/var/lib/rundeck/bootstrap/rundeck-jetty-server-2.9.3.jar:/var/lib/rundeck/bootstrap/log4j-1.2.16.jar:/var/lib/rundeck/bootstrap/jetty-all-9.0.7.v20131107.jar:/var/lib/rundeck/bootstrap/libpam4j-1.5.jar:/var/lib/rundeck/bootstrap/jetty-util-9.0.7.v20131107.jar:/var/lib/rundeck/bootstrap/jetty-jaas-9.0.7.v20131107.jar:/var/lib/rundeck/bootstrap/jetty-http-9.0.7.v20131107.jar com.dtolabs.rundeck.RunServer /var/lib/rundeck

