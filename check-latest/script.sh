#!/usr/bin/env sh

# parameters
type=$1

if [ "$1" == "" ] ; then \
  type=release \
; fi

# LauncherMeta
url='https://launchermeta.mojang.com/mc/game/version_manifest.json'

# get the latest version from LauncherMeta
version=$(curl -s $url | jq -r ".latest.$type")

echo version=$version > version.properties
pwd
ls -la
