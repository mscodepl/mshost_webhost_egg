#!/bin/bash
sleep 1

cd /home/container

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"


rm -rf /home/container/tmp/*

echo "⟳  Uruchamianie PHP-FPM..."
/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "⟳  Uruchamianie Nginx..."
echo "✓  Serwer wystartował"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/

# Run the Server
${MODIFIED_STARTUP}
