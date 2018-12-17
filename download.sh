!/usr/bin/env bash

#clean anything with same name to get rid of clashes
# docker-compose down
#
# docker pull jenkins/jenkins:2.107.2
#
if [ ! -d .tmpdir/downloads ]; then
  mkdir .tmpdir/downloads
fi
pushd ${PWD}
cd .tmpdir/downloads
#   curl -o jdk-8u131-linux-x64.tar.gz http://ftp.osuosl.org/pub/funtoo/distfiles/oracle-java/jdk-8u131-linux-x64.tar.gz
curl -o apache-maven-3.6.0-bin.tar.gz https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
curl -o apache-maven-3.6.0-bin.tar.gz.sha512 https://www.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz.sha512
#curl -o apache-maven-3.6.0-bin.tar.gz.asc https://www.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz.asc
if [[ "OK" != $(sha512sum -c apache-maven-3.6.0-bin.tar.gz.sha512 | grep -m 1 -o "OK") ]]; then echo "Error on checking sha512sum -c apache-maven-3.6.0-bin.tar.gz.sha512"; exit 1; fi;
popd