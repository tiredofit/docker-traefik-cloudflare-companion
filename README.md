# hub.docker.com/r/tiredofit/traefik-cloudflare-companion

[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/traefik-cloudflare-companion.svg)](https://hub.docker.com/r/tiredofit/traefik-cloudflare-companion)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/traefik-cloudflare-companion.svg)](https://hub.docker.com/r/tiredofit/traefik-cloudflare-companion)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/traefik-cloudflare-companion.svg)](https://microbadger.com/images/tiredofit/traefik-cloudflare-companion)

## Introduction

Dockerfile to build a Container to automatically update Cloudflare DNS records upon container start. A time saver if you are regularly moving containers around to different systems. This will allow you to set multiple zone's you wish to update.

* This Container uses a [customized Alpine Linux base](https://hub.docker.com/r/tiredofit/alpine) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) compiled for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, nano, vim) for easier management. It also supports sending to external SMTP servers..


[Changelog](CHANGELOG.md)

## Authors

- [Dave Conroy](http://github/tiredofit/)

## Table of Contents

- [Introduction](#introduction)
- [Authors](#authors)
- [Table of Contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Volumes](#volumes)
  - [Environment Variables](#environment-variables)
  - [Docker Secrets](#docker-secrets)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [References](#references)

## Prerequisites

This image assumes that you are using a reverse proxy such as [tiredofit/traefik](https://github.com/tiredofit/docker-traefik)

## Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/traefik-cloudflare-companion) and is the recommended method of installation.


```bash
docker pull tiredofit/traefik-cloudflare-companion:(imagetag)
```
* `latest` - Most recent release w/Python 3 and Alpine 3.12

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.

Upon startup the image looks for a label containing `traefik.frontend.rule` (version 1) or `Host*` (version2) from your running containers of either updates Cloudflare with a CNAME record of your `TARGET_DOMAIN`. Previous versions of this container used to only update one Zone, however with the additional of the `DOMAIN` environment variables it now parses the containers variables and updates the appropriate zone.

For those wishing to assign multiple CNAMEs to a container use the following format:

- Traefik 1.x
````bash
  - traefik.normal.frontend.rule=Host:example1.domain.tld,example2.domain.tld
````

- Traefik 2.x
````bash
  - traefik.http.routers.example.rule=Host(`example1.domain.tld`, `example2.domain.tld`)
````
or
````bash
  - traefik.http.routers.example.rule=Host(`example1.domain.tld`) || Host(`example2.domain.tld`)
````

## Configuration
### Volumes
| File                   | Description                                                              |
| ---------------------- | ------------------------------------------------------------------------ |
| `/var/run/docker.sock` | You must have access to the docker socket in order to utilize this image |

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), below is the complete list of available options that can be used to customize your installation. By Default Cron and SMTP are disabled.

| Parameter           | Description                                                                             | Default                      |
| ------------------- | --------------------------------------------------------------------------------------- | ---------------------------- |
| `TRAEFIK_VERSION`   | What version of Traefik do you want to work against - `1` or `2`                        | `2`                          |
| `DOCKER_ENTRYPOINT` | Docker Entrypoint default (local mode)                                                  | `unix://var/run/docker.sock` |
| `DOCKER_HOST`       | (optional) If using tcp connection e.g. `tcp://111.222.111.32:2376`                     |                              |
| `DOCKER_CERT_PATH`  | (optional) If using tcp connection with TLS - Certificate location e.g. `/docker-certs` |                              |
| `DOCKER_TLS_VERIFY` | (optional) If using tcp conneciton to socket Verify TLS                                 | `1`                          |
| `REFRESH_ENTRIES`   | If record exists, update entry with new values `TRUE` or `FALSE`                        | `TRUE`                       |
| `SWARM_MODE`        | Enable Docker Swarm Mode `TRUE` or `FALSE`                                              | `FALSE`                      |
| `CF_EMAIL`          | Email address tied to Cloudflare Account - Leave Blank  for Scoped API                  |                              |
| `CF_TOKEN`          | API Token for the Domain                                                                |                              |
| `DEFAULT_TTL`       | TTL to apply to records                                                                 | `1`                          |
| `TARGET_DOMAIN`     | Destination Host to forward records to e.g. `host.example.com`                          |                              |
| `DOMAIN1`           | Domain 1 you wish to update records for.                                                |                              |
| `DOMAIN1_ZONE_ID`   | Domain 1 Zone ID from Cloudflare                                                        |                              |
| `DOMAIN1_PROXIED`   | Domain 1 True or False if proxied                                                       |                              |
| `DOMAIN1_TARGET_DOMAIN` | (optional specify target_domain for Domain 1, overriding the default value from TARGET_DOMAIN)                                          |                              |
| `DOMAIN1_EXCLUDED_SUB_DOMAINS` | (optional specify sub domain trees to be ignored in lables) ex: `DOMAIN1_EXCLUDED_SUB_DOMAINS=int` would not create a CNAME for `*.int.example.com` | |
| `DOMAIN2`           | (optional Domain 2 you wish to update records for.)                                     |                              |
| `DOMAIN2_ZONE_ID`   | Domain 2 Zone ID from Cloudflare                                                        |                              |
| `DOMAIN2_PROXIED`   | Domain 2 True or False if proxied                                                       |                              |
| `DOMAIN2_TARGET_DOMAIN`   | (optional specify target_domain for Domain 2, overriding the default value from TARGET_DOMAIN)                                     |                              |
| `DOMAIN2_EXCLUDED_SUB_DOMAINS` | (optional specify sub domain trees to be ignored in lables) ex: `DOMAIN2_EXCLUDED_SUB_DOMAINS=int` would not create a CNAME for `*.int.example2.com` | |
| `DOMAIN3....`       | And so on..                                                                             |                              |

### Docker Secrets

`CF_EMAIL` and `CF_TOKEN` support Docker Secrets.
Name your secrets either CF_EMAIL and CF_TOKEN or cf_email and cf_token. 

## Maintenance
### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is e.g. traefik-cloudflare-companion) bash
```

## References

* https://www.cloudflare.com
* https://github.com/tiredofit/docker-traefik-cloudflare-companion
* https://github.com/code5-lab/dns-flare
