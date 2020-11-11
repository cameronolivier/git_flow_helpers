#!/bin/bash
project="FAAS"
branch_name=$(git symbolic-ref -q HEAD)
branch_name=${branch_name##refs/heads/}
branch_name=${branch_name:-HEAD}

task=$(expr "$branch_name" : "[a-z]*/\(FAAS-[0-9][0-9][0-9]\)")
echo "gxam \"$task $1\""
#echo "$task"