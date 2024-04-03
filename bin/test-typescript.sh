#!/bin/sh
cd typescript || exit 1

dirs=$(ls -d -- */)
exit_code=0

for dir in $dirs; do
    cd "$dir" || exit 1
    if [ -f .yarnrc.yml ]; then
        echo "$dir"
        echo "yarn sucks, use yarn-to-npm.sh to convert to npm"
        echo
        exit_code=1
    elif ! (npm install && npx jest); then
        exit_code=1
    fi
    cd ..
done

return $exit_code
