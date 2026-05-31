# tmux Shortcuts

Config: none (`~/.tmux.conf` does not exist — all defaults)  
Prefix key: `Ctrl+B` (press, release, then the key)

## Panes — the main reason to use tmux in Konsole

| Key | Action |
|-----|--------|
| `Prefix %` | Split pane vertically (left/right) |
| `Prefix "` | Split pane horizontally (top/bottom) |
| `Prefix z` | **Zoom / maximize focused pane** (same key to restore) |
| `Prefix x` | Close focused pane |
| `Prefix Arrow` | Move focus to pane in that direction |
| `Prefix Ctrl+Arrow` | Resize pane (hold Ctrl, tap arrow repeatedly) |
| `Prefix {` / `Prefix }` | Swap pane left / right |
| `Prefix q` | Show pane numbers (press the number to jump) |
| `Prefix !` | Break pane out into its own window |

## Windows (tabs)

| Key | Action |
|-----|--------|
| `Prefix c` | New window |
| `Prefix ,` | Rename current window |
| `Prefix &` | Close current window |
| `Prefix n` / `Prefix p` | Next / previous window |
| `Prefix 0–9` | Switch to window by number |
| `Prefix w` | Visual window list (pick with arrow keys) |

## Sessions

| Key | Action |
|-----|--------|
| `Prefix d` | Detach from session (leaves it running) |
| `Prefix $` | Rename current session |
| `Prefix s` | Session list (switch between sessions) |
| `tmux ls` | List sessions (from shell) |
| `tmux attach` | Re-attach to last session (from shell) |
| `tmux new -s name` | Start named session (from shell) |

## Copy mode (scrollback)

| Key | Action |
|-----|--------|
| `Prefix [` | Enter copy mode (scroll with arrow keys or PgUp/PgDn) |
| `q` | Exit copy mode |
| `Space` | Start selection (in copy mode) |
| `Enter` | Copy selection and exit copy mode |
| `Prefix ]` | Paste copied text |

## Misc

| Key | Action |
|-----|--------|
| `Prefix ?` | Show all keybindings |
| `Prefix :` | Open tmux command prompt |
| `Prefix t` | Show clock |
