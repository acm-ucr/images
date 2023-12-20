#!/bin/sh

apk update && apk add libwebp-tools

for FILE in $(find ./public -name '*.png' -or -name '*.jpg' -or -name '*jpeg'); do 
    FILEPATH=$(basename $FILE)
    
    FILENAME=${FILEPATH%.*}
    EXT="${FILEPATH##*.}"

    NEW=${FILE/$EXT/webp}
    cwebp $FILE -o $NEW

    WEBP=${FILEPATH/$EXT/webp}
    echo $FILEPATH $WEBP $(find /src -name '*.jsx' -or -name '*.js')
    sed -i'' -e "s/$FILEPATH/$WEBP/g" `find /src -name '*.jsx' -or -name '*.js' -or -name '*tsx' -or -name '*.ts'`

    rm $FILE
done