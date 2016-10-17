#!/bin/sh

text=${GEDIT_SELECTED_TEXT}

extext=`echo   ${text} | sed s/" "//g`
extext=`echo ${extext} | sed s/"　"//g`
echo 行数　　　　　　： `echo   ${text} | wc -l`
echo 単語数　　　　　： `echo   ${text} | wc -w`
echo 文字数（含空白）： `echo   ${text} | wc -m`
echo 文字数（除空白）： `echo ${extext} | wc -m`
echo バイト数　　　　： `echo   ${text} | wc -c`
# echo ${GEDIT_SELECTED_TEXT} | wc

