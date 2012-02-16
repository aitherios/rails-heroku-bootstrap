#!/usr/bin/env sh

dir=$(cd $(dirname "$0"); pwd)

if [ -z $1 ]; then echo 'Please inform the new name for the project'; exit 1; fi

echo "Renaming project from 'Rails32Bootstrap' to '$1'"

for file in $(grep -Rl 'Rails32Bootstrap' $dir/*); do
  sed -i "s/Rails32Bootstrap/$1/g" $file
done
