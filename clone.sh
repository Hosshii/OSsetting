#!/bin/bash

#今のフォルダーが何日目か   出力は04とか
DAY=$(pwd |awk -F "/" '{print substr($(NF-1),0,2)}')

#harib. の.の文字が何か
LAST=$(pwd | awk -F "/" '{print substr($NF,8)}')

#1日目だったら取ってこない
if [ $DAY = "1" ]; then
    echo "Today is firls day!!"
    exit 0;
else
    YESTERDAY="0"`expr $DAY - 1`
fi
ROOT="$HOME/Workspace/hariboteOS/src"

#こ文字のアルファベット26文字の配列
ALPHABET=($(for i in `seq 97 122 `; do printf "%b " $(printf "%s%x" "\\x" $i); done))
ZISAKU="30nichideosjisaku"

# harib*aだったら
if [ $LAST = "a" ];then
    #一日前のフォルダの数を数える
    COUNT=$(ls ../../../$ZISAKU/${YESTERDAY}_day |grep -ce "harib" -e "hello")
    tmp="0"`expr $YESTERDAY - 3`
    DIR_NAME="${YESTERDAY}_day/harib${tmp}${ALPHABET[$COUNT-1]}"
else
    j=-1
    for i in ${ALPHABET[@]};do
        if [ $i = $LAST ];then
            tmp="0"`expr $DAY - 3`
            DIR_NAME="${DAY}_day/harib${tmp}${ALPHABET[$j]}"
        fi
        j=`expr $j + 1`

    done
fi

echo "ls $ROOT/$DIR_NAME"
ls -GF $ROOT/$DIR_NAME
echo $DIR_NAME

echo "pull from $ROOT/$DIR_NAME [Y/n]"
read ANS
case "$ANS" in
    '' |[Yy]* )
        echo "pull from $ROOT/$DIR_NAME"
        rsync -av --exclude 'Makefile' --exclude '*orig' --exclude '*sh' 
    ;;
    [^Yy]* )↲
        echo "do not pull"
        exit 0
    ;;
esac

