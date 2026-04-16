#!/bin/bash

# add specific non-swift files 
git add .gitignore
git add commit.sh
git add *.md

# add packages
# git add autosaveNashuaPackage/
# git add corePackage/
# git add autosavePackage/

# commit, push, status
git commit -m "${1:-updates}"  
git push
git status
