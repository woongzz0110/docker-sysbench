#!/bin/bash
# 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

GITHUB_USERNAME="woongzz0110"
GITHUB_PASSWORD="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"
GITHUB_URL="github.com/woongzz0110/docker-sysbench.git"

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
COMMIT_OPT="-a --allow-empty-message"
if [ "$MESSAGE" != "" ]; then
    COMMIT_OPT="$COMMIT_OPT -m $MESSAGE"
fi
git commit $COMMIT_OPT
git push https://$GITHUB_USERNAME:$GITHUB_PASSWORD@$GITHUB_URL master --tags
