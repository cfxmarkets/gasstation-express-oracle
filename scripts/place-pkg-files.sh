#!/bin/bash

set -e

function place_files() {
    local pkgname="$1"
    local targdir="$2"
    local pkgtype="$3"

    if [ "$pkgtype" == "deb" ]; then
        if [ "$pkgname" == "eth-gasexpress" ]; then
            pkgdir="$targdir/srv/local/$pkgname"
            mkdir -p "$pkgdir"
            cp gasExpress.py "$pkgdir/"
            cp requirements.txt "$pkgdir/"
        else
            >&2 echo "E: Don't know how to handle package '$pkgname'"
            return 10
        fi
    else
        >&2 echo "E: Don't know how to handle packages of type '$pkgtype'"
        return 20
    fi

}

place_files "$1" "$2" "$3"

