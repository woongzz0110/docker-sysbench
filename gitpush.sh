#!/bin/bash

# GITHUB_USERNAME="woongzz0110"
# GITHUB_PASSWORD="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"
# GITHUB_URL="github.com/woongzz0110/docker-sysbench.git"

NOW=`date`

# git remote set-url origin https://woongzz0110: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@github.com/woongzz0110/docker-sysbench.git

while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

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