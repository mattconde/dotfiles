#!/usr/bin/env bash

for d in */ ; do
  echo "stowing $d"
  stow --restow $d
done

