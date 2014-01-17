#!/bin/sh
# Script for invoking KDiff from Git Diff under cygwin
# set this as the difftool path in Gits Config
# git config --global difftool.kdiff3.path kdiff.sh

RESULT=""
for arg
do
if [[ "" != "$arg" ]] && [[ -e $arg ]];
then
OUT=`cygpath -wa $arg`
else
OUT=$arg
if [[ $arg == -* ]];
then
OUT=$arg
else
OUT="'$arg'"
fi
fi
RESULT=$RESULT" "$OUT
done
/cygdrive/c/Program\ Files\ \(x86\)/KDiff3/kdiff3.exe $RESULT
