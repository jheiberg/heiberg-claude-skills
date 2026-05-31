---
name: shortcut
description: >
  Shows shortcut keys for Yazi (file manager), Konsole (terminal), Neovim, and tmux — both default
  and Jako's custom keybindings. Use this skill whenever the user asks about shortcuts, keybindings,
  hotkeys, or "how do I do X" in any of these four tools. Also use when the user asks to be taught
  or reminded about keyboard shortcuts, even if they phrase it casually ("what's the key for X?",
  "how do I split in nvim?", "remind me how tabs work in Konsole", "how do I zoom a pane in tmux?").
---

# Shortcut Reference Skill

## How to respond

Read the relevant reference file(s) and present a **clean, formatted table** of shortcuts.

- If the user asks about a specific action ("how do I rename in Yazi?") → answer directly with the key, then offer the full table.
- If the user asks about a tool broadly ("show me Yazi shortcuts") → present the full table from the reference file.
- If the user asks about all tools → present all three, custom shortcuts first in each section.
- Always clearly distinguish **custom** (Jako's config) from **default** shortcuts.

## Reference files

| Tool | File | When to read |
|------|------|--------------|
| Yazi | `references/yazi.md` | Any Yazi question |
| Neovim | `references/nvim.md` | Any nvim/vim question |
| Konsole | `references/konsole.md` | Any Konsole/terminal question |
| tmux | `references/tmux.md` | Any tmux question |

Read only the file(s) relevant to the question — no need to load all three for a single-tool query.
