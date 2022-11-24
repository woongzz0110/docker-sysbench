#!/bin/bash

NOW=`date`

while getopts m:t: opt
do
    case "${opt}" in
        m) MESSAGE=${OPTARG};;
        t) TAG=${OPTARG};;
    esac
done

if [ "$TAG" != "" ]; then
    echo "** TAG: $TAG **"
    git tag $TAG
    echo
fi
echo "** COMMIT **"
git commit --allow-empty-message -am "$NOW: $MESSAGE"
echo

echo "** PUSH **"
git push git@github.com:woongzz0110/docker-sysbench.git master --tags --force
echo