FROM alpine:3.5
RUN apk add --update openssh-client sshpass && rm -rf /var/cache/apk/*
COPY start.sh .
CMD /bin/sh start.sh
