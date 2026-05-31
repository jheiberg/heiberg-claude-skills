# Git — Everyday Commands

## Setup

| Command | What it does |
|---------|-------------|
| `git init` | Create a new repo in current directory |
| `git clone <url>` | Clone a remote repo locally |
| `git config --global user.name "Name"` | Set your name |
| `git config --global user.email "email"` | Set your email |
| `git config --list` | Show all config |

## Status & inspection

| Command | What it does |
|---------|-------------|
| `git status` | Show staged, unstaged, and untracked files |
| `git status -s` | Short (compact) status |

## Staging

| Command | What it does |
|---------|-------------|
| `git add <file>` | Stage a specific file |
| `git add .` | Stage all changes in current directory |
| `git add -p` | Interactively stage chunks (patch mode — review before staging) |
| `git rm <file>` | Remove file from repo and disk |
| `git rm --cached <file>` | Unstage / stop tracking a file (keeps it on disk) |

## Committing

| Command | What it does |
|---------|-------------|
| `git commit -m "message"` | Commit staged changes |
| `git commit --amend` | Edit the last commit message (or add forgotten staged files) |
| `git commit --amend --no-edit` | Add staged files to last commit without changing message |

> ⚠️ Never amend commits that have already been pushed to a shared branch.

## Stashing

| Command | What it does |
|---------|-------------|
| `git stash` | Save uncommitted changes and clean working tree |
| `git stash push -m "name"` | Stash with a descriptive name |
| `git stash list` | List all stashes |
| `git stash pop` | Apply most recent stash and remove it |
| `git stash apply stash@{N}` | Apply a specific stash (keep it in list) |
| `git stash drop stash@{N}` | Delete a specific stash |
| `git stash clear` | Delete all stashes |

## Syncing

| Command | What it does |
|---------|-------------|
| `git fetch` | Download remote changes without merging |
| `git fetch --prune` | Fetch and delete local refs to deleted remote branches |
| `git pull` | Fetch + merge remote into current branch |
| `git pull --rebase` | Fetch + rebase instead of merge (cleaner history) |
| `git push` | Push current branch to remote |
| `git push -u origin <branch>` | Push and set upstream tracking |
| `git push --force-with-lease` | Force push safely (fails if remote has new commits you haven't seen) |
