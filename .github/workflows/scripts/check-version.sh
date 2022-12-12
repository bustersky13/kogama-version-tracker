#!/bin/bash
source "$(dirname -- "$0")/download-version.sh"

VERSIONS_TEXT_DIR="$PWD/versions.txt"
VERSIONS_TABLE_DIR="$PWD/version.md"
VERSION_CONTENT=$(cat "$VERSIONS_TABLE_DIR")
LINES_COUNT=$(wc -l $VERSIONS_TABLE_DIR | cut -d " " -f1)

touch $VERSIONS_TEXT_DIR

for (( i=3; i<=$LINES_COUNT; i++ )) do
    LINE=$(echo "$VERSION_CONTENT" | cut -d$'\n' -f $i)
    UUID=$(echo "$LINE" | cut -d'|' -f1)

    if ! grep -q "$UUID" "$VERSIONS_TEXT_DIR"; then
        download_version "$UUID" "$PWD/downloads" "$VERSIONS_TABLE_DIR" "$VERSIONS_TEXT_DIR"
    fi
done


if [ $(git status -s $VERSIONS_TEXT_DIR | wc -c) -ne 0 ]; then
    echo "::set-output name=update::true"
fi
