FROM tiredofit/alpine:3.12
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Environment Variables
ENV ENABLE_CRON=false \
    ENABLE_SMTP=false

### Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add \
    python3 \
    python3-dev \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    && \
    \
    curl https://bootstrap.pypa.io/get-pip.py | python3 - && \
    pip install \
            cloudflare \
            get-docker-secret \
            docker[tls] \
            && \
    \
### Cleanup
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/*

### Add Files
ADD install /
