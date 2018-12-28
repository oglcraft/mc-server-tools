# archive-restore
# A utility for restoring a Minecraft server from an archive directory
FROM alpine

MAINTAINER Jesse Pritchett <jesse.h.pritchett@gmail.com>

RUN apk --no-cache add unzip

ADD *.sh .

ENTRYPOINT [ "sh", "./script.sh" ]
