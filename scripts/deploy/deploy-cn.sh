#!/usr/bin/env bash

. ~/.nvm/nvm.sh

nvm use 8

set -x
set -e

rm -fr ./tmp/
./scripts/deploy/publish-docs-content.sh
sleep 5
cd ../material.angular.io
./translator/deploy.sh
