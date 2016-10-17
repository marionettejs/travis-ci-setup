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
fi
