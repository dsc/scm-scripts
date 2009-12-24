#! /bin/sh

SCM_SCRIPTS_BASE=${SCM_SCRIPTS_BASE:-$(dirname $0)}
SVN_KEYWORD_FILE=${SVN_KEYWORD_FILE:-$SCM_SCRIPTS_BASE/keywords.txt}

if test "$1" = '-F'; then
    SVN_KEYWORD_FILE=$2
    shift 2
fi

svn ps svn:keywords -R -F $SVN_KEYWORD_FILE $*