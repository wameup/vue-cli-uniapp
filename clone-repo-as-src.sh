#!/bin/bash

ext=https://git.faronear.org/tuc-ext/ext-user-uniapp
cmc=https://git.faronear.org/cup-cmc/cmctoy.web.uniapp

if [ $1 ]
then
  TARGET=$1
else
  echo "/******* Import a repository as src  *******/"
  echo
  echo "  ext : $ext"
  echo "  cmc : $cmc"
  echo
  echo "=== Choose a repository to import (leave blank to specify other repo):"
  read -p ">>> " TARGET
  if [ ! $TARGET ]
  then
    TARGET=other
  fi
fi

eval targetUrl=\$${TARGET}

if [ ! $targetUrl ]
then
  echo
  echo "=== Specify a repo url, such as https://github.com/name/repo:"
  read -p ">>> " targetUrl
fi

if [ $targetUrl ]
then
  mv src src.backup-[$(date +%Y%m%d-%H%M%S)]
  git clone $targetUrl src
  cd src && npm run boot && cd ..
  npm run serve
else
  echo
  echo "--- Target repository is not specified. Exit now."
fi