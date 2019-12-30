FROM tiredofit/alpine:3.11
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Environment Variables
    ENV ENABLE_CRON=false \
        ENABLE_SMTP=false

### Dependencies
    RUN set -x && \
        apk update && \
        apk add \
            python2 \
            py2-pip \
            && \
        \
        pip install \
            cloudflare \
            docker \
            && \
        \
### Cleanup
        rm -rf /root/.cache && \
        rm -rf /var/cache/apk/*

### Add Files
    ADD install /
