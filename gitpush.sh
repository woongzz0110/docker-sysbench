#!/bin/bash
# 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

GITHUB_USERNAME="woongzz0110"
GITHUB_PASSWORD="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"
GITHUB_URL="github.com/woongzz0110/docker-sysbench.git"

NOW=`date`

while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

if [ "$TAG" != "" ]; then
    echo "ADD TAG"
    git tag $TAG
    echo
fi
echo "COMMIT"
git commit --allow-empty-message -am "$NOW: $MESSAGE"
echo

echo "PUSH"
git push https://$GITHUB_USERNAME:$GITHUB_PASSWORD@$GITHUB_URL master --follow-tags
echo