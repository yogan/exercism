#!/bin/sh
cd python || exit 1

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
	cd "$dir" || exit 1
	if ! python3 -m pytest -o markers=task ./*test*py; then
		exit_code=1
	fi
	cd ..
done

return $exit_code
