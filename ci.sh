#!/bin/bash

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

  # lodash 2 lodash 3 and lodash 4 have different file structures
  if [[ "$LODASH" < "3.0" ]] || [[ "$LODASH" > "4.0" ]] || [[ "$LODASH" == "4.0" ]]
  then
    cp node_modules/lodash/lodash.js node_modules/underscore/underscore.js
  else
    cp node_modules/lodash/index.js node_modules/underscore/underscore.js
  fi
fi
