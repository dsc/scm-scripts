#! /bin/bash
# Opens the current or specified working copy path in trac's repo browser

BROWSER=${BROWSER:-open}
WORKING_COPY=${1:-$PWD}

if test -e $WORKING_COPY/.trac_host; then
    TRAC_HOST=$(cat $WORKING_COPY/.trac_host)
fi

if test -z "$TRAC_HOST"; then
    echo "You must set TRAC_HOST or create a $WORKING_COPY/.trac_host file."
    exit 1
fi

SVN_URL=$(svnurl.sh $WORKING_COPY)
if test -z "$SVN_URL"; then
    echo "$WORKING_COPY is not a working copy!"
    exit 1
else
    $BROWSER "http://${TRAC_HOST}/browser/${SVN_URL#*\:\/\/*\/}"
fi