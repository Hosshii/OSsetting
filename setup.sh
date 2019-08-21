#!/bin/bash

ROOT=$(pwd)
ZISAKU="30nichideosjisaku"

#clone
git clone https://github.com/tatsumack/30nichideosjisaku.git

#make dir
cd $ROOT/$ZISAKU
find . -type d -path '*day*'  |xargs -I {} sh -c "cd $ROOT;mkdir -p ./src/{};"

#copy file
cd $ROOT/src
find . -type d -mindepth 2 -maxdepth 2 |xargs -I {} cp ../Makefile {}/Makefile

