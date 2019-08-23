#!/bin/bash

DIR_NAME=$(pwd |awk -F "/" '{print $(NF-1)"/"$NF}')
ZISAKU="30nichideosjisaku"

# copy file 

for x in "$@" ;do
    echo -n "copying $x ..."
    cp -i ../../../$ZISAKU/$DIR_NAME/$x .
    echo "done."
    ./convert.sh $x
done
