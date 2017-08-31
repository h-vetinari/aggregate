#!/bin/bash

. activate "${PREFIX}"
PATH=${PREFIX}/cmake-bin/bin:${PATH}
cd "${SRC_DIR}"

DEST="${PWD}"/install-libcxx
[[ -d "${DEST}" ]] && rm -rf "${DEST}"
pushd llvm_build_final/projects/libcxx
  make install DESTDIR="${DEST}"
popd
pushd "${DEST}"/"${PWD}"/prefix
  cp -Rf * "${PREFIX}"
popd
