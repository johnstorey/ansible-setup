#!/usr/bin/env bash

DIRECTORY=${HOME}/Org
GIT_REPO="git@bitbucket.org:johnstorey/org.git"
WORKING_BRANCH="local-work"

echo "Creating Org directory."


if [[ -d $DIRECTORY ]]; then
  # Error.
  echo "${HOME}/Org already exists. Exiting."
  exit 1
else
  git clone $GIT_REPO ${HOME}/Org 
  cd ${HOME}/Org
  git checkout -b ${WORKING_BRANCH}
fi
