#!/bin/sh

set -u

src=$DOTFILE/$1
dst=$2

if [ ! -d $dst ]; then
	mkdir -pv $dst
fi

ln -fsv $src $dst
