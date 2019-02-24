#!/usr/bin/env bash

set -x
set -e

git clone https://github.com/ng-docs/material.github.io.git

cd ./material.github.io

./scripts/ci/build-and-test.sh
./translator/deploy-cn.sh

cd -

