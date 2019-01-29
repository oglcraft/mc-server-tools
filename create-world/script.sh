#!/usr/bin/env sh

# parameters
path=$1
world=$(basename $path)
version=$2
port=$3

if [ "$world" = "" ] ; then \
  echo "World required" && \
  exit 1 \
; fi

# defaults
if [ "$version" = "" ] ; then \
  version=latest \
; fi

if [ "$port" == "" ] ; then \
  port=25565 \
; fi

# check if the world is running/exists
running=$(docker ps -f=name=$world | awk 'NR>1 {print $NF}')
exists=$(docker ps -a -f=name=$world | awk 'NR>1 {print $NF}')

if [ "$running" = "$world" ] ; then \
  echo Stopping $world... && \
  docker stop $world \
; fi

if [ "$exists" = "$world" ] ; then \
  echo Removing $world... && \
  docker rm $world \
; fi

echo Starting $world...

# create new container
docker run -dt \
  -p $port:25565 \
  -v $path:/data \
  --name=$world \
  --restart=unless-stopped \
  oglcraft/minecraft-server:$version \
  -Xms2G -Xmx4G

