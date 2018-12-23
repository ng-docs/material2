#!/usr/bin/env bash

set -x
set -e

npx gulp material-examples:build-release:clean
yarn docs

cd `dirname $0`

npm start

cd -

rm -fr ./tmp/
./scripts/deploy/publish-docs-content.sh --no-build
sleep 5
cd ../material.github.io
./translator/deploy.sh
