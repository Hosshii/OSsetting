#!/bin/bash

ROOT=$(pwd)
ZISAKU="30nichideosjisaku"

#clone
git clone https://github.com/tatsumack/30nichideosjisaku.git

#make dir
cd $ROOT/$ZISAKU
echo -n "making directry..."
find . -type d -path '*day*'  |xargs -I {} sh -c "cd $ROOT;mkdir -p ./src/{};"
if [ $? eq 0 ];then
    echo "done."
fi

#copy file
cd $ROOT
./copy.sh convert.sh pull.sh Makefile
