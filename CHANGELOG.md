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

