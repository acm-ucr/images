#!/bin/sh

apk update && apk add libwebp-tools

apk add git 

for FILE in $(find ./public -name '*.png' -or -name '*.jpg' -or -name '*jpeg'); do 
    FILEPATH=$(basename $FILE)
    
    FILENAME=${FILEPATH%.*}
    EXT="${FILEPATH##*.}"

    NEW=${FILE/$EXT/webp}
    cwebp $FILE -o $NEW

    WEBP=${FILEPATH/$EXT/webp}
    sed -i -e "s/$FILEPATH/$WEBP/g" `find ./src -name '*.jsx' -or -name '*.js' -or -name '*tsx' -or -name '*.ts'`
    rm $FILE
done

git checkout -b acm-ucr/images

git config user.email "contact.acmucr@gmail.com"
git config user.name "ACM UCR"

git add .
git commit -m "convert images to webp"

git push origin acm-ucr/images

gh pr create --base shahdivyank/test_pr_creation --head acm-ucr/images  --title "Update Images to Webp" --body "Updating images to webp"