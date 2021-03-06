#!/bin/bash

set -o nounset
set -o errexit

IN="${1:?You must pass the full path of the tar archive as a parameter to this script}"

if ! [ -d "peek_mobile/src" ];then
    echo "You must run this script in the peek-mobile root project dir" >&2
    exit 1
fi

ARGS=""
ARGS="$ARGS peek_mobile/node_modules/@synerty"
ARGS="$ARGS peek_mobile/node_modules/peek_plugin_*"
ARGS="$ARGS peek_mobile/src/app/peek_plugin_*"
ARGS="$ARGS peek_mobile/src/app/plugin-ro*.ts"

echo "DELETING OLD PLUGINS"
rm -rfv $ARGS

echo "EXTRACTING PLUGIN UPDATE"
tar xvjf $IN

echo
echo "The plugins have been updated"
echo
