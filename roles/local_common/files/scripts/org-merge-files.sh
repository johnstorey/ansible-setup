#!/usr/bin/env bash

DIRECTORY=${HOME}/Org
GIT_REPO="git@bitbucket.org:johnstorey/org.git"
WORKING_BRANCH="local-work"

echo "Attempting to merge Org work and push to repository."

if [[ -d $DIRECTORY ]]; then
  cd ~/Org
  TIMESTAMP=$(date +"%Y-%m-%d-%H:%M:%S")
  git commit -a -m "$TIMESTAMP"
  git rebase master
  git checkout master
  git merge $WORKING_BRANCH
  git push
  git checkout $WORKING_BRANCH

else
  # Error.
  echo "Unable to find directory ${HOME}/Org."
  echo "Did you run org-files-setup.sh? Exiting."
  exit 1

fi
