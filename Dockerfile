FROM starlabio/ubuntu-native-build:1.0.1
MAINTAINER Doug Goldstein <doug@starlab.io>

# Xen depends
RUN apt-get --quiet --yes update && \
	apt-get --quiet --yes install libx11-dev ocaml-nox ocaml-findlib \
		ocaml-native-compilers libpixman-1-dev libsystemd-dev \
		texinfo libnl-3-dev libnl-utils libnl-cli-3-dev libbz2-dev libpci-dev \
		m4 cmake gcc-multilib build-essential git-core seabios && \
	apt-get --quiet --yes build-dep xen && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD build-deb.sh /usr/local/bin/build-deb.sh
