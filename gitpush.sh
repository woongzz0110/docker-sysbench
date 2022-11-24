#!/bin/bash

GITHUB_USERNAME="woongzz0110"
GITHUB_PASSWORD="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"
GITHUB_URL="https://github.com/woongzz0110/docker-sysbench.git"

NOW=`date`

while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

echo "** CONFIG **"
git config --global credential.helper "cache --timeout=2592000"

if [ "$TAG" != "" ]; then
    echo "** TAG **"
    git tag $TAG
    echo
fi
echo "** COMMIT **"
git commit --allow-empty-message -am "$NOW: $MESSAGE"
echo

echo "** PUSH **"
git push https://github.com/woongzz0110/docker-sysbench.git master --follow-tags --force
echo