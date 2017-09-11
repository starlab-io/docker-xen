FROM starlabio/ubuntu-base:1.2
MAINTAINER Derek Straka <derek@starlab.io>

RUN sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i /etc/apt/sources.list && \
    find /etc/apt/sources.list.d/ -type f -exec sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i {} \;

# Xen depends
RUN apt-get --quiet --yes update && \
	apt-get --quiet --yes install libx11-dev ocaml-nox ocaml-findlib \
		ocaml-native-compilers libpixman-1-dev libsystemd-dev \
		texinfo libnl-3-dev libnl-utils libnl-cli-3-dev libbz2-dev libpci-dev \
		m4 cmake gcc-multilib build-essential git-core seabios build-essential \
        pkg-config ca-certificates curl wget git libssl-dev software-properties-common bc && \
	apt-get --quiet --yes build-dep xen && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD build-deb.sh /usr/local/bin/build-deb.sh
