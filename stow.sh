#!/usr/bin/env bash

find . -name ".DS_Store" -delete

for d in */ ; do
  echo "stowing $d"
  stow --restow $d
done

