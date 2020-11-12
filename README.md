# Git Flow Helpers
A couple of command tools for managing git commits and branches following a specific flow model.

## Setup:
1. Add the `xgit` script to you PATH
1. Create the `.xgit_config` file in your project root
1. Update the variables:
  - `project`: add your Jira project slug. EG: GFH
  - `slug`: this is simply the `feature/` slug and can be ignored unless you'd like to change it to `feat/` as default
1. Add `.xgit_config` to your `.gitignore` file.

## Available Tools & Usage:

### Create Branch
It's designed to assist with creating branches that follow the git flow method along with Jira or similar integration, given a Jira project code of `PROJ`, it would create a branch of shape: 
```shell
 feature/PROJ-123_your_feature_branch
```
#### Command: 'branch' or 'b': 
```shell
 xgit b <task number> <branch name> #can be in "a branch" or as an underscore string a_branch
```
#### Example: 
Given a task of `PROJ-123`
```shell
 xgit b 123 "a unique task"
```
Will result in checking out the following branch:
```shell
 feature/PROJ-123_a_unique_task
```

### Commiting work
This tries to solve a specific problem of injecting the task name into every commit. Under the hood it calls `git commit -a -m`. Will result in a command that looks something like: 
```shell
 git commit -a -m "PROJ-123 feat(xgit): completed our unique task"
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

