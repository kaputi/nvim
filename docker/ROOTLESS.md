# Rootless Docker on Debian

Optional. Installs Docker from Docker's signed apt repo and runs the daemon as
your user instead of root. Tested on Debian 13 (trixie). About 10 minutes.

Already have Docker from Docker's apt repo? Start at step 2.

1. Add Docker's apt repo and check the signing key:

   ```bash
   sudo apt-get update && sudo apt-get install -y ca-certificates curl gpg
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc
   gpg --show-keys /etc/apt/keyrings/docker.asc   # must show 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
     | sudo tee /etc/apt/sources.list.d/docker.list
   sudo apt-get update
   ```

   The last `apt-get update` must list `download.docker.com`. Skipping it
   makes step 2 fail with `Package 'docker-ce' has no installation candidate`.

2. Install Docker, then turn off the root daemon:

   ```bash
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-ce-rootless-extras uidmap dbus-user-session
   sudo systemctl disable --now docker.service docker.socket
   sudo rm -f /var/run/docker.sock
   ```

3. Check that your user has subordinate UIDs and GIDs:

   ```bash
   grep "^$USER:" /etc/subuid /etc/subgid
   # no output? add them:
   sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 "$USER"
   ```

4. Run `mkdir -p ~/.local/bin`, then log out and back in. This starts the user
   D-Bus session rootless Docker needs, and Debian's `~/.profile` adds
   `~/.local/bin` to `PATH` for the tv2 wrapper.

5. Start rootless Docker as your user, without sudo:

   ```bash
   dockerd-rootless-setuptool.sh install
   docker context use rootless
   systemctl --user enable docker
   ```

6. Check it:

   ```bash
   docker info --format '{{.SecurityOptions}}'   # must include name=rootless
   docker run --rm hello-world
   ```

Then follow [Quick start](README.md#quick-start). `tv2-docker` detects rootless
mode on its own.

## Why this is safer

- Packages come from Docker's signed repo, and you check the key fingerprint
  yourself. Nothing is piped from `curl` into `sh`.
- The daemon runs as your user. Regular Docker needs root or the `docker`
  group, and that group gives full root access to the machine.
- Root inside a container is your normal user outside it.

## Notes

- Images and containers live in `~/.local/share/docker`. The tv2 image needs
  about 4 GB there.
- Docker starts when you log in. To keep it running after logout:
  `sudo loginctl enable-linger "$USER"`.
