#!/usr/bin/env bash

# su -c 'whoami' - filebeat
# su -c '/etc/init.d/filebeat start' - filebeat
/etc/init.d/filebeat start

# exec bash -c /usr/local/bin/jenkins.sh
# exec /sbin/tini -- /usr/local/bin/jenkins.sh
#su -c /usr/local/bin/jenkins.sh ${user}
su -c '/sbin/tini -- /usr/local/bin/jenkins.sh' ${user}
exec "$@"
