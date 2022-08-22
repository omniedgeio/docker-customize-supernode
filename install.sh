#!/bin/bash bash

set -e

sudo apt-get update && sudo apt-get install docker.io -y
git clone https://github.com/omniedgeio/docker-customize-supernode.git
cd docker-customize-supernode
PS3='Please enter your choice: '
options=("2.6-stable-omni" "3.0-stable" "Quit")
select VERSION in "${options[@]}"
do
    case $VERSION in
        "2.6-stable-omni")
            VERSION="2.6-stable-omni"
            echo ${VERSION}
            break
            ;;
        "3.0-stable")
            VERSION="3.0-stable"
            echo ${VERSION}
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
echo $VERSION
sudo docker build  --build-arg VERSION=$VERSION -t docker-customize-supernode-$VERSION .
sudo docker run -d -p 7787:7787/udp docker-customize-supernode-$VERSION
sudo ufw allow 7787
