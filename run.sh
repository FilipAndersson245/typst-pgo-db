#!/bin/bash
echo "Sampling started"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
find $SCRIPT_DIR -type f -regex '.*/\(\(main\|example\|demo\).typ\|gallery/.*.typ\|examples/.*.typ\|example/.*.typ\)' | while read line ; do echo === $line === && $1 c $line /tmp/foo.pdf; done

echo "Sampling done now running pgo optimize"
cargo pgo optimize