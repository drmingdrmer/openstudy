#!/bin/sh

for f in $(ls original/); do
    if [ -f "$f" ]; then
        echo exist: $f
    else
        echo resize: $f
        convert -resize "50%" "original/$f" "$f"
    fi
done
