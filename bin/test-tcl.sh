#!/bin/sh
cd tcl || exit 1

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
  cd "$dir" || exit 1
  if ! RUN_ALL=1 tclsh ./*.test; then
    exit_code=1
  fi
  cd ..
done

return $exit_code
