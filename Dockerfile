ARG DISTRO="alpine"
ARG DISTRO_VARIANT="3.17"

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    CONTAINER_ENABLE_SCHEDULING=FALSE \
    IMAGE_NAME="tiredofit/traefik-cloudflare-companion" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-traefik-cloudflare-companion/"

RUN source /assets/functions/00-container && \
    set -x && \
    addgroup -S -g 10000 tcc && \
    adduser -D -S -s /sbin/nologin \
            -h /dev/null \
            -G tcc \
            -g "tcc" \
            -u 10000 tcc \
            && \
    \
    package update && \
    package upgrade && \
    package install .tcc-build-deps \
                cargo \
                gcc \
                libffi-dev \
                musl-dev \
                openssl-dev \
                py-pip \
                py3-setuptools \
                py3-wheel \
                python3-dev \
                && \
    \
    package install .tcc-run-deps \
                docker-py \
                py3-beautifulsoup4 \
                py3-certifi \
                py3-chardet \
                py3-idna \
                py3-openssl \
                py3-packaging \
                py3-requests \
                py3-soupsieve \
                py3-urllib3 \
                py3-websocket-client \
                py3-yaml \
                python3 \
                && \
    \
    pip install \
            cloudflare \
            get-docker-secret \
            requests \
            && \
    \
    package remove .tcc-build-deps && \
    package cleanup && \
    rm -rf /root/.cache \
           /root/.cargo

COPY install /
