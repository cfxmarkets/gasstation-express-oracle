gasstation-express 
==

A Lightweight Ethereum Gas Price Oracle for Anyone Running a Full Node
--

This is a simple gas price oracle that can be used if you are running a local
geth or parity node.  It will look at gasprices over the last 200 blocks and
provide gas price estimates based on the minimum gas price accepted in a
percentage of blocks.  Pass the RPC port for your running node in the
environment variable `GASSTATION_PORT`.

usage example: `GASSTATION_PORT=8545 python3 gasExpress.py`

requirements: `pip3 install -r requirements.txt`

Packaging
--

To facilitate packaging for various OS package managers, a `pkg-src` directory
is included that contains package source files. At the time of this writing,
only Debian is supported, but other packages may be added easily.

Packaging utilizes a small package framework provided by `libpkgbuilder.sh`,
which is found in the [`ks-std-libs` package][ks-lib] (source code at
https://github.com/kael-shipman/ks-std-libs/blob/master/src/usr/lib/ks-std-libs/libpkgbuilder.sh).
This framework supports the construction of common package files and structures
in `pkg-src/generic`, which are then copied into each specific package at build
time. It also supports multiple packages by specifying multiple package
directories under the various package type directories.

Package version numbers are set dynamically using the version specified in the
`VERSION` file. This file must be updated on each change. (In fact, all
instances of the string `::VERSION::` anywhere in the files that are copied
into the final package build are replaced with the correct version number at
build time.)

To build all available packages, install `ks-std-libs` and then run
`./pkg-build.sh`. To add other types of packages (e.g., rpm or pacman
packages), simply add the correct package source trees to `pkg-src`, add
handlers for the packages in `pkg-build.sh`, then run `./pkg-build.sh`.

[ks-lib]: https://packages.kaelshipman.me/public/deb/pool/main/k/ks-std-libs/
