# A utility for backing up a Minecraft server into an archive directory
FROM alpine

MAINTAINER Jesse Pritchett <jesse.h.pritchett@gmail.com>

RUN apk --no-cache add curl jq

ADD *.sh /
VOLUME /root
WORKDIR /root

ENTRYPOINT [ "sh", "/script.sh" ]
