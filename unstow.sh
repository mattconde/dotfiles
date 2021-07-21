#!/usr/bin/env bash

for d in */ ; do
  echo "unstowing $d"
  stow -D $d
done

