#!/bin/bash

CONVERT=$(file ./* |grep "Non-ISO extended-ASCII text" | awk '{print $1}'|sed -e "s/:\$//")

echo "converting files..."
for f in $CONVERT;do
    mv $f "${f}_orig"
    touch $f
    iconv -f SHIFT_JIS -t UTF-8 "${f}_orig" >> $f
    echo "$f back up to ${f}_orig"
    echo "$f converted to $f"
done

echo "done."
