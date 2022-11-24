#!/bin/bash
# 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
while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

git add .
if [ "$TAG" != "" ]; then
    git tag $TAG
fi
COMMIT_OPT=""
if [ "$MESSAGE" != "" ]; then
    COMMIT_OPT="$COMMIT_OPT -m $MESSAGE"
fi
git commit $COMMIT_OPT
git push origin master --tags
