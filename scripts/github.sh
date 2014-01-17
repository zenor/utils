#!/usr/bin/sh

# TODO: currently defaults to HEAD of the current branch,
# but an option to show github at specific rev (local current, or specified)
# would be good.

# TODO: sort out what happens from a detached head

if [ "$#" -ne 1 ]; then
	echo "Usage: github <file|dir>"
	exit 1
fi

if [ -f "$1" ] ; then
	TARGET=$(git ls-tree --name-only --full-name HEAD $1)
	TYPE="blob"
	if [ -z "$TARGET" ] ; then
		echo "file $1 is not tracked in git"
		exit 1
	fi
else
	if [ -d "$1" ] ; then
		TARGET=$(git rev-parse $1)
		TYPE="tree"
		echo $TARGET
	else
		echo "$1 is not a valid file or directory"
		exit 1
	fi
fi
	

URL=$(git ls-remote --get-url)
PREFIX="git@github.com:"
URL=${URL#$PREFIX}
URL=${URL%%.git}

BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
URL="http://www.github.com/$URL/$TYPE/$BRANCH/$TARGET"

# For Cygwin
cygstart $URL
# For Git Bash
#start $URL
# For Linux
#xdg-open $URL