# Neovim Shortcuts

Config: `~/.config/nvim/`  
Leader key: `Space`

## Custom — Window splits (`lua/core/keymaps.lua`)

| Key | Action |
|-----|--------|
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Make all splits equal size |
| `<leader>sx` | Close current split |

## Custom — General (`lua/core/keymaps.lua`)

| Key | Action |
|-----|--------|
| `jk` (insert mode) | Exit insert mode (alternative to `Esc`) |
| `<leader>nh` | Clear search highlights |
| `Ctrl+N` | Toggle Neo-tree file explorer (left panel) |

## Custom — LSP (`lua/plugins/lsp.lua`, active when LSP attaches)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Show hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action (quick fix, extract, etc.) |

Format on save is automatic — no keybinding needed.

## Custom — Debugging / DAP (`lua/plugins/dap.lua`)

| Key | Action |
|-----|--------|
| `<leader>b` | Toggle breakpoint |
| `F5` | Start debug session / continue |
| `F10` | Step over |
| `F11` | Step into |

To attach to a Docker container: `F5` → pick **Docker: eating-plan** (port 5678) or **Docker: workout-plan** (port 5679).

## Default — Modes

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at line start |
| `A` | Insert at line end |
| `o` / `O` | Open new line below / above |
| `v` | Visual (character) mode |
| `V` | Visual line mode |
| `Ctrl+v` | Visual block mode |
| `Esc` or `jk` | Return to normal mode |

## Default — Navigation

| Key | Action |
|-----|--------|
| `h/j/k/l` | Left / down / up / right |
| `w` / `b` | Next / previous word |
| `e` | End of word |
| `0` / `$` | Line start / end |
| `gg` / `G` | File start / end |
| `Ctrl+d` / `Ctrl+u` | Half-page down / up |
| `Ctrl+f` / `Ctrl+b` | Full page down / up |
| `{` / `}` | Jump paragraph up / down |
| `%` | Jump to matching bracket |

## Default — Editing

| Key | Action |
|-----|--------|
| `dd` / `d$` | Delete line / to end of line |
| `yy` / `y$` | Yank line / to end of line |
| `p` / `P` | Paste after / before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `r` | Replace single character |
| `.` | Repeat last change |
| `ciw` / `diw` | Change / delete word |
| `ci(` / `di(` | Change / delete inside parentheses |
| `ci"` / `di"` | Change / delete inside quotes |
| `>>`  / `<<` | Indent / unindent line |

## Default — Search

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Next / previous result |
| `*` / `#` | Search word under cursor forward / backward |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |

## Default — Windows & tabs

| Key | Action |
|-----|--------|
| `Ctrl+w v` | Vertical split |
| `Ctrl+w s` | Horizontal split |
| `Ctrl+w h/j/k/l` | Move between panes |
| `Ctrl+w =` | Equalise all pane sizes |
| `Ctrl+w >` | Increase pane width (prefix count for bigger step, e.g. `5 Ctrl+w >`) |
| `Ctrl+w <` | Decrease pane width |
| `Ctrl+w +` | Increase pane height |
| `Ctrl+w -` | Decrease pane height |
| `:tabnew` | New tab |
| `gt` / `gT` | Next / previous tab |

## Default — Diff mode (active in `nvim -d` or `:diffthis`)

| Key | Action |
|-----|--------|
| `]c` | Jump to next change |
| `[c` | Jump to previous change |
| `do` | Diff obtain — pull change from other buffer into current |
| `dp` | Diff put — push change from current buffer into other |
| `:diffupdate` | Refresh diff highlighting |
| `:diffoff` | Exit diff mode |
| `:diffthis` | Make current window part of a diff |
| `zo` / `zc` | Open / close fold (show surrounding context) |
| `zR` | Open all folds (show full file) |

## Default — File & session

| Key | Action |
|-----|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `:e filename` | Open file |
| `Ctrl+o` / `Ctrl+i` | Jump back / forward in location history |
