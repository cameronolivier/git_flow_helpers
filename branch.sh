#!/bin/bash
slug="feature/"
project="FAAS"
name=${2// /_}
branch="$slug$project-$1_$name"
git checkout -b "$branch"
pwd