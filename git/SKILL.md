---
name: git
description: >
  Teaches and shows git commands — everyday use, branching, history inspection, undoing mistakes,
  remote operations, and common workflows. Use this skill whenever the user asks about git commands,
  how to do something with git, git concepts, or needs a workflow explained ("how do I undo a commit?",
  "show me git commands", "how does rebase work?", "what's the difference between reset and revert?",
  "how do I squash commits?"). Trigger even for casual phrasing like "how do I go back to before my last commit".
---

# Git Command Reference Skill

## How to respond

- **Specific question** ("how do I undo a commit?") → answer directly with the command(s), explain briefly, then offer the relevant section.
- **Broad request** ("show me all git commands") → present all reference files in order.
- **Concept question** ("how does rebase work?") → explain the concept, then show the relevant commands.
- Always show the actual command syntax. For destructive commands, note the risk.

## Reference files

| File | Contents | When to read |
|------|----------|--------------|
| `references/everyday.md` | status, add, commit, push, pull, fetch, stash | Daily workflow questions |
| `references/branching.md` | branch, switch, merge, rebase, cherry-pick | Branch management questions |
| `references/history.md` | log, diff, show, blame, reflog | Inspection / history questions |
| `references/undoing.md` | restore, reset, revert, clean | "How do I undo / fix" questions |
| `references/remote.md` | remote, fetch, pull, push, tags | Remote / collaboration questions |
| `references/workflows.md` | Feature branch, hotfix, squash, submodules | "How do I do X end-to-end" questions |

Read only the file(s) relevant to the question.
