#!/bin/bash

# Default settings.php
DEFAULT="sites/default/settings.php"

# Get the current git branch.
BRANCH="$(git symbolic-ref HEAD 2>/dev/null)" ||
BRANCH="(unnamed branch)"     # detached HEAD
BRANCH=${BRANCH##refs/heads/}

# Return the root of the Drupal installation.
DRUPAL_ROOT=`drush php-eval 'echo drush_locate_root();'`


echo -e "Branch is: $BRANCH\n";
echo -e "Drupal dir is $DRUPAL_ROOT\n";

DEFAULT="$DRUPAL_ROOT/$DEFAULT"
CANDIDATE="$DRUPAL_ROOT/sites/$BRANCH/settings.php"

echo -e "Testing for $CANDIDATE\n"

if [ -f $CANDIDATE ]
then
  echo "including branch name file $CANDIDATE"
else
 echo "including default file"
fi
