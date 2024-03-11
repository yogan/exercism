#!/bin/sh
cd scala || exit 1

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
  cd "$dir" || exit 1
  if ! sbt test; then
    exit_code=1
  fi
  cd ..
done

return $exit_code