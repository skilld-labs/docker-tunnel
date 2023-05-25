FROM alpine:3.18
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="docker-tunnel" \
  org.label-schema.description="SSH-tunnel image" \
  org.label-schema.vcs-url="https://github.com/skilld-labs/docker-tunnel"

RUN apk add --no-cache openssh-client sshpass
COPY start.sh /usr/bin/start.sh
CMD ["/usr/bin/start.sh"]
