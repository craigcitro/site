#!/bin/bash
#
# Originally based on:
#   https://gohugo.io/hosting-and-deployment/hosting-on-github/

set -eu
set -o pipefail

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo

# Go To Public folder
cd public

# Commit changes.
msg="rebuilding site $(date --rfc-3339=seconds)"
if [ -n "$*" ]; then
	msg="$*"
fi
git add .
git commit -m "$msg"

# Push source and build repos.
git push github master
