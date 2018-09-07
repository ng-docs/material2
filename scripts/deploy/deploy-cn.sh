#!/usr/bin/env bash

. ~/.nvm/nvm.sh

nvm use 8

set -x
set -e

npm run build
npm run docs

./scripts/deploy/publish-docs-content.sh
cd ../material.angular.io
./translator/deploy.sh
