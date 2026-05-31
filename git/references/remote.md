# Git — Remote Operations

## Managing remotes

| Command | What it does |
|---------|-------------|
| `git remote -v` | List remotes with URLs |
| `git remote add origin <url>` | Add a remote named `origin` |
| `git remote set-url origin <url>` | Change the URL of an existing remote |
| `git remote rename <old> <new>` | Rename a remote |
| `git remote remove <name>` | Remove a remote |

## Fetching & pulling

| Command | What it does |
|---------|-------------|
| `git fetch` | Download all remote changes (no merge) |
| `git fetch origin <branch>` | Fetch a specific remote branch |
| `git fetch --prune` | Fetch and delete stale remote-tracking refs |
| `git pull` | Fetch + merge into current branch |
| `git pull --rebase` | Fetch + rebase (linear history, no merge commits) |
| `git pull origin <branch>` | Pull a specific remote branch into current |

## Pushing

| Command | What it does |
|---------|-------------|
| `git push` | Push current branch to its upstream |
| `git push -u origin <branch>` | Push and set upstream tracking |
| `git push origin <branch>` | Push a specific branch |
| `git push origin --delete <branch>` | Delete a remote branch |
| `git push --force-with-lease` | Force push safely (aborts if remote has new commits) |
| `git push --tags` | Push all local tags |

> ⚠️ Never force push to `main` / `master` on a shared repo.

## Tags

| Command | What it does |
|---------|-------------|
| `git tag` | List all tags |
| `git tag <name>` | Create a lightweight tag at HEAD |
| `git tag -a <name> -m "message"` | Create an annotated tag |
| `git tag -a <name> <hash>` | Tag a specific commit |
| `git push origin <tag>` | Push a specific tag |
| `git push origin --tags` | Push all tags |
| `git tag -d <name>` | Delete a local tag |
| `git push origin --delete <tag>` | Delete a remote tag |

## Tracking branches

| Command | What it does |
|---------|-------------|
| `git branch -vv` | Show local branches with their upstream tracking status |
| `git branch --set-upstream-to=origin/<branch>` | Set upstream for current branch |
| `git branch -u origin/<branch>` | Shorthand for set-upstream |
