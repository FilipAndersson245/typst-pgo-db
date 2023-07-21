#!/bin/bash
# 1 pgo bin
# 2 target_dir
echo $1
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
find $SCRIPT_DIR -type f -regex ".*\main.typ" | while read line ; do echo === $line === && $1 c $line /tmp/foo.pdf; done

cargo pgo optimize