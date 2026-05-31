---
name: docker-debug-js
description: >
  Guides the full workflow for debugging Heiberg Next.js/TypeScript frontends running in Docker
  using Node.js --inspect + nvim-dap remote attach. Use this skill whenever the user asks about
  debugging JavaScript or TypeScript inside Docker, attaching nvim-dap to a Node.js process,
  setting up pwa-node remote attach, the debug-frontend compose files, the Yazi JS debug trigger,
  source maps for Next.js, or wants to add a new frontend project to the debug setup.
  Also use when breakpoints aren't hitting in TS/JS, the debugger won't connect to the frontend
  container, or the user asks "how do I debug eating-plan / workout-plan frontend".
---

# Docker Debug JS/TS

The Heiberg setup uses Node.js `--inspect` inside the container (via `NODE_OPTIONS`) and
**nvim-dap**'s `pwa-node` adapter on the host — connected over a forwarded port. Everything is
wired; this is your cheat-sheet.

## Port map

| Project | Debug port | App port | DAP config name |
|---|---|---|---|
| eating-plan frontend | 9229 | 3000 | Docker: eating-plan frontend |
| workout-plan frontend | 9230 | 3001 | Docker: workout-plan frontend |

Python backend ports (separate): eating-plan 5678, workout-plan 5679.

## Starting a debug session

### Option A — From Yazi (recommended)

1. Browse to any `.ts` / `.tsx` / `.js` file inside `eating-plan/app/frontend/` or `workout-plan/app/frontend/`
2. Press `<C-j>` (Ctrl+J — "J" for JavaScript)
3. The script `yazi-debug-js` will:
   - Detect the project from the file path
   - Start the debug frontend container if the port isn't already listening
   - Open nvim at that file
4. Inside nvim: set a breakpoint with `<leader>b`, then `<F5>` → select the project config → attach

### Option B — From nvim directly

```bash
# In a terminal, start the debug frontend for the project you want:
cd ~/Development/heiberg-systems/eating-plan/app
docker compose -f docker-compose.yml -f docker-compose.debug-frontend.yml up frontend

# Then in nvim (any frontend TS/JS file):
# 1. <leader>b  → set breakpoint
# 2. <F5>       → picker appears → select "Docker: eating-plan frontend"
```

## nvim DAP keybindings

| Key | Action |
|---|---|
| `<leader>b` | Toggle breakpoint |
| `<F5>` | Start / continue (opens picker on first use) |
| `<F10>` | Step over |
| `<F11>` | Step into |

The dap-ui panels open and close automatically on attach/detach.

## What you can and can't debug

**Server-side code (Node.js process)** — debuggable with this setup:
- API route handlers (`app/api/*/route.ts`)
- Server components (their Node.js render pass)
- Server actions
- Next.js middleware

**Client-side code (browser bundle)** — NOT debuggable with Node.js `--inspect`:
- Event handlers in client components
- Browser-only effects

For client-side debugging use Chrome DevTools (`<C-p>` → DevTools on port 3000/3001) or the chrome-devtools MCP.

## Source maps

**workout-plan** runs `next dev` — source maps work automatically; you'll see TypeScript source.

**eating-plan** runs `node server.js` (standalone production build). Source maps are enabled via
`experimental.serverSourceMaps: true` in `next.config.js`. This requires a **rebuild** after any
`next.config.js` change:

```bash
cd eating-plan/app
docker compose build --no-cache frontend
```

Without a rebuild, the debugger still connects but you'll step through compiled JS rather than TypeScript.

## One-time setup (already done)

The following are already installed:

| File | Location | Purpose |
|---|---|---|
| `docker-compose.debug-frontend.yml` | `eating-plan/app/` and `workout-plan/app/` | Adds `NODE_OPTIONS --inspect` + port forward |
| `experimental.serverSourceMaps` | `eating-plan/app/frontend/next.config.js` | Includes TS source maps in standalone build |
| nvim-dap frontend configs | `~/.config/nvim/lua/plugins/dap.lua` | `pwa-node` remote attach for both projects |
| `yazi-debug-js` | `~/.local/bin/` | Yazi trigger script |
| `<C-j>` keymap | `~/.config/yazi/keymap.toml` | Yazi key binding |

## Yazi setup (if reinstalling)

```bash
# Install the trigger script
cp ~/.claude/skills/docker-debug-js/scripts/yazi-debug-js.sh ~/.local/bin/yazi-debug-js
chmod +x ~/.local/bin/yazi-debug-js
```

Add to `~/.config/yazi/keymap.toml` inside `[mgr] prepend_keymap`:
```toml
{ on = "<C-j>", run = "shell 'yazi-debug-js %h' --block", desc = "JS/TS: debug hovered file in Docker (Node --inspect + nvim-dap)" },
```

Then sync: `bash ~/Development/heiberg-config/sync.sh`

## Adding a new project

1. Create `<project>/app/docker-compose.debug-frontend.yml` — pick a free host port:
```yaml
services:
  frontend:
    environment:
      NODE_OPTIONS: "--inspect=0.0.0.0:9229"
    ports:
      - "<HOST_DEBUG_PORT>:9229"
```

2. If the project uses a standalone production build, add to its `next.config.js`:
```js
experimental: { serverSourceMaps: true }
```
Then rebuild: `docker compose build --no-cache frontend`

3. Add an entry to `~/.config/nvim/lua/plugins/dap.lua` in the frontend loop:
```lua
{ name = "my-project", path = "my-project/app/frontend", port = <HOST_DEBUG_PORT> },
```

4. Add the project to `~/.local/bin/yazi-debug-js` (the `if/elif` block).

5. Run `bash ~/Development/heiberg-config/sync.sh` to persist nvim config.

## Common gotchas

**Debugger connects but breakpoints are grey / "unverified"**
Source maps aren't resolving. For eating-plan: rebuild the frontend image after enabling
`experimental.serverSourceMaps`. For workout-plan: check that the volume mount is active
(`docker compose ps` — volume mounts only apply when compose started the container).

**"Connection refused" on attach**
The Node inspector isn't listening. Check `NODE_OPTIONS` is set in the running container:
```bash
docker compose exec frontend env | grep NODE_OPTIONS
```
If blank, the container wasn't started with the debug compose override.

**Breakpoints hit in wrong file / wrong line**
Path mapping mismatch. The `localRoot`/`remoteRoot` in `dap.lua` maps `/app` (container build path)
to your local frontend directory. If the project's `WORKDIR` differs from `/app`, update `remoteRoot`.

**Can't step into Next.js internals**
`skipFiles: ["<node_internals>/**"]` skips Node built-ins but not Next.js framework code.
To step into Next.js source, remove or narrow the `skipFiles` entry temporarily.

**workout-plan: code changes not reflected**
The volume mount `./frontend:/app` should make changes live. If not, the container's
`node_modules` may be stale — restart: `docker compose restart frontend`.
