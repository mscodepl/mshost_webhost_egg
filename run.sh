#!/bin/ash

rm -rf /home/container/tmp/*

/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "✓ Serwer wystartował"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/
