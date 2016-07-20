#!/bin/sh -eux

export FETCHER=/bin/false
export WGET=/bin/false

./configure --disable-docs --disable-stubdom \
	--disable-qemu-traditional \
	--with-system-qemu \
	--with-system-seabios=/usr/share/seabios/bios.bin

make debball
