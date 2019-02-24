#!/usr/bin/env bash

set -x
set -e

git clone https://github.com/ng-docs/material.github.io.git

cd ./material.github.io

npm i

./scripts/ci/deploy-cn.sh

cd -

