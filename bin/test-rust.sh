#!/bin/sh
cd rust || exit 1

# Sometimes rustup complains that no default toolchain is configured.
# Could be caused by network issues, see: https://stackoverflow.com/a/46864309
rustup default stable

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
	cd "$dir" || exit 1
	if ! cargo test; then
		exit_code=1
	fi
	cd ..
done

return $exit_code
