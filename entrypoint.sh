#!/bin/bash
sleep 1

cd /home/container

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "Startowanie serwera..."

./run.sh

# Run the Server
${MODIFIED_STARTUP}
