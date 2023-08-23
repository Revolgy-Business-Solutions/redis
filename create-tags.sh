#!/bin/bash

# loop over the arguments
for tag in "$@"
do
  # create a tag with the format postgres-{version}
  git tag "$tag"
  # push the tag to the remote
  git push origin "$tag"
done
