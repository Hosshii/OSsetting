#!/bin/bash

cd src
echo -n "copying files..."
result=0
for x in "$@";do
    find . -type d -mindepth 2 -maxdepth 2 |xargs -I {} \cp -rf ../$x {}/$x
    tmp=$?
    if [ $tmp -ne 0 ];then
        result=$tmp
    else
        result=$result
    fi
done
if [ $result -eq 0 ];then
    echo "done."
fi
