# Valheim Server -- Containerised
[![Docker Pulls](https://img.shields.io/badge/dynamic/json?color=red&label=pulls&query=pull_count&url=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fsierra1011%2Fvalheim%2F?style=flat-square&color=E68523&logo=docker&logoColor=white)](https://hub.docker.com/r/sierra1011/valheim)
[![Docker Stars](https://img.shields.io/badge/dynamic/json?color=red&label=stars&query=star_count&url=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fsierra1011%2Fvalheim%2F?style=flat-square&color=E68523&logo=docker&logoColor=white)](https://hub.docker.com/r/sierra1011/valheim)
[![Docker Last Updated](https://img.shields.io/badge/dynamic/json?color=red&label=Last%20Update&query=last_updated&url=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fsierra1011%2Fvalheim%2F?style=flat-square&color=E68523&logo=docker&logoColor=white)](https://hub.docker.com/r/sierra1011/valheim)

![Cover](https://raw.githubusercontent.com/sierra1011/valheim/main/valheim.png)

## Description
A simple, easy server to get you up and fighting quickly.

Based on SteamCMD, to install the server, just start it. To update it, restart it.
The startup of the container will patch the server files if necessary.

## Docker Usage

```shell
docker run -d --name valheim \
    -p 2456 \
    -p 2456/udp \
    -p 2457 \
    -p 2457/udp \
    -p 2458 \
    -p 2458/udp \
    -v $SERVER_DIRECTORY:/server \
    -v $WORLDS_DIRECTORY:/root/.config/unity3d/IronGate/Valheim/worlds \
    -e SERVER_NAME="My Valheim Server" \
    -e SERVER_PASSWORD="Vikings" \
    -e IS_PUBLIC=1 \
    -e WORLD_NAME="Midgard" \
    --restart=always \
    sierra1011/valheim:latest
```

## Docker-Compose

```shell
version: '3'

services:
  valheim:
    image: sierra1011/valheim:latest
    container_name: valheim
    environment:
      - SERVER_NAME: "My Valheim Server"
      - SERVER_PASSWORD: "Vikings"
      - IS_PUBLIC: 1
      - WORLD_NAME: "Midgard"
    volumes:
      - /path/to/files:/server
      - /path/to/worlds:/root/.config/unity3d/IronGate/Valheim/worlds
    ports:
      - 2456:2456/tcp
      - 2456:2456/udp
      - 2457:2457/udp
      - 2457:2457/udp
      - 2457:2458/udp
      - 2457:2458/udp
    restart: unless-stopped
```