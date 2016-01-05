#!/bin/bash
#sudo apt-get update
#sudo apt-get install git
#sudo apt-get install docker
#sudo service docker start
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
#uname -r
#sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
#sudo nano /etc/apt/sources.list.d/docker.list
#sudo apt-get  update
#apt-cache policy docker-engine
#sudo apt-get install docker-engine
#git clone https://github.com/sinise/lapela.git


sudo apt-get install build-essential zlib1g-dev libpcre3 libpcre3-dev unzip dpkg-dev
NPS_VERSION=1.10.33.2
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip -O release-${NPS_VERSION}-beta.zip
unzip release-${NPS_VERSION}-beta.zip
cd ngx_pagespeed-release-${NPS_VERSION}-beta/
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
tar -xzvf ${NPS_VERSION}.tar.gz  # extracts to psol/

cd
# check http://nginx.org/en/download.html for the latest version
NGINX_VERSION=1.8.0
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar -xvzf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}/
./configure --pid-path=/usr/local/nginx/nginx.pid --with-http_ssl_module --add-module=$HOME/ngx_pagespeed-release-${NPS_VERSION}-beta ${PS_NGX_EXTRA_FLAGS}
make
sudo make install

