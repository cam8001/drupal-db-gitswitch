drupal-db-gitswitch
===================

Change your Drupal db credentials whenever you checkout a different git branch.

Requires drush.

Usage:

* For each branch you need different db credentials for, creating a directory under sites. For example:
  
Branch Name   - 1326666-user-doc-cleanup
Settings path - /var/www/drupal/sites/1326666-user-doc-cleanup/settings.php
              
$ git checkout 8.x
drupal-db-gitswitch is using sites/default/settings.php

$ git checkout 1326666-user-doc-cleanup
drupal-db-gitswitch is using sites/1326666-user-doc-cleanup/settings.php




