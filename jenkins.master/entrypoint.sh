#!/usr/bin/env bash
/sbin/tini -s -- /etc/init.d/filebeat start
/sbin/tini -s -- /usr/local/bin/jenkins.sh
exec "$@"