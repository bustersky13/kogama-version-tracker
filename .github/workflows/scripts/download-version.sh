#!/bin/bash

download_version() {
    UUID=$1
    VERSION_CONTENT=$(cat "$3")
    VERSION=$(echo "$VERSION_CONTENT" | grep "^$UUID" | cut -d "|" -f2)
    OUTPUT="$2/kogama-$VERSION-$UUID.zip"

    mkdir -p "$2"

    if curl --fail -s "http://files.kogstatic.com/$UUID/KogamaData" -o "$OUTPUT"; then
        echo "$UUID" >> "$4"
    fi
}

export -f download_version
