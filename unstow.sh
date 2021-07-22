#!/usr/bin/env bash

find . -name ".DS_Store" -delete

for d in */ ; do
  echo "unstowing $d"
  stow -D $d
done

