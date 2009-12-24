#! /bin/bash

# TODO: treat $SVN_UP_PROJECTS as an array

projects=${1:-$SVN_UP_PROJECTS}
projects=${projects:-$PWD}
if test -z "$projects"; then
    echo "You must supply a project dir or export SVN_UP_PROJECTS."
    exit 1
elif test ! -d $projects ; then
    echo "Target dir \"$SVN_UP_PROJECTS\" must be a directory."
    exit 1
fi

color="\033[01;34m"
nocolor="\033[00m"

echo -e "${color}Updating all projects$nocolor in $projects..."

for f in $projects/*; do
    if [ -d "$f/.svn" ]; then
        echo -e "${color}Updating:$nocolor $f"
        svn up $f/
    else
        echo -e "${color}Skipping:$nocolor $f"
    fi
done