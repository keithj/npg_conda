#!/bin/bash

set -ex

n="$CPU_COUNT"

export IRODS_INSTALL_DIR=$PREFIX

cp ./take_that_you_fiend/CMakeLists.txt .

mkdir -p build
pushd build

export CXXFLAGS="-I$PREFIX/include"
export LDFLAGS="-Wl,-rpath-link,$PREFIX/lib -Wl,--disable-new-dtags -L$PREFIX/lib"

# https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html#an-aside-on-cmake-and-sysroots
declare -a CMAKE_PLATFORM_FLAGS
CMAKE_PLATFORM_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE="${RECIPE_DIR}/cross-linux.cmake")

echo "######################################################################"
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      ${CMAKE_PLATFORM_FLAGS[@]} \
      -DBUILD_UNIT_TESTS=NO \
      ${SRC_DIR}
echo "######################################################################"

# echo | ${CXX} -E -Wp,-v -xc++ -

echo "iRODS hates you"

# make non-package-install-postgres VERBOSE=1
make -j $n VERBOSE=1

popd
