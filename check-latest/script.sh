#!/usr/bin/env sh

# parameters
type=$1

# LauncherMeta
url='https://launchermeta.mojang.com/mc/game/version_manifest.json'

# get the latest version from LauncherMeta
echo $(curl -s $url | jq -r ".latest.$type")
