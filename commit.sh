#!/bin/bash
project="FAAS"
branch_name=$(git symbolic-ref -q HEAD)
branch_name=${branch_name##refs/heads/}
branch_name=${branch_name:-HEAD}
jira_id=$(expr "$branch_name" : "[a-z]*/\($project-[0-9][0-9][0-9]\)")
git commit -a -m "$jira_id $1"
