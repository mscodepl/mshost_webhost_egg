#!/bin/bash
sleep 1

cd /home/container

# Usuń tymczasowe pliki
CLEANUP_COMMANDS="rm -rf /home/container/tmp/*"

# Start PHP-FPM i Nginx przed pozostałymi komendami
PRE_STARTUP_COMMANDS="/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize && /usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/"

# Replace Startup Variables
MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))

# Dodaj komendy CLEANUP i PRE_STARTUP na początku MODIFIED_STARTUP
MODIFIED_STARTUP="${CLEANUP_COMMANDS} && ${PRE_STARTUP_COMMANDS} && ${MODIFIED_STARTUP}"

echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
