#!/bin/sh
cd prolog || exit 1

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
    cd "$dir" || exit 1
    if ! swipl -f ./*.pl -s ./*_tests.plt -g run_tests,halt -t 'halt(1)'; then
        exit_code=1
    fi
    cd ..
done

return $exit_code
