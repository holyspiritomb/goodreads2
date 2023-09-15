#!/bin/bash

pushd .. > /dev/null

rm -rf dist
rm -f availablereads-firefox.zip

mkdir dist
cp -r src dist/
cp -r icons dist/
VERSION=$(jq -r '.version' build/manifest.json.firefox)
cp build/manifest.json.firefox dist/manifest.json

pushd dist > /dev/null
zip ../availablereads-firefox_$VERSION.zip -qr *
popd > /dev/null

popd > /dev/null
