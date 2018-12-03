FROM jenkins/jenkins:2.107.2

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh  < /usr/share/jenkins/ref/plugins.txt
COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/
ENV HOME $JENKINS_HOME

USER root

RUN groupadd -g 999 docker \
 && usermod -aG 999 jenkins

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
 && apt-get update \
 && apt-get install -y --no-install-recommends graphviz nodejs \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
 && echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list \
 && apt-get update \
 && apt-get install -y filebeat # ca-certificates locales \
 && rm -rf /var/lib/apt/lists/* \
 && update-rc.d filebeat defaults 95 10

COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml

COPY ["entrypoint.sh", "/"]
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]
CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

USER ${user}
