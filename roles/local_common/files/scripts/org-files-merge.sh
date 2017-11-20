#!/usr/bin/env bash

DIRECTORY=${HOME}/Org
GIT_REPO="git@bitbucket.org:johnstorey/org.git"
WORKING_BRANCH="local-work"

echo "Attempting to merge Org work and push to repository."

if [[ -d $DIRECTORY ]]; then

  # Commit current state.

  cd ~/Org
  TIMESTAMP=$(date +"%Y-%m-%d-%H:%M:%S")
  git commit -a -m "$TIMESTAMP"

  # Update remote state.

  git checkout master
  git pull

  # Rebase local work.

  git checkout $WORKING_BRANCH
  git rebase master

  # Merge into master and push.

  git checkout master
  git merge $WORKING_BRANCH
  git push

  # Leave us ready to work.

  git checkout $WORKING_BRANCH

else
  # Error.
  echo "Unable to find directory ${HOME}/Org."
  echo "Did you run org-files-setup.sh? Exiting."
  exit 1

fi
