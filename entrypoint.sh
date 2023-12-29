#!/bin/sh

CREATE_PR=false

for FILE in $(find ./public -name '*.png' -or -name '*.jpg' -or -name '*jpeg'); do 
    CREATE_PR=true
    FILEPATH=$(basename $FILE)
    
    FILENAME=${FILEPATH%.*}
    EXT="${FILEPATH##*.}"

    NEW=${FILE/$EXT/webp}
    cwebp $FILE -o $NEW

    WEBP=${FILEPATH/$EXT/webp}
    sed -i -e "s/$FILEPATH/$WEBP/g" `find ./src -name '*.jsx' -or -name '*.js' -or -name '*tsx' -or -name '*.ts'`
    rm $FILE
done

if $CREATE_PR; then
    git checkout -b acm-ucr/images

    git config user.email "fake@domain.com"
    git config user.name "ACM UCR"

    git add . && git commit -m "convert images to webp"

    git push origin acm-ucr/images

    gh pr create --base $1 --head acm-ucr/images  --title "Update Images to Webp" --body "Updating images to webp via acm-ucr/images Github Action to merge into $1"
fi