#!/usr/bin/env bash

set -x
set -e

git stash || true

cd `dirname $0`

npm run preprocess

cd -

yarn docs

git stash pop || true

cd `dirname $0`

npm run postprocess

cd -
