#!/bin/bash

sudo docker run -d -p 8081:8081 -p 8443:8443 --name grant-nexus3 grant/nexus3

sleep 5

ID=$(sudo docker ps -f "name=grant-nexus" -q)

sudo docker exec -u 0 -it $ID sh /install-scripts/enable-ssl.sh

sudo docker stop $ID

sudo docker start $ID
