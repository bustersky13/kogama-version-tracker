#!/bin/bash

MARKDOWN_FILE="$PWD/version.md"
LINK_CONTENT=$(curl -s $API_URL)

UUID=$(echo $LINK_CONTENT | cut -d'/' -f 4)
TIMESTAMP=$(echo $LINK_CONTENT | cut -d'=' -f 2)

echo "TIMESTAMP/UUID: $TIMESTAMP/$UUID"

if ! grep -q "$UUID" $MARKDOWN_FILE; then
    ZIP_FILE="$DOWNLOAD_DIR/$UUID.zip"
    curl -s -o $ZIP_FILE $LINK_CONTENT

    VERSION=$(unzip -p $ZIP_FILE Version.txt)
    IL2CPP=$(unzip -l $ZIP_FILE | grep -q 'kogama_Data/il2cpp_data' && echo ":heavy_check_mark:" || echo ":x:")
    SIZE=$(du -h $ZIP_FILE | cut -f1)

    DOWNLOAD_NAME="kogama-$VERSION-$UUID.zip"
    DOWNLOAD_LINK="https://github.com/$GITHUB_REPOSITORY/releases/download/versions/$DOWNLOAD_NAME"

    mv $ZIP_FILE "$DOWNLOAD_DIR/$DOWNLOAD_NAME"

    echo "$UUID|$VERSION|$IL2CPP|$TIMESTAMP|[download ($SIZE)]($DOWNLOAD_LINK)" >> $MARKDOWN_FILE
    echo "KOGAMA_UUIDS=$UUID;$KOGAMA_UUIDS" >> $GITHUB_ENV
fi
