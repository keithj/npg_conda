#!/bin/sh

set -ex

n="$CPU_COUNT"

export CPPFLAGS="-I$PREFIX/include -Wl,-rpath-link,$PREFIX/lib"
export LDFLAGS="-L$PREFIX/lib"

./bootstrap
./configure --prefix="$PREFIX"

make -j $n
make install

sed -i -e "s|$BUILD_PREFIX|$PREFIX|g" "$PREFIX/share/crosstool-ng/paths.sh"

# Work around shebang line accepting only a single argument
CT_NG="$PREFIX/bin/ct-ng"
mv "$CT_NG" "$CT_NG.makefile"

tee "$CT_NG" <<EOF
#!/usr/bin/env sh
$PREFIX/bin/make -rf $CT_NG.makefile \$*
EOF

chmod +x "$CT_NG"
