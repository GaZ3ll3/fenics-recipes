#!/bin/bash

if [ `uname` == Darwin ]; then
  MACOSX_VERSION_MIN=10.8
  export CXXFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
  export CXXFLAGS="${CXXFLAGS} -stdlib=libc++"
  export LINKFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
  export LINKFLAGS="${LINKFLAGS} -stdlib=libc++"
fi

$PYTHON setup.py install --prefix=$PREFIX

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
