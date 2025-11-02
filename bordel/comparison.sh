#!/bin/bash

SRC1="hw/vendor/openhwgroup_cv32e40p"
SRC2="hw/vendor/esl_epfl_cv32e40px"

for f1 in $(find $SRC1 -type f); do
    rel_path=${f1#$SRC1/}
    f2="$SRC2/${rel_path/cv32e40p/cv32e40px}"
    if [[ -f "$f2" ]]; then
        echo "Comparing: $f1 ↔ $f2"
        diff -u "$f1" "$f2" || echo "→ Files differ"
    fi
done
