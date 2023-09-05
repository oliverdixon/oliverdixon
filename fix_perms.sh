#!/bin/bash
# OWD 2023
set -e -x

# fix-perms: recursively fix all permissions for files in public directories.
find -type f -not -name *\\.sh -exec chmod 0644 {} \;

