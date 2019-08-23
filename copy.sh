#!/bin/bash

cd src
echo -n "copying files..."
find . -type d -mindepth 2 -maxdepth 2 |xargs -I {} cp ../$1 {}/$1 
echo "done."
