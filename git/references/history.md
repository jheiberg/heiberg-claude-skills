# Git — History & Inspection

## git log

| Command | What it does |
|---------|-------------|
| `git log` | Full commit history |
| `git log --oneline` | One line per commit (hash + message) |
| `git log --oneline --graph --all` | Visual branch graph for all branches |
| `git log --oneline -N` | Last N commits |
| `git log --author="name"` | Commits by a specific author |
| `git log --since="2 weeks ago"` | Commits within a time range |
| `git log -- <file>` | Commits that touched a specific file |
| `git log -p -- <file>` | Commits + diffs for a specific file |
| `git log origin/main..HEAD` | Commits on current branch not yet on main |

## git diff

| Command | What it does |
|---------|-------------|
| `git diff` | Unstaged changes (working tree vs index) |
| `git diff --staged` | Staged changes (index vs last commit) |
| `git diff HEAD` | All changes since last commit |
| `git diff <branch1> <branch2>` | Diff between two branches |
| `git diff <hash1> <hash2>` | Diff between two commits |
| `git diff <hash> -- <file>` | Diff a specific file at a specific commit |
| `git diff --stat` | Summary of changed files and line counts only |
| `git diff --name-only` | Just the filenames of changed files |

## git show

| Command | What it does |
|---------|-------------|
| `git show <hash>` | Show a commit's diff + metadata |
| `git show <hash>:<file>` | Show a file as it was at a specific commit |
| `git show HEAD~1` | Show the commit before the last one |

## git blame

| Command | What it does |
|---------|-------------|
| `git blame <file>` | Show who last changed each line and when |
| `git blame -L 10,20 <file>` | Blame only lines 10–20 |
| `git blame --follow <file>` | Follow file renames |

## git reflog

The safety net — records every movement of HEAD, including resets, rebases, and checkouts.

| Command | What it does |
|---------|-------------|
| `git reflog` | Show all recent HEAD positions |
| `git reflog show <branch>` | Show reflog for a specific branch |

Use `git reflog` to find a commit hash after an accidental reset or rebase — then `git reset --hard <hash>` to recover.

## Searching

| Command | What it does |
|---------|-------------|
| `git grep "pattern"` | Search for a string across all tracked files |
| `git grep "pattern" <branch>` | Search in a specific branch |
| `git log -S "string"` | Find commits that added or removed a specific string |
| `git log --grep="message"` | Find commits by message content |

## git bisect

Binary search through history to find which commit introduced a bug.

```bash
git bisect start
git bisect bad                  # current commit is broken
git bisect good <known-good-hash>
# git checks out a middle commit — test it, then:
git bisect good                 # or: git bisect bad
# repeat until git identifies the first bad commit
git bisect reset                # return to HEAD when done
```
