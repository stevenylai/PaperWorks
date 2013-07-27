#!/bin/sh
cat ${1}|grep "^Log,"|sed 's/^Log, data: //g'|sed 's/, time: /|/g'|sed 's/, seqno: /|/g' > convert-"${1}"
