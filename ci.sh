#!/bin/bash

npm install -g grunt-cli
npm install
npm dedupe

if [[ -n "$UNDERSCORE" ]]
then
  npm install underscore@"$UNDERSCORE"
fi

if [[ -n "$BACKBONE" ]]
then
  npm install backbone@"$BACKBONE"
fi

if [[ -n "$MARIONETTE" ]]
then
  npm install backbone.marionette@"$MARIONETTE"
fi

if [[ -n "$LODASH" ]]
then
  npm install lodash@"$LODASH"

  # Lodash@2 and Lodash@3 have different file structures
  if [[ "$LODASH" < "3.0" ]]
  then
    cp node_modules/lodash/lodash.js node_modules/underscore/underscore.js
  else
    cp node_modules/lodash/index.js node_modules/underscore/underscore.js
  fi
fi
