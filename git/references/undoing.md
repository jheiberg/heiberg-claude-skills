# Git — Undoing Things

## Quick decision guide

| Situation | Command |
|-----------|---------|
| Discard changes in a file (not staged) | `git restore <file>` |
| Unstage a file (keep changes) | `git restore --staged <file>` |
| Undo last commit (keep changes staged) | `git reset --soft HEAD~1` |
| Undo last commit (keep changes unstaged) | `git reset HEAD~1` |
| Undo last commit AND discard changes | `git reset --hard HEAD~1` |
| Undo a pushed commit safely | `git revert <hash>` |
| Recover a lost commit | `git reflog` then `git reset --hard <hash>` |

---

## git restore

| Command | What it does |
|---------|-------------|
| `git restore <file>` | Discard unstaged changes in a file (⚠️ irreversible) |
| `git restore .` | Discard all unstaged changes |
| `git restore --staged <file>` | Unstage a file (changes remain in working tree) |
| `git restore --source=<hash> <file>` | Restore a file to how it was at a specific commit |

## git reset

Moves HEAD (and optionally the index and working tree) to a different commit.

| Command | What it does |
|---------|-------------|
| `git reset --soft HEAD~1` | Undo last commit — keep changes **staged** |
| `git reset HEAD~1` | Undo last commit — keep changes **unstaged** |
| `git reset --hard HEAD~1` | Undo last commit — **discard all changes** ⚠️ |
| `git reset --hard origin/main` | Reset branch to match remote exactly ⚠️ |

> ⚠️ `--hard` permanently discards uncommitted work. Use `git stash` first if unsure.  
> ⚠️ Never reset commits that have been pushed to a shared branch.

## git revert

Creates a new commit that undoes a previous one — safe for shared/pushed branches.

| Command | What it does |
|---------|-------------|
| `git revert <hash>` | Create a new commit that undoes `<hash>` |
| `git revert HEAD` | Revert the most recent commit |
| `git revert <hash> --no-commit` | Stage the revert without committing yet |
| `git revert <hash1>..<hash2>` | Revert a range of commits |

## git clean

Remove untracked files and directories.

| Command | What it does |
|---------|-------------|
| `git clean -n` | Dry run — show what would be deleted |
| `git clean -f` | Delete untracked files ⚠️ |
| `git clean -fd` | Delete untracked files and directories ⚠️ |
| `git clean -fx` | Delete untracked + gitignored files ⚠️ |

> ⚠️ Always run `git clean -n` first — deleted files cannot be recovered.

## Recovering lost work

If you reset too far or rebased away commits, use the reflog:

```bash
git reflog                         # find the hash of the lost commit
git reset --hard <hash>            # jump back to it
# or to recover just a file:
git restore --source=<hash> <file>
```
