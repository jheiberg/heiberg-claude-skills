# Git — Common Workflows

## Feature branch workflow

The standard way to work on a new feature or fix without touching `main`.

```bash
git switch main
git pull                              # start from latest main
git switch -c feat/my-feature         # create feature branch
# ... do work, commit often ...
git push -u origin feat/my-feature    # push branch to remote
# create PR on GitHub, get review, merge
git switch main
git pull                              # pick up the merge
git branch -d feat/my-feature         # clean up local branch
```

## Squash commits before merging

Collapse messy WIP commits into one clean commit.

```bash
git rebase -i origin/main             # interactive rebase against main
# in the editor: change 'pick' to 'squash' (or 'f' for fixup) on all but the first commit
# save — git opens another editor for the combined commit message
git push --force-with-lease           # update the remote branch
```

## Sync a feature branch with main (rebase)

Keep your branch up to date with main without merge commits.

```bash
git fetch origin
git rebase origin/main                # replay your commits on top of latest main
# resolve any conflicts, then: git rebase --continue
git push --force-with-lease           # rewriting history requires force push
```

## Hotfix on a released tag

```bash
git switch -c hotfix/v1.2.1 v1.2.0   # branch from the tag
# fix the bug, commit
git tag -a v1.2.1 -m "hotfix: ..."    # tag the fix
git push origin hotfix/v1.2.1 --tags
# cherry-pick the fix back onto main if needed:
git switch main && git cherry-pick <fix-hash>
```

## Undo a bad merge on main (not yet pushed)

```bash
git reset --hard ORIG_HEAD            # ORIG_HEAD is set automatically after a merge
```

## Move commits to a new branch (forgot to branch first)

```bash
# you committed on main by mistake — move those commits to a new branch
git switch -c feat/my-feature         # create branch at current position
git switch main
git reset --hard origin/main          # reset main back (⚠️ only if not pushed)
```

## Stash, switch, come back

```bash
git stash push -m "WIP: half-done feature"
git switch main                       # do urgent work on main
git switch feat/my-feature
git stash pop                         # restore your WIP
```

## Delete a file from all history (sensitive data)

```bash
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch path/to/secret.env" \
  --prune-empty --tag-name-filter cat -- --all
git push origin --force --all
```
> ⚠️ Rewrites entire history. All collaborators must re-clone. Consider `git-filter-repo` (faster alternative).

## Submodules — basic operations

| Command | What it does |
|---------|-------------|
| `git submodule add <url> <path>` | Add a submodule |
| `git submodule update --init` | Clone/init all submodules after a fresh clone |
| `git submodule update --remote` | Pull latest from each submodule's tracked branch |
| `git clone --recurse-submodules <url>` | Clone repo and all its submodules in one step |

## Worktrees — work on two branches simultaneously

| Command | What it does |
|---------|-------------|
| `git worktree add <path> <branch>` | Check out a branch in a separate directory |
| `git worktree list` | List all worktrees |
| `git worktree remove <path>` | Remove a worktree |
