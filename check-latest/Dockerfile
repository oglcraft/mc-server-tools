# A utility for backing up a Minecraft server into an archive directory
FROM alpine

MAINTAINER Jesse Pritchett <jesse.h.pritchett@gmail.com>

RUN apk --no-cache add curl jq

WORKDIR /root
ADD *.sh /root

ENTRYPOINT [ "sh", "./script.sh" ]
