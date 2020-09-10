#!/bin/bash

set -Eeuo pipefail

WORKDIR="."
TMP_DIR="${WORKDIR}/tmp"

MOUNTED_NODE_MODULES="${TMP_DIR}/node_modules"
APP_NODE_MODULES="${WORKDIR}/node_modules"

if [[ -d $MOUNTED_NODE_MODULES ]]; then
  echo "Mounted node_modules folder exists -- $MOUNTED_NODE_MODULES"
else
  mkdir $MOUNTED_NODE_MODULES
fi

if [[ -h $APP_NODE_MODULES ]]; then
  echo "Symbolic link to mounted node_modules folder already exists -- $MOUNTED_NODE_MODULES"
else
  echo "Deleting existing local node_modules folder"
  rm -rf $APP_NODE_MODULES
  echo "Symlinking local node_modules folder to mounted folder"
  ln -fsv $MOUNTED_NODE_MODULES $WORKDIR
fi
