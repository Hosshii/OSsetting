#!/bin/bash

cd src
echo -n "copying files..."
for x in "$@";do
    find . -type d -mindepth 2 -maxdepth 2 |xargs -I {} \cp -rf ../$x {}/$x
done
if [ $? eq 0 ];then
    echo "done."
fi
