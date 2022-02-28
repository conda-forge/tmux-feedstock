#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./etc

autoreconf -f -i
./configure --prefix=$PREFIX
make
make install
