#!/bin/bash
sleep 1

cd /home/container
rm -rf /home/container/tmp/*

PRE_STARTUP_COMMANDS="/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize && /usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/"

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

MODIFIED_STARTUP="${PRE_STARTUP_COMMANDS} && ${MODIFIED_STARTUP}"

echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
