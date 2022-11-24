#!/bin/bash

while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

git add .
if [ $TAG == ""]; then
    git commit -m $MESSAGE
else
    git commit -m $MESSAGE -t $TAG
fi
git push origin master --follow-tags
