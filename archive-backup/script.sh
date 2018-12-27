#!/usr/bin/env sh

path=$1
mkdir -p $path/archive
cd $path && zip -r archive/world_$(date +%Y-%m-%d).zip world
