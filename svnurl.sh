#! /bin/sh
# Extracts the repository URL from an svn or git-svn working copy.

CWD=$PWD
URL="${1:-.}"

cd $URL
if test -e '.git'; then
    INFO=$(git svn info | fgrep 'URL: ')
else
    INFO=$(svn info . | fgrep 'URL: ')
fi

echo $INFO | awk '{ print $2 }'
cd $CWD
