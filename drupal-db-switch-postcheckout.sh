#!/bin/bash

# This will probably need a root SUID bit set.

# Default settings.php
DEFAULT="sites/default/settings.php"
# The root of the Drupal installation.
DRUPAL_ROOT=`drush php-eval 'echo drush_locate_root();'`
# Full path to default/settings.php.
DEFAULT_PATH=$DRUPAL_ROOT/$DEFAULT

# Get the current git branch.
BRANCH="$(git symbolic-ref HEAD 2>/dev/null)" ||
BRANCH="(unnamed branch)"     # detached HEAD
BRANCH=${BRANCH##refs/heads/}

# Backup path for original default/settings.php
GITSWITCH_PATH=$DEFAULT_PATH-gitswitch
# Candidate path for pre-branch settings.php
CANDIDATE_PATH="$DRUPAL_ROOT/sites/$BRANCH/settings.php"

function backupLocal {
  if [ -f $DEFAULT_PATH ]
  then
    mv $DEFAULT_PATH $GITSWITCH_PATH
    ln -s $GITSWITCH_PATH $DEFAULT_PATH
  fi
}

function linkNew {
  if [ -f $CANDIDATE_PATH ]
  then
    rm $DEFAULT_PATH
    ln -s $CANDIDATE_PATH $DEFAULT_PATH
  fi
}

# Backup the local on first run.
backupLocal
# Include the branch settings.php if it exists.
linkNew
