#! /bin/bash

SVN_UP_PROJECTS=${1:-$SVN_UP_PROJECTS}
if [ -z "$SVN_UP_PROJECTS" ]; then
    echo "You must supply a project dir or set SVN_UP_PROJECTS."
    exit 1
fi

color="\033[01;34m"
nocolor="\033[00m"

echo -e "${color}Updating all projects$nocolor in $projects..."

for file in $projects/*; do
    if [ -e "$file/.svn" ]; then
        echo -e "${color}Updating:$nocolor $file"
        svn up $file/
    else
        echo -e "${color}Skipping:$nocolor $file"
    fi
done