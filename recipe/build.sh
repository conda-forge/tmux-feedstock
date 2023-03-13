#!/bin/bash

set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./etc

autoreconf -f -i

if [[ ${target_platform} =~ linux.* ]]; then
  ./configure --prefix=$PREFIX
else
  ./configure --prefix=$PREFIX --enable-utf8proc
fi

make
make install
