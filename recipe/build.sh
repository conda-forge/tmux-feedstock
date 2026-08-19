#!/bin/bash

set -exvo pipefail

autoreconf -f -i

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./etc

if [[ ${target_platform} =~ linux.* ]]; then
  ./configure --prefix=$PREFIX --enable-sixel
else
  export CPPFLAGS="${CPPFLAGS} -DJEMALLOC_MANGLE"
  ./configure --prefix=$PREFIX --enable-sixel --enable-utf8proc --enable-jemalloc
fi

make
make install
