#!/bin/bash

if [ $# -eq 0 ];then
    CONVERT=$(file ./* |grep "Non-ISO extended-ASCII text" |grep -ve ".*orig$"| awk '{print $1}'|sed -e "s/:\$//")
else
    CONVERT=$@
fi

echo "converting files..."
for f in $CONVERT;do
    iconv -f SHIFT_JIS -t UTF-8 "$f" >> $f
    echo "$f converted to $f"
done

echo "done."
