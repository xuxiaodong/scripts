#!/bin/sh
#
# A simple GUI for sdcv
# Author: Xu Xiaodong <xxdlhy AT gmail.com>, 2009
#

word=`xsel -o`
output=`sdcv -n -u '朗道英汉字典5.0' "$word"`

if [ -n "$output" ]
then
	yad --title 'Ysd' \
	    --button '' \
	    --timeout '5' \
	    --text "$output"
fi

exit 0
