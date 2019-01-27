#!/bin/bash -x

volumes="$volumes
/etc/localtime:/etc/localtime:ro
/etc/timezone:/etc/timezone:ro"

vargs=''
for volume in $volumes
do
	vargs=$vargs' -v '$volume 
done

id=$(docker build -q $url)
docker run --rm $vargs $id $args > build.result
