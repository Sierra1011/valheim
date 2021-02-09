FROM steamcmd/steamcmd:latest

ARG SERVER_DIR=/server
ARG WORLDS_DIR=/root/.config/unity3d/IronGate/Valheim/worlds/

RUN mkdir -p $SERVER_DIRECTORY
RUN mkdir -p $WORLDS_DIRECTORY

ENV	SERVER_DIRECTORY=$SERVER_DIRECTORY \
    WORLDS_DIRECTORY=$WORLDS_DIRECTORY \
    SERVER_NAME="My Valheim Server" \
    SERVER_PASSWORD="Vikings" \
    IS_PUBLIC="1" \
    WORLD_NAME="Midgard"

WORKDIR $SERVER_DIRECTORY

COPY entrypoint.sh /entrypoint.sh

EXPOSE 2456/tcp
EXPOSE 2456/udp
EXPOSE 2457/tcp
EXPOSE 2457/udp
EXPOSE 2458/tcp
EXPOSE 2458/udp

ENTRYPOINT ["bash", "/entrypoint.sh"]