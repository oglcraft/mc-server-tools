# A utility for checking for the latest Minecraft server version
FROM alpine

MAINTAINER Jesse Pritchett <jesse.h.pritchett@gmail.com>

RUN apk --no-cache add curl jq

ADD *.sh .

ENTRYPOINT [ "sh", "./script.sh" ]
