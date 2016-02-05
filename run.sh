#!/bin/bash
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)
docker run --name nginx -d -p 80:80 -p 443:443 -v /var/run/docker.sock:/tmp/docker.sock -it combro2k/nginx-proxy-pagespeed
~/plapela/runSystem.sh
~/kiggit/newParser/runSystem.sh -nginx
#~/port/runSystem.sh
#~/st/run.sh

#wait for containers to start.
sleep 15
docker exec -it nginx sed -i '/.*gzip_types.*/c\gzip_types text/plain text/css text/x-component text/xml application/xml application/xhtml+xml application/json image/x-icon image/bmp image/svg+xml application/atom+xml text/javascript application/javascript application/x-javascript application/pdf application/postscript application/rtf application/msword application/vnd.ms-powerpoint application/vnd.ms-excel application/vnd.ms-fontobject application/vnd.wap.wml application/x-font-ttf application/x-font-opentype;' /data/config/proxy.conf
docker exec -it nginx nginx -s reload
#docker exec -it nginx /bin/bash
