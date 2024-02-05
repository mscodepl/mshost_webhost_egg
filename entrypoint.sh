#!/bin/bash
sleep 1

cd /home/container
rm -rf /home/container/tmp/*

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Run the Server
${MODIFIED_STARTUP}

/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/
