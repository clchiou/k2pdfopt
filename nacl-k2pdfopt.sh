#!/bin/bash
#
# Copyright (c) 2013 Che-Liang Chiou. All rights reserved.
# Use of this source code is governed by the GNU General Public License
# as published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#

source pkg_info
source ../common.sh

CustomInstallStep() {
  # TODO(clchiou): Pack k2pdfopt.exe into a chrome extension
  DefaultTouchStep
}

CustomPackageInstall() {
  DefaultPreInstallStep
  DefaultSyncSrcStep

  ChangeDir ${NACL_PACKAGES_REPOSITORY}/${PACKAGE_DIR}

  export CC=${NACLCC}
  export CFLAGS="${CFLAGS} -I=/usr/include/glibc-compat"
  export LIBS="-lglibc-compat -lnacl-mounts -lpthread \
               -lm -lstdc++ -lcrt_common -lnosys"

  Banner "Build ${PACKAGE_NAME}"
  echo "Directory: $(pwd)"
  LogExecute make -j${OS_JOBS} ${MAKE_TARGETS:-}

  CustomInstallStep
  DefaultCleanUpStep
}

CustomPackageInstall
