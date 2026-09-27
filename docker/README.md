# tv2 in Docker

Run the tv2 Neovim config on any machine that has Docker. Nothing else needs
to be installed: nvim, plugins, LSPs and tools are baked into the image.

Image: `ghcr.io/kaputi/tv2:latest` (public, `linux/amd64` only).

## Quick start

1. Install the wrapper script:

   ```bash
   mkdir -p ~/.local/bin
   curl -fsSL https://raw.githubusercontent.com/kaputi/nvim/tv2/tv2-docker \
     -o ~/.local/bin/tv2-docker
   chmod +x ~/.local/bin/tv2-docker
   ```

   Make sure `~/.local/bin` is on your `PATH`.

2. Pull the image (about 1 GB download, 4 GB on disk):

   ```bash
   tv2-docker --update
   ```

3. Open a project:

   ```bash
   cd ~/code/some-project
   tv2-docker .
   ```

## Usage

| Command                  | What it does                                   |
| ------------------------ | ---------------------------------------------- |
| `tv2-docker`             | Open nvim in the current directory             |
| `tv2-docker src/main.go` | Open a file (any nvim args are passed through) |
| `tv2-docker --update`    | Pull the latest image, then exit               |
| `tv2-docker --update .`  | Pull the latest image, then open nvim          |

Environment variables:

| Variable               | Default                     | Purpose                                    |
| ---------------------- | --------------------------- | ------------------------------------------ |
| `TV2_DOCKER_IMAGE`     | `ghcr.io/kaputi/tv2:latest` | Image to run (pin a tag, or a local build) |
| `TV2_DOCKER_STATE_DIR` | `~/.local/share/tv2-docker` | Host dir for shada, undo history, sessions |

Published tags: `latest` and `sha-<short commit>` (e.g. `sha-e1303e8`). A new
image is built on every push to `master` or `tv2` that touches the config.

## Without the wrapper

The wrapper is a thin `docker run`. The equivalent by hand:

```bash
mkdir -p ~/.local/share/tv2-docker
docker run --rm -it \
  -v "$PWD:/work" \
  -v "$HOME/.local/share/tv2-docker:/opt/tv2/state/tv2" \
  -u "$(id -u):$(id -g)" \
  -e TERM -e COLORTERM \
  ghcr.io/kaputi/tv2:latest .
```

Create the state dir first, otherwise Docker creates it owned by root. On
rootless Docker, use `-u 0:0` instead: container root maps to your host user.

## What's in the image

- Neovim (latest stable at build time) with every plugin preinstalled
- LSPs: `lua_ls`, `ts_ls` (typescript-language-server), `gopls`
- Tools: git, lazygit, ripgrep, fd, fzf, gcc, make, tree-sitter CLI
- Runtimes: Node.js 20, Go 1.23, Lua 5.1 + luarocks

Not included:

- AI plugins (avante, ChatGPT, codeium-windsurf) are removed at build time
- LSPs for Haskell, C/C++ (clangd) and Arduino

## Limitations

- **Only the current directory is visible.** It is mounted at `/work`. Paths
  outside it (`tv2-docker ../other/file`) do not exist in the container, so
  `cd` to the project root first.
- **Runtime installs are lost on exit.** The container is removed when nvim
  quits. `:MasonInstall`, `:TSInstall` and `:Lazy update` work for that
  session only. To keep them, add them to the image and rebuild.
- **Clipboard is copy-only.** Yanks to `+`/`*` reach the host clipboard via
  OSC52 (kitty, WezTerm, Alacritty, iTerm2). Inside tmux, set
  `set -g set-clipboard on`. `"+p` does not read the host clipboard; use the
  terminal's paste shortcut instead.
- **Commit and push from the host.** git and lazygit can view, diff and stage,
  but the container has no git identity or SSH keys, so commits and pushes
  fail.
- **amd64 only.** On Apple Silicon, Docker Desktop runs the image under
  emulation (slower). On arm64 Linux, build the image locally instead (below).

## Build locally

The Dockerfile supports both `amd64` and `arm64`:

```bash
git clone -b tv2 https://github.com/kaputi/nvim.git tv2
cd tv2
docker build -t tv2:local .
TV2_DOCKER_IMAGE=tv2:local tv2-docker
```

## Files in this directory

Image-only assets, referenced exclusively by the root `Dockerfile`. Nothing
here is loaded by the host tv2 install.

- `docker_clipboard.lua` — OSC52 clipboard provider, sourced inside the
  image when `IN_DOCKER=1`.
- `bootstrap_mason.lua` — Run once during `docker build` to synchronously
  install LSPs into the baked image.
