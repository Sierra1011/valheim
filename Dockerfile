FROM steamcmd/steamcmd:latest

# Maintainer label
LABEL Maintainer="Sierra1011"
LABEL build_version="0.1"

# Environment variables

ARG PUID=
ARG PGID=
ENV PUID=$PUID
ENV PGID=$PGID

# LGSM specific env
ENV TERM=xterm

# Dependencies
RUN dpkg --add-architecture i386 && \
    apt update -y && \
    apt install -y --no-install-recommends \
        curl \
        wget \
        file \
        tar \
        bzip2 \
        gzip \
        unzip \
        bsdmainutils \
        python \
        util-linux \
        ca-certificates \
        binutils \
        bc \
        jq \
        tmux \
        netcat \
        lib32gcc1 \
        lib32stdc++6 \
        steamcmd

RUN apt clean && \
    rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# Locale, Timezone and user
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone && \
    adduser --disabled-password --shell /bin/bash --disabled-login --gecos "" valheim
ENV LANG en_US.utf8

##### Base Image

# Workdir
WORKDIR /home/valheim

# download LGSM script & run
RUN wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh vhserver

# Run installer in auto mode
RUN ./vhserver auto-install