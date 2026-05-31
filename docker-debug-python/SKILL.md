---
name: docker-debug-python
description: >
  Guides the full workflow for debugging Heiberg Python/FastAPI backends running in Docker using
  debugpy + nvim-dap remote attach. Use this skill whenever the user asks about debugging Python
  inside Docker, attaching nvim-dap to a container, setting up debugpy, the debug compose files,
  the Yazi debug trigger, nvim DAP keybindings, or wants to add a new project to the debug setup.
  Also use when the user says the debugger isn't connecting, breakpoints aren't hitting, or asks
  "how do I debug eating-plan / workout-plan".
---

# Docker Debug Python

The Heiberg setup uses **debugpy** inside the container and **nvim-dap** on the host — connected over a forwarded port. Everything is already wired; this is your cheat-sheet.

## Port map

| Project | Debug port | App port | DAP config name |
|---|---|---|---|
| eating-plan | 5678 | 8000 | Docker: eating-plan |
| workout-plan | 5679 | 8001 | Docker: workout-plan |

## Starting a debug session

### Option A — From Yazi (recommended)

1. Browse to any Python file inside `eating-plan/app/backend/` or `workout-plan/app/backend/`
2. Press `<C-p>` (Ctrl+P — "Python debug")
3. The script `yazi-debug-python` (in `~/.local/bin/`) will:
   - Detect the project from the file path
   - Start the debug container if the port isn't already listening
   - Open nvim at that file
4. Inside nvim: set a breakpoint with `<leader>b`, then `<F5>` → select the project config → attach

> **Setup:** If `<C-p>` isn't in your Yazi keymap yet, see the "Yazi setup" section below.

### Option B — From nvim directly

```bash
# In a terminal, start the debug backend for the project you want:
cd ~/Development/heiberg-systems/eating-plan/app
docker compose -f docker-compose.yml -f docker-compose.debug.yml up backend

# Then in nvim (any backend Python file):
# 1. <leader>b  → set breakpoint
# 2. <F5>       → picker appears → select "Docker: eating-plan"
```

## nvim DAP keybindings

| Key | Action |
|---|---|
| `<leader>b` | Toggle breakpoint |
| `<F5>` | Start / continue (opens picker on first use) |
| `<F10>` | Step over |
| `<F11>` | Step into |

The dap-ui panels open and close automatically on attach/detach.

## Yazi setup (one-time)

### 1. Install the trigger script

The bundled script lives at `scripts/yazi-debug-python.sh` in this skill directory.
Copy it to `~/.local/bin/` (already on PATH via heiberg-config):

```bash
cp ~/.claude/skills/docker-debug-python/scripts/yazi-debug-python.sh ~/.local/bin/yazi-debug-python
chmod +x ~/.local/bin/yazi-debug-python
```

Then add it to `sync.sh` in `~/Development/heiberg-config/` if you want it tracked:

```bash
cp ~/.local/bin/yazi-debug-python "$TARGET/.local/bin/yazi-debug-python"
```

### 2. Add the keymap to Yazi

In `~/Development/heiberg-config/.config/yazi/keymap.toml`, add inside `[mgr] prepend_keymap`:

```toml
{ on = "<C-p>", run = "shell 'yazi-debug-python %h' --block", desc = "Python: debug hovered file in Docker" },
```

After editing: `bash ~/Development/heiberg-config/sync.sh` to push to `~/.config/yazi/`.

## Adding a new project

1. Add `debugpy>=1.8.0` to `<project>/app/backend/requirements.txt`
2. Create `<project>/app/docker-compose.debug.yml`:

```yaml
services:
  backend:
    command: >
      python -m debugpy --listen 0.0.0.0:5678
      -m uvicorn main:app --host 0.0.0.0 --port <APP_PORT>
    ports:
      - "<HOST_DEBUG_PORT>:5678"
```

3. Add a row to `~/.config/nvim/lua/plugins/dap.lua` inside the `for _, proj in ipairs({...})` loop:

```lua
{ name = "my-project", path = "my-project/app/backend", port = <HOST_DEBUG_PORT> },
```

4. Add the project to the detection block in `~/.local/bin/yazi-debug-python` (see the script).

5. Rebuild the image: `docker compose build --no-cache backend`

6. Commit both `dap.lua` (via heiberg-config) and the debug compose file (in the project repo).

## Common gotchas

**Breakpoints not hit / "no module named debugpy"**
The image is stale. Rebuild: `docker compose build --no-cache backend`

**Port already in use on start**
A previous debug session's container is still running. `docker compose down` first.

**Attached but execution never pauses**
Check that you set the breakpoint *before* attaching, or trigger the code path again after attaching.

**Can't step into library code**
`justMyCode = false` is already set in `dap.lua` — you should be able to step in. If not, verify the nvim-dap config reloaded (`source ~/.config/nvim/lua/plugins/dap.lua` or restart nvim).

**Hot-reload is off in debug mode**
Intentional — uvicorn's reloader spawns subprocess that breaks debugpy. To pick up a code change, restart the container:
```bash
docker compose -f docker-compose.yml -f docker-compose.debug.yml restart backend
```
