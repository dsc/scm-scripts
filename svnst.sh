#! /bin/sh
svn st --ignore-externals | grep -v '^X' $*
