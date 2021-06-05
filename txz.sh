#!/usr/bin/env bash
# # gemaakt door niels huisman ofzo

if [ -z "$1" ]
  then
    echo "No argument supplied."
    echo "Usage: txz <folder> > file.tar.xz"
    exit 2
fi

src="$1"

# get source size
src_size=$(du -sk "${src}" | cut -f1)

# archive and compress
tar -cf - "${src}" | pv -p -s "${src_size}k" | xz -6 --threads=0 -c -