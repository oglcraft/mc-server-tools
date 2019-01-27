#!/usr/bin/env sh

# LauncherMeta
url='https://launchermeta.mojang.com/mc/game/version_manifest.json'

# get the latest version from LauncherMeta
echo $(curl -s $url | jq -r '.latest.snapshot')
