#!/bin/bash
echo "Sampling started"

cargo clean
cargo pgo instrument test -- --workspace --test tests

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
find $SCRIPT_DIR -type f -regex '.*/\(\(main\|example\|demo\).typ\|gallery/.*.typ\|examples/.*.typ\|example/.*.typ\)' | \
while read line ; do echo === $line === && cargo pgo instrument --keep-profiles run -- c $line /tmp/foo.pdf; done

echo "Sampling done now running pgo optimize"
cargo pgo optimize