#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker run -d -p 80:80 -p 443:443 -v /var/run/docker.sock:/tmp/docker.sock -it combro2k/nginx-proxy-pagespeed
docker exec -it $(docker ps -a -q) /bin/bash
~/plapela/runSystem.sh
~/port/runSystem.sh
