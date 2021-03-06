#!/bin/bash

set -e

pushd "${LIBRARY_WORKING_DIRECTORY_LOCATION}"

curl -LO "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${LIBRARY_GPG_ERROR_VERSION}.tar.bz2" --retry 5

tar -xvzf "./libgpg-error-${LIBRARY_GPG_ERROR_VERSION}.tar.bz2"

mv "./libgpg-error-${LIBRARY_GPG_ERROR_VERSION}" "./libgpg-error-source"

cd "./libgpg-error-source"

./configure \
--enable-static \
--disable-dependency-tracking \
--disable-silent-rules \
--prefix="${SHARED_RESULT_ROOT_LOCATION}" 

make
make install

popd
