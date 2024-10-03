## 7.3.2 2024-10-03 <dave at tiredofit dot ca>

   ### Changed
      - Fix invalid escape sequence errors #107 - Credit juchong@github
      - Pin to tiredofit/alpine:3.20-7.10.15


## 7.3.1 2024-06-24 <dave at tiredofit dot ca>

   ### Changed
      - Fix for 7.3.0 release


## 7.3.0 2024-06-24 <dave at tiredofit dot ca>

   ### Added
      - Add ability to add comments to records upon creation - Thanks to LelouBil


## 7.2.4 2024-06-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.20 base
      - Python 3.12

   ### Changed
      - Force integer type to be integers as opposed to string to solve Cloudflare strict type API rejections - (#103) - Thanks @appiekap653


## 7.2.3 2024-04-12 <dave at tiredofit dot ca>

   ### Changed
      - Pin Cloudflare dependency to 2.19.* due to imminent 3.x release


## 7.2.2 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Break system packages with python


## 7.2.1 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Change base image to tiredofit/alpine:3.19


## 7.2.0 2023-11-22 <rezytijo@github>

   ### Added
      - Add RC_TYPE support - Choose whether CNAMES,A,or AAAA records are created


## 7.1.1 2023-05-10 <dave at tiredofit dot ca>

   ### Changed
      - Alpine 3.18 base


## 7.1.0 2023-04-13 <dave at tiredofit dot ca>

   ### Added
      - Add TRAEFIK_FILTER and TRAEFIK_FILTER_LABEL variables to allow setting a label and a value to trigger Cloudflare companion to take action. Useful for running multiple Traefik instances and Cloudflare Companion instances on the same host/cluster


## 7.0.4 2023-03-18 <dave at tiredofit dot ca>

   ### Added
      - Set CONTAINER_PROCESS_RUNAWAY_PROTECTOR=FALSE


## 7.0.3 2023-03-07 <fenaren@github>

   ### Added
      - Add support for NOT using Docker entirely relying on Traefik API with ENABLE_DOCKER_POLL flag


## 7.0.2 2023-01-10 <dave at tiredofit dot ca>

   ### Changed
      - Handle Ctrl C better
      - Exit if Docker Errors during while loop


## 7.0.1 2023-01-10 <dave at tiredofit dot ca>

   ### Changed
      - Introduce a while loop to poll for events endlessly without restarting script after a socket timeout if using HTTP connections


## 7.0.0 2023-01-06 <dave at tiredofit dot ca>

This release changes some environment variable names to more explicit variables for this image as opposed to piggybacking off of base image variables. Please review changelog accordingly and make necessary changes by following the variables in the README

   ### Added
      - [logging] Added Timestamps for Logging. LOG_LEVEL=DEBUG also provides line number of script for troubleshooting
      - [logging] Add LOG_TYPE (CONSOLE,FILE,BOTH) options for better logging. FILE and BOTH also include log rotation
      - [runtime] Ability to run as non root - User available is `tcc` by setting environment variable 'TCC_USER' - Will check if it can access Docker Socket and fail if not

   ### Changed
      - Environment variable SWARM_MODE changes to DOCKER_SWARM_MODE
      - CONTAINER_LOG_LEVEL changes to LOG_LEVEL
      - Switch to using packaged Docker python module instead of building ourselves


## 6.10.0 2022-12-14 <dave at tiredofit dot ca>

   ### Added
      - Add _FILE environment variables for secrets. Credit to DennisGaida@github for doing the work.


## 6.9.3 2022-12-01 <dave at tiredofit dot ca>

   ### Changed
      - Rework Dockerfile


## 6.9.2 2022-11-23 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.17 base


## 6.9.1 2022-10-27 <dave at tiredofit dot ca>

   ### Added
      - Add py3-packaging module into run dependencies (#80)


## 6.9.0 2022-10-26 <dave at tiredofit dot ca>

   ### Added
      - Allow SWARM_MODE to work with a daemon proxy. Credit to mistressmeeple@github
      - Add support for defaultRule to pull from Traefik as opposed to just labels. Credit to mistressmeeple@github


## 6.8.5 2022-05-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.16 base


## 6.8.4 2022-05-24 <cford1080@github>

   ### Changed
      - Fix bug affecting multiple excluded domains


## 6.8.3 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Rework to support new base image


## 6.8.2 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Refresh base image


## 6.8.1 2021-12-13 <dave at tiredofit dot ca>

   ### Changed
      - Drop Arm v7 version temporarily related to: https://github.com/pyca/cryptography/issues/6673


## 6.8.0 2021-12-13 <kadaan at github>

   ### Added
      - Support Dynamic Configuration / External Services
      - Dry Run Support

   ### Changed
      - Optimized Matching rules

## 6.7.0 2021-11-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.15 base


## 6.6.2 2021-08-09 <dave at tiredofit dot ca>

   ### Changed
      - Re enable cron for log rotation


## 6.6.1 2021-07-25 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.14 Base


## 6.6.0 2021-05-02 <dave at tiredofit dot ca>

   ### Changed
      - Add Rust during build step to compile python-cryptography


## 6.5.1 2021-01-14 <zombielinux@github>

   ### Fixed
      - Regex parsing for domains with hyphens
 

## 6.5.0 2021-02-22 <jackkellog@github>

   ### Added
      - Ability to exclude subdomains 
      - Added verbose logging level for cloudflare

## 6.4.0 2021-01-14 <dave at tiredofit dot ca>

   ### Changed
      - Alpine 3.13 Base         


## 6.3.2 2020-11-03 <james9909@github>

   ### Changed
      - Fix regex to allow matching for domains with dashes (-) in them

## 6.3.1 2020-10-16 <mbjurstrom@github>

   ### Changed
      - Fix for Debug mode always staying on
      - Fix logger error when checking services under Traefik 2

## 6.3.0 2020-10-06 <dchidell@github + mbjurstrom@github>

   ### Added
      - Support Alternate Syntax for Traefik 2 Hosts Host (host1,host2,host3)


## 6.2.2 2020-10-06 <dave at tiredofit dot ca>

   ### Added
      - Switch to Python3 Packages
      - Cleanup Image for 66% reduction in size


## 6.2.1 2020-10-06 <mbjurstrom@github>

   ### Changed
      - Fix for wrong variable when logging when checking container with Traefik 2

## 6.2.0 2020-10-06 <mbjurstrom@github>

   ### Added
      - Ability to set a custom target domain per entry, or simply rely on default
   
   ### Changed
      - Allow lowercase docker secrets
      - Changed logging to use pythons internal logging mechanism


## 6.1.3 2020-10-01 <drevantonder@github>

   ### Changed
      - Reverted back to looking up swarm information per service not container - Swarm mode should finally be working now

## 6.1.2 2020-09-01 <dave at tiredofit dot ca>

   ### Changed
      - Stop calling Docker Low Level API if SWARM_MODE=FALSE


## 6.1.1 2020-08-29 <dave at tiredofit dot ca>

   ### Changed
      - Case Insensitivity environment variables fix

## 6.1.0 2020-08-28 <dave at tiredofit dot ca>

   ### Added
      - Swarm Mode detection for 'update' events
      - Case insensitive variables for SWARM_MODE, REFRESH_ENTRIES
      - Lots more verbosity with CONTAINER_LOG_LEVEL=DEBUG

   ### Changed
      - Reworked Swarm Support

## 6.0.2 2020-08-27 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Scoped Tokens sendind "None" as email


## 6.0.1 2020-08-25 <dave at tiredofit dot ca>

   ### Changed
      - Fix for calling right function when Swarm activated


## 6.0.0 2020-08-24 <dave at tiredofit dot ca>

   ### Added
      - Pure Python3 implementation
      - Support more than 10 Domains
      - Debug Mode - Set CONTAINER_LOG_LEVEL=DEBUG to see whats going wrong and a tonne of verbosity

   ### Changed
      - TRAEFIK_VERSION set to `2` by default


## 5.0.0 2020-08-21 <dave at tiredofit dot ca>

   ### Added
      - Support global or scoped API mode (API_MODE=GLOBAL/SCOPED) (inital credit: blinkiz@github)
      - Support Refreshing Entries (inital credit: dchidell@github)
      - Support Docker Swarm Mode
      - Support Docker Secrets


## 4.2.1 2020-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Fix multi hostname rule values for Traefik 2


## 4.2.0 2020-07-02 <dave at tiredofit dot ca>

   ### Added
      - Support HostSNI entries
      - Alpine 3.12 base


## 4.1.0 2020-06-09 <dave at tiredofit dot ca>

   ### Added
      - Update to support tiredofit/alpine 5.0.0 base image


## 4.0.0 2020-04-23 <dave at tiredofit dot ca>

   ### Added
      - Support Traefik v2

## 3.2.1 2020-01-02 <dave at tiredofit dot ca>

   ### Changed
      - Additional changes to support new tiredofit/alpine base image


## 3.2.0 2019-12-29 <dave at tiredofit dot ca>

   ### Added
      - Update Image to support new tiredofit/alpine base image


## 3.1 2019-06-13 Dave Conroy <dave at tiredofit.ca>

* Change to allow multiple Frontend Labels per container

## 3.0 2019-05-01 Dave Conroy <dave at tiredofit.ca>

* Refactored to Support Traefik from original image tiredofit/nginx-proxy-cloudflare-compaion
* Added more sanity checks upon failure
* Added Default Docker Entrypoint ENV VAR
* Added Default TTL ENV Var
* Alpine 3.9

## 2.1 2017-12-01 Dave Conroy <dave at tiredofit.ca>

* Base bump to Alpine 3.7

## 2.0 2017-09-15 Dave Conroy <dave at tiredofit dot ca>

* Updated to support Multiple Zones by means of adding additional DOMAIN Environment Variables

## 1.1 2017-09-13 Dave Conroy <dave at tiredofit dot ca>

* Minor Permissions and Script Fix

## 1.0 2017-09-03 Dave Conroy <dave at tiredofit dot ca>

* Initial Release
* Python 2
* Alpine 3.6

