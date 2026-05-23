# syntax=docker/dockerfile:1.6

# === Stage 1: tv2 ===============================================================
# Debian trixie-slim base. Mason LSP binaries assume glibc; Alpine/musl breaks
# them. Trixie (glibc 2.39+) is required because the npm-distributed
# tree-sitter-cli binary is built against glibc 2.39 and won't run on bookworm.
FROM debian:trixie-slim

ARG TARGETARCH

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    NVIM_APPNAME=tv2 \
    IN_DOCKER=1 \
    XDG_CONFIG_HOME=/opt/tv2/config \
    XDG_DATA_HOME=/opt/tv2/share \
    XDG_STATE_HOME=/opt/tv2/state \
    XDG_CACHE_HOME=/opt/tv2/cache \
    HOME=/opt/tv2

RUN mkdir -p /opt/tv2/config /opt/tv2/share /opt/tv2/state /opt/tv2/cache

# === System packages ============================================================
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates curl git unzip xz-utils tar \
      ripgrep fd-find fzf \
      gcc make \
      lua5.1 luarocks \
      locales \
 && rm -rf /var/lib/apt/lists/* \
 && ln -s /usr/bin/fdfind /usr/local/bin/fd

# === Neovim =====================================================================
RUN set -eux; \
    case "${TARGETARCH}" in \
      amd64) nvim_arch=x86_64 ;; \
      arm64) nvim_arch=arm64 ;; \
      *) echo "unsupported arch: ${TARGETARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${nvim_arch}.tar.gz" \
      -o /tmp/nvim.tar.gz; \
    tar -xz -C /opt -f /tmp/nvim.tar.gz; \
    rm /tmp/nvim.tar.gz; \
    ln -s "/opt/nvim-linux-${nvim_arch}/bin/nvim" /usr/local/bin/nvim

# === lazygit ====================================================================
RUN set -eux; \
    case "${TARGETARCH}" in \
      amd64) lg_arch=x86_64 ;; \
      arm64) lg_arch=arm64 ;; \
      *) echo "unsupported arch: ${TARGETARCH}"; exit 1 ;; \
    esac; \
    LAZYGIT_VERSION=$(curl -sL "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*'); \
    curl -fsSL "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_${lg_arch}.tar.gz" \
      -o /tmp/lazygit.tar.gz; \
    tar -xzf /tmp/lazygit.tar.gz -C /usr/local/bin lazygit; \
    rm /tmp/lazygit.tar.gz

# === Node.js 20 LTS =============================================================
ENV NODE_VERSION=20.18.0
RUN set -eux; \
    case "${TARGETARCH}" in \
      amd64) node_arch=x64 ;; \
      arm64) node_arch=arm64 ;; \
      *) echo "unsupported arch: ${TARGETARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${node_arch}.tar.xz" \
      -o /tmp/node.tar.xz; \
    tar -xJf /tmp/node.tar.xz -C /opt; \
    rm /tmp/node.tar.xz; \
    ln -s "/opt/node-v${NODE_VERSION}-linux-${node_arch}" /opt/node

ENV PATH="/opt/node/bin:${PATH}"

# tree-sitter CLI — required by nvim-treesitter (main branch) at parser
# install/compile time. Without this, ts.install() fails with
# "ENOENT: no such file or directory (cmd): 'tree-sitter'".
RUN npm install -g tree-sitter-cli

# === Go =========================================================================
ENV GO_VERSION=1.23.2
RUN set -eux; \
    case "${TARGETARCH}" in \
      amd64) go_arch=amd64 ;; \
      arm64) go_arch=arm64 ;; \
      *) echo "unsupported arch: ${TARGETARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-${go_arch}.tar.gz" \
      -o /tmp/go.tar.gz; \
    tar -xzf /tmp/go.tar.gz -C /usr/local; \
    rm /tmp/go.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

# === Config =====================================================================
# Copy the host config in. The .dockerignore at the repo root keeps .git, docs,
# CLAUDE.md, etc. out of the build context.
COPY . /opt/tv2/config/tv2

# Remove AI plugins (host repo untouched; this only edits the image layer).
RUN rm -f \
      /opt/tv2/config/tv2/lua/plugins/avante.lua \
      /opt/tv2/config/tv2/lua/plugins/chatGPT.lua \
      /opt/tv2/config/tv2/lua/plugins/codeium-windsurf.lua

# Install the OSC52 clipboard helper inside the image and wire it into init.lua.
# This is the only modification to the image's copy of the config.
RUN cp /opt/tv2/config/tv2/docker/docker_clipboard.lua \
       /opt/tv2/config/tv2/lua/user/docker_clipboard.lua \
 && printf '\n-- Docker-only: OSC52 clipboard\nif vim.env.IN_DOCKER == "1" then pcall(require, "user.docker_clipboard") end\n' \
       >> /opt/tv2/config/tv2/init.lua

# === Headless bootstrap =========================================================
# Install all plugins via lazy.nvim sync. Headless mode plus +Lazy! sync (note
# the !) forces synchronous install of every plugin. The nvim-treesitter init
# function blocks until core parsers are installed (30s timeout per the plugin
# config).
RUN nvim --headless "+Lazy! sync" +qa

# Install the three LSPs we want baked in. Uses our helper script because
# :MasonInstall is async and would exit before installs complete.
# Note: must use luafile (not -l) so nvim's runtimepath and Mason modules are loaded.
RUN nvim --headless -c "luafile /opt/tv2/config/tv2/docker/bootstrap_mason.lua" -c "qa"

# Best-effort parser update (may no-op if :TSUpdateSync isn't available in this
# nvim-treesitter version; parsers were already installed by :Lazy! sync).
RUN nvim --headless "+TSUpdateSync" +qa || true

# Make the baked plugin/LSP data world-readable so the runtime user (whatever
# UID the wrapper passes via -u) can read it. Cache and state need to be
# writable too — nvim writes luac bytecode to cache on every load, and state
# (shada, undodir) is normally written but typically bind-mounted from the
# host at runtime.
RUN chmod -R a+rX /opt/tv2/share /opt/tv2/config \
 && chmod -R a+rwX /opt/tv2/cache /opt/tv2/state

# === Entrypoint =================================================================
WORKDIR /work
ENTRYPOINT ["nvim"]
