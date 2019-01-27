#!/usr/bin/env sh

# parameters
version=$1
snapshot=$2

# defaults
latest=false
label=latest
type=release
name='oglcraft/minecraft-server'

if [ "$snapshot" = true ] ; then \
  label=snapshot \
  type=snapshot \
; fi

# check versions in current Docker images
images=$(docker images -f=reference=$name:$version | awk 'NR>1')

# if image exists, marke build as unstable
if [ "$images" != "" ] ; then \
  echo "A Docker image for $version already exists." && \
  exit 2 \
; fi

# find current labeled version
id=$(docker images -f=reference=$name:$label | awk 'NR>1 {print $3}')

if [ "$id" != "" ] ; then \
  current=$(docker images | grep $id | awk '{print $2}' | head -n1) \
; fi

# compare versions
least=$(echo -e "$current\\n$version" | sort | head -n1)


# if building newer version, mark latest
if [ "$current" = "$least" ] ; then \
  latest=true \
; fi

echo $id $current $least $latest

# build the image
args="--build-arg version=$version --build-arg type=$type"
args="$args -t $name:$version"

if [ "$latest" = "true" ] ; then \
  args="$args -t $name:$label" \
; fi

docker build --rm https://github.com/$name.git $args
docker image prune -f
