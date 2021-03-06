#!/usr/bin/env bash
set -e

dir=$PWD
files=

manualfile="$dir/FILES"

if [ -f $manualfile ]; then
  files="$(cat $manualfile)"
else
  # Get list of files to link
  includes=""
  excludes=".gitignore"
  base="$(find . -maxdepth 2 -name '.*' -not -name '.*.local' -not -name '*.swp' -type f | sed 's#^\./##' | grep -vF $excludes | grep -vF '.init.vim' )" files="$base"
fi

echo $files
