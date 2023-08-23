#!/bin/bash
for tag in "$@"
do
  git tag "$tag"
  git push origin "$tag"
done
