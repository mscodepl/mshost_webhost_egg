#!/bin/bash

# Delay to ensure any needed services are up
sleep 1

# Navigate to the container home directory
cd /home/container

# Clean up the tmp directory to prevent using stale data
echo "Cleaning /home/container/tmp/ directory..."
rm -rf /home/container/tmp/*

# Replace Startup Variables
MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))

echo "⟳ Starting services..."

# Starting PHP-FPM
/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

# Starting Nginx
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/

# Execute the modified startup command
echo "Executing server startup command..."
${MODIFIED_STARTUP}
