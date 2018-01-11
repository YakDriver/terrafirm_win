#!/bin/bash

echo "*****************************************************************************"
echo "Running Watchmaker test script: LINUX"
echo "*****************************************************************************"

command = "watchmaker --version"

if $command ; then
  echo ".............................................................................Success!"
  exit 0
else
  echo ".............................................................................FAILED!"
  exit 1
fi
