#!/bin/sh
sed -i 's/"packageManager": "yarn@.*"/"packageManager": "npm@latest"/' package.json
rm -rf yarn.lock .yarnrc.yml .yarn/
