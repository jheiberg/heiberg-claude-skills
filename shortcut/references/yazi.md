# Yazi Shortcuts

Config: `~/.config/yazi/keymap.toml`

## Custom keybindings (Jako's config)

| Key | Action |
|-----|--------|
| `Ctrl+S` | Open interactive bash shell in current directory (blocks Yazi until shell exits) |
| `Ctrl+D` | Diff selected file(s) vs hovered file — Space-select file(s), hover the other, press. Opens `nvim -d` side-by-side. Supports 2–8 files. |
| `Ctrl+G` | Git diff hovered file vs HEAD (working-tree changes). Opens read-only in Neovim. |
| `Alt+G` | Git diff hovered file staged changes vs HEAD (index vs HEAD). Opens read-only in Neovim. |
| `Ctrl+H` | Pick 1 or 2 commits via fzf and diff the hovered file. 1 commit → diff vs working tree. 2 commits (Tab to mark) → diff between them. |
| `b` | Open hovered file in Google Chrome |

## Default navigation

| Key | Action |
|-----|--------|
| `h` / `l` | Go up / enter directory |
| `j` / `k` | Move down / up |
| `Enter` | Open file or enter directory |
| `gg` / `G` | Jump to first / last item |
| `~` | Go to home directory |
| `z` | Jump to directory (zoxide) |
| `.` | Toggle hidden files |

## Default file operations

| Key | Action |
|-----|--------|
| `Space` | Select / deselect file |
| `v` | Visual select (select range) |
| `a` | Create file (append `/` to create directory) |
| `r` | Rename hovered file |
| `y` | Yank (copy) selection |
| `x` | Cut selection |
| `p` | Paste |
| `d` | Move to trash |
| `D` | Delete permanently |
| `Y` / `X` | Cancel yank / cut |

## Default search & filter

| Key | Action |
|-----|--------|
| `f` | Filter files in current directory |
| `/` | Search across directories |
| `n` / `N` | Next / previous search result |

## Default tabs

| Key | Action |
|-----|--------|
| `t` | New tab |
| `[` / `]` | Previous / next tab |
| `q` | Close tab (or quit if last tab) |

## Default misc

| Key | Action |
|-----|--------|
| `e` | Open hovered file in `$EDITOR` (nvim) |
| `i` | Inspect file info |
| `?` | Help / keybinding list |
