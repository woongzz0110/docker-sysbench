#!/bin/bash
# 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
while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

git fetch
git add .
if [ "$TAG" != "" ]; then
    git tag $TAG
fi
COMMIT_OPT="--allow-empty-message"
if [ "$MESSAGE" != "" ]; then
    COMMIT_OPT="$COMMIT_OPT -m $MESSAGE"
fi
git commit $COMMIT_OPT
git push origin master --tags
