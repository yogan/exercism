#!/bin/sh
cd gleam || exit 1

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
  cd "$dir" || exit 1
  if ! gleam test; then
    exit_code=1
  fi
  cd ..
done

return $exit_code
