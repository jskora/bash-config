#!/bin/bash

RC=0
for X in *; do
    if [ "$X" == "setup.sh" -o "$X" == "check.sh" -o "$X" == "diff.sh" -o "$X" == "README.md" ]; then
        continue
    fi
    grep -E "^safe_copy $X" setup.sh >/dev/null
    if [ $? -ne 0 ]; then
        echo "not in setup.sh $X"
        RC=1
    fi
    grep -E "^safe_diff $X" diff.sh >/dev/null
    if [ $? -ne 0 ]; then
        echo "not in diff.sh $X"
        RC=1
    fi
done
exit $RC
