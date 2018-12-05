#!/usr/bin/env bash

su -c '/etc/init.d/filebeat start' ${user}
su -c '/sbin/tini -- /usr/local/bin/jenkins.sh' ${user}
exec "$@"
