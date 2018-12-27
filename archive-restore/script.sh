#!/usr/bin/env sh

path=$1
mv $path/world $path/world~
latest=$(ls $path/archive -t | awk '{printf("'$path'/archive/%s",$0);exit}')

if [ "$latest" != "" ] ; then unzip $latest -d $path; fi
