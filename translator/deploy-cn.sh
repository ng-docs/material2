#!/usr/bin/env bash

set -x
set -e

git stash || true

cd `dirname $0`

npm run preprocess

cd -

npx gulp material-examples:build-release:clean
yarn docs

git stash pop || true

cd `dirname $0`

npm run postprocess

cd -

rm -fr ./tmp/
./scripts/deploy/publish-docs-content.sh --no-build
sleep 5
cd ../material.github.io
./translator/deploy.sh
