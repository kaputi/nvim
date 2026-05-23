# /docker

Image-only assets for the tv2 Docker variant. Files in this directory are
referenced exclusively by the root `Dockerfile`; nothing here is loaded by
the host tv2 install.

- `docker_clipboard.lua` — OSC52 clipboard provider, sourced inside the
  image when `IN_DOCKER=1`.
- `bootstrap_mason.lua` — Run once during `docker build` to synchronously
  install LSPs into the baked image.
