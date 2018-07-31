#!/bin/bash

# Needed for Linux build to work.
export CFLAGS="-I${PREFIX}/include ${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include ${CPPFLAGS}"
export LDFLAGS="-L${PREFIX}/lib ${LDFLAGS}"

./configure --prefix=$PREFIX
make
make install
