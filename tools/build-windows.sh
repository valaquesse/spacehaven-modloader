#!/bin/bash
rm -rf dist/spacehaven-modloader

OLDPATH=$PATH
source env/Scripts/activate
python -m PyInstaller --noconsole modloader.spec
VERSION=`python -c 'import version; print(version.version)'`
deactivate
PATH=$OLDPATH

rm -rf dist/spacehaven-modloader-$VERSION.windows
mv dist/spacehaven-modloader dist/spacehaven-modloader-$VERSION.windows

echo "-- Press enter key to continue --"
read $null
start dist
