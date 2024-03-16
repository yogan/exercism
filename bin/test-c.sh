#!/bin/sh
cd c || exit 1

dirs=$(ls -d -- */)
exit_code=0

if [ -n "$GITHUB_ACTIONS" ]; then
    # For whatever reason, on some runs, the memcheck test triggers a ton of
    # AddressSanitizer:DEADLYSIGNAL errors and leads to a never ending job.
    # We don't really need to do the memcheck test in CI, so let's avoid that.
    cmd="make test"
else
    cmd="make test && make memcheck"
fi

for dir in $dirs; do
    cd "$dir" || exit 1
    if ! eval "$cmd"; then
        exit_code=1
    fi
    cd ..
done

return $exit_code
