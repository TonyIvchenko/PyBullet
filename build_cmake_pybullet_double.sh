#!/bin/sh

set -eu

if [ -e CMakeCache.txt ]; then
  rm -f CMakeCache.txt
fi
mkdir -p build_cmake
cd build_cmake
cmake -DBUILD_PYBULLET=ON -DBUILD_PYBULLET_NUMPY=ON -DUSE_DOUBLE_PRECISION=ON -DBT_USE_EGL=ON -DCMAKE_BUILD_TYPE=Release ..
make -j "$(nproc 2>/dev/null || echo 12)"
cd examples/pybullet
if [ -e pybullet.dylib ]; then
  ln -sf pybullet.dylib pybullet.so
fi
rm -rf pybullet_envs pybullet_data pybullet_utils
ln -s ../../../examples/pybullet/gym/pybullet_envs .
ln -s ../../../examples/pybullet/gym/pybullet_data .
ln -s ../../../examples/pybullet/gym/pybullet_utils .
echo "Completed build of Bullet."
