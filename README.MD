# Customize supernode server

OmniEdge offers customize supernode, You can setup your own Supernode server to increase security and speed for your Virtual Network, here you can setup a supernode server with docker.

![](Setup-Customize-Supernode-1080p.gif)

## Clone the repo

``` bash
git clone https://github.com/omniedgeio/docker-customize-supernode.git
cd docker-customize-supernode
```

## Build Supernode

```
docker build -t docker-customize-supernode .
```

## Run Supernode

```
docker run -d -p 5565:5565/udp docker-customize-supernode
```

## Setting in the Omniedge Dashboard

Login in your OmniEdge account, and setting in the dashboard.

![](Customizesupernode.png)



------
