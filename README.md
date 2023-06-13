# HestiaCP Docker
This repo is for creating a Docker image for a localhost [Hestia Control Panel](https://www.hestiacp.com); an open source Control Panel for web hosting. The intent behind this image is for development and local testing only. It accomplishes this by hacking systemctl and does NOT follow the "Docker way" of composing seperate services because this is NOT intended as production server. This image has been culled and purposely doesn't include certain services that have little or no importance in a local server environment such as ClamAV, fail2ban, spamassassin, DNS, etc. What is included are options for:

* Apache Server
* Nginx Server
* PHP versions 5.6 to 8.2
* MariaDB, a MySQL compatible database server
* Postgresql database server

You can review the Dockerfile that builds the server and make adjustments to meet your needs. See the section "There are two options to choose from" for the examples of a 'lite' image (the default, and what you will find on docker hub) and an option to install a whole lot more (option #2). But be warned that not all features have been tested and may not work at all. Check the issues list for known issues; some of these maybe fix-able; others not so given the practicality behind a Docker environment.

## Prebuilt Docker image
You can find a prebuilt Docker image based on this repo at https://hub.docker.com/repository/docker. This image is in the `lite` configuration (see option #1 in the Dockerfile); this image has been optimized for use by localhost web development environment users.

## Building and running in Docker
Building the image is straight forward by following the commands below. A prebuilt 'lite' image can be found on Docker hub. In order to create HestiaCP, this repo needed to patch a number of items in the original HestiaCP Ubuntu install file; and the installer does this dynamically by downloading the latest HestiaCP installer and applying modifications. Also, it emulates and swaps out `systemctl` commands with some workarounds to get the installer to complete and keep HestiaCP happy. Review the Dockerfile for details.

### To build from the given directory:
```
docker build -t hestiacp .
```

### To run the built image:
```
docker-compose up -d
```

### To access the docker command line:
```
docker exec -it hestiacp /bin/bash
```

### To start all services:
You will need to run this script the first time you create a container from the image; or stop and restart one.
```
/usr/src/start-all-services.sh
```

### To check the status of services:
```
service --status-all
```
&nbsp;
---

## Visit your Hestia Control Panel
You can visit your Hestia Control panel by visiting https://hestiacp.dev.cc:8083. in your web browser. You'll need to accept the self-signed certificate to visit the site and use the following credentials to login:

```
Username: admin
Password: password
```
