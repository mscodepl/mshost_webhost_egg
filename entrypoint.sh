#!/bin/bash
sleep 1

cd /home/container
rm -rf /home/container/tmp/*

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Run the Server
${MODIFIED_STARTUP}
