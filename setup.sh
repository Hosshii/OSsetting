#!/bin/bash

ROOT=$(pwd)
ZISAKU="30nichideosjisaku"

#clone
git clone https://github.com/tatsumack/30nichideosjisaku.git

#make dir
cd $ROOT/$ZISAKU
echo -n "making directry..."
find . -type d -path '*day*'  |xargs -I {} sh -c "cd $ROOT;mkdir -p ./src/{};"
echo "done."

#copy file
cd $ROOT/src
echo -n "copying files..."
find . -type d -mindepth 2 -maxdepth 2 |xargs -I {} cp ../Makefile {}/Makefile;cp ../copy.sh {};cp ../pull.sh {};cp ../convert.sh {}
echo "done."
