# A utilizity for backing up a Minecraft server into an archive directory
FROM alpine

MAINTAINER Jesse Pritchett <jesse.h.pritchett@gmail.com>

RUN apk --no-cache add zip

ADD *.sh .

ENTRYPOINT [ "sh", "./script.sh" ]
