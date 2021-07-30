# Git Flow Helpers
A couple of command tools for managing git commits and branches following a specific flow model.

## Setup:
1. Add the `xgit` script to you PATH 
   > If you're on mac, 
   > - drop it into: `/usr/local/bin/`
   > - and make it executable: `chmod 755 xgit`

1. Copy the `.xgitconfig` file into your project root
1. Update the variables:
    - `project`: your Jira project slug. _If your tickets look like `XXX-123`, then set this to: `XXX`_
    - `slug`: _this is optional_. If you pass an empty string, it'll be ignored. It will prefix your ticket number, so can be used to add the `feature/` or `feat/` slug.
1. Add `.xgitconfig` to your `.gitignore` file.

## Available Tools & Usage:

### Check out a branch
This allows you to check out a branch with search param

#### Command: 'checkout' or 'x':
```shell
 xgit x <commit message>
```
#### Example:
Given a branch `feature/PROJ-123_your_feature_branch`, you can now easily check it out by just passing the ticket number
```shell
 xgit x 123
```
Will result in the following git command being run:
```shell
 git checkout feature/PROJ-123_your_feature_branch
```


### Create Branch
It's designed to assist with creating branches that follow the git flow method along with Jira or similar integration, given a Jira project code of `PROJ`, it would create a branch of shape: 
```shell
 feature/PROJ-123_your_feature_branch
```
#### Command: 'branch' or 'b': 
```shell
 xgit b <task number> <branch name>
```
`branch name` can be as a string in inverted commas `"my branch name"` or as an underscore-separated string as in `my_branch_name`
#### Example: 
Given a task of `PROJ-123`
```shell
 xgit b 123 "a unique task"
```
Will result in checking out the following branch:
```shell
 feature/PROJ-123_a_unique_task
```
Or, if your `slug` value is an empty string:
```shell
 PROJ-123_a_unique_task
```

### Committing work
This tries to solve a specific problem of injecting the task name into every commit. Under the hood it calls `git commit -a -m`. Will result in a command that looks something like: 
```shell
 git commit -a -m "PROJ-123 feat(xgit): completed the unique task"
```
#### Command: 'commit' or 'c': 
```shell
 xgit c <commit message>
```
#### Example: 
Given a task of `PROJ-123`, with a correctly setup config (project=PROJ)
```shell
 xgit c "feat(xgit): finished a unique task"
```
Will result in the following commit message:
```shell
 git commit -a -m "PROJ-123 feat(xgit): finished a unique task"
```

