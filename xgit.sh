#!/bin/bash
. "$(pwd)/.xgit_config"

function branch() {
  name=${3// /_}
  branch_name="$slug$project-$2_$name"
  git checkout -b "$branch_name"
}

function commit() {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  jira_id=$(expr "$branch_name" : "[a-z]*/\($project-[0-9][0-9][0-9]\)")
  git commit -a -m "$jira_id $2"
}

if [ "$1" = "branch" ]
then
  branch "$@"
elif [ "$1" = "commit" ]
then
  commit "$@"
fi
