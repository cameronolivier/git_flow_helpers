#!/bin/bash
. "$(pwd)/.xgit_config"

name=${2// /_}
branch="$slug$project-$1_$name"
git checkout -b "$branch"
