#!/bin/sh
cd jq || exit 1

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
	cd "$dir" || exit 1
	if ! bats ./*.bats; then
		exit_code=1
	fi
	cd ..
done

exit $exit_code
