#!/bin/bash

while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

git add .
git commit -m $MESSAGE -t $TAG 
git push origin master --tags
