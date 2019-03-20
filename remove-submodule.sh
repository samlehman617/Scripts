#!/bin/env bash

###############################################################################
# Remove Git Submodules
###############################################################################

# Delete relevant lines from .gitmodules
sed '/${1}/d' .gitmodules
sed '/${1}/d' .gitmodules
sed '/${1}/d' .gitmodules
sed '/${1}/d' .gitmodules

# Deinit submodule
git submodule deinit -f --./$1

# Remove the module git tracker info
rm -rf .git/modules/$1

# Remove the submodule files
git rm -f $1

# Exit
exit 0

