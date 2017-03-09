#!/bin/bash

> empty_feeds.txt
headarg="-1"
while read url
do
  content="$(curl --silent ${url})"
  content=${content%% }
  content=${content## }
  content="$(echo ${content} | grep -E 'item')"
  if [ -z "$content" ]; then
    echo "${url} IS EMPTY! (probably)"
    echo "${url} IS EMPTY! (probably)" >> empty_feeds.txt
  fi
done < feeds.txt

echo "Finished!"
exit 0
