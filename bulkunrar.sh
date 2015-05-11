#! /usr/bin/bash
#usage script /path/to/extract 

for f in "$(find ./ -name "*.rar" | sort -V)" 
do
	unrar x "$f" "$1"/
done

#or Alternatively,
find ./ -name "*.rar" | sort -v | xargs -n 1 -I _ unrar x _ /path/to/extract 
