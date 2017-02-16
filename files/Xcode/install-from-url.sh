#!/bin/sh

# Adapted from https://github.com/ayufan/travis-osx-vm-templates/tree/d398e1dd425e3936c02291fda844b987659c8b2c/scripts

set -eo pipefail
shopt -s nullglob

install_dmg() {
    declare dmg="$1" target="${2:-/}"
    echo "Installing $dmg..."
    TMPMOUNT=`/usr/bin/mktemp -d /tmp/dmg.XXXX`
    hdiutil attach "$dmg" -mountpoint "$TMPMOUNT"
    for app in $TMPMOUNT/*.app; do
        app_name="$(basename "$app")"
        echo "Installing application $app_name..."
        rm -rf "/Applications/$app_name"
        cp -a "$app" "/Applications/"
    done
    find "$TMPMOUNT" -name '*.pkg' -exec installer -target "$target" -pkg "{}" \;
    hdiutil detach "$TMPMOUNT"
    rm -rf "$TMPMOUNT"
    rm -f "$dmg"
}

install_dmg_url() {
    declare url="$1" target="$2"
    local dmg="${dmg:-$(basename "$url")}"
    echo "Downloading $url..."
    curl --retry 3 -o "$dmg" "$url"
    install_dmg "$dmg" "$target"
}

install_dmg_url "URL to Xcode"
