#!/bin/bash bash

set -e

sudo apt-get update && sudo apt-get install docker.io -y
git clone https://github.com/omniedgeio/docker-customize-supernode.git
cd docker-customize-supernode
sudo docker build -t docker-customize-supernode .
sudo docker run -d -p 443:443/udp docker-customize-supernode
sudo ufw allow 443
