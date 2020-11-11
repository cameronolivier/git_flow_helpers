#!/bin/bash
slug="feature/"
project="FAAS"
name=${2// /_}
branch=$slug$project"-"$1"_"$name
git checkout -b $branch
