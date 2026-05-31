# Git — Branching

## Creating & switching

| Command | What it does |
|---------|-------------|
| `git branch` | List local branches |
| `git branch -a` | List all branches (local + remote) |
| `git branch <name>` | Create a branch (stay on current) |
| `git switch <name>` | Switch to a branch |
| `git switch -c <name>` | Create and switch in one step |
| `git switch -c <name> origin/<name>` | Create local branch tracking a remote branch |
| `git branch -d <name>` | Delete a branch (safe — refuses if unmerged) |
| `git branch -D <name>` | Force delete a branch |
| `git branch -m <old> <new>` | Rename a branch |

## Merging

| Command | What it does |
|---------|-------------|
| `git merge <branch>` | Merge branch into current (creates merge commit) |
| `git merge --no-ff <branch>` | Force a merge commit even when fast-forward is possible |
| `git merge --squash <branch>` | Squash all branch commits into one staged change (then commit manually) |
| `git merge --abort` | Abort an in-progress merge |

## Rebasing

Rebase replays your commits on top of another branch — produces a linear history.

| Command | What it does |
|---------|-------------|
| `git rebase <branch>` | Rebase current branch onto `<branch>` |
| `git rebase -i HEAD~N` | Interactive rebase — rewrite last N commits (squash, reword, drop, reorder) |
| `git rebase -i origin/main` | Interactive rebase of all commits not yet on main |
| `git rebase --abort` | Abort an in-progress rebase |
| `git rebase --continue` | Continue after resolving a conflict |
| `git rebase --skip` | Skip the current conflicting commit |

> ⚠️ Never rebase commits that have been pushed to a shared branch — it rewrites history.

### Interactive rebase actions (used inside `git rebase -i`)

| Action | Shorthand | What it does |
|--------|-----------|-------------|
| `pick` | `p` | Keep commit as-is |
| `reword` | `r` | Keep commit but edit its message |
| `edit` | `e` | Pause to amend the commit |
| `squash` | `s` | Meld into previous commit (combine messages) |
| `fixup` | `f` | Meld into previous commit (discard this message) |
| `drop` | `d` | Delete the commit entirely |

## Cherry-pick

Copy a specific commit from any branch onto the current branch.

| Command | What it does |
|---------|-------------|
| `git cherry-pick <hash>` | Apply a single commit |
| `git cherry-pick <hash1>..<hash2>` | Apply a range of commits |
| `git cherry-pick --no-commit <hash>` | Apply changes without committing (stage only) |
| `git cherry-pick --abort` | Abort an in-progress cherry-pick |

## Conflict resolution

When a merge/rebase/cherry-pick hits a conflict:

1. Open conflicted files — look for `<<<<<<`, `=======`, `>>>>>>>`
2. Edit to resolve
3. `git add <file>` — mark resolved
4. `git merge --continue` / `git rebase --continue` / `git cherry-pick --continue`
