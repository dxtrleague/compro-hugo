#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

config="config.toml"
if [ "$1" = "stg" ] || [ "$1" = "stage" ] || [ "$1" = "staging" ] 
    then config="config-stg.toml"
elif [ "$1" = "prd" ] || [ "$1" = "prod" ] || [ "$1" = "production" ]
    then config="config-prd.toml"
fi

# Build the project.
hugo --config $config -t vex-hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 2 ]
  then msg="$2"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
