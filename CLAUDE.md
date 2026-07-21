# CLAUDE.md

Raspi Hackbox — a Debian Trixie–based Raspberry Pi 4 image (i3 + zsh + offensive-security tooling) built with `vmdb2` and Ansible.

## Build

```bash
# Build the image (needs root, or fakemachine for unprivileged builds)
sudo make rpi4_trixie.img

# Compress / checksum / bmap
make rpi4_trixie.img.xz        # xz-compress the image
make rpi4_trixie.img.sha256    # sha256 checksum
make rpi4_trixie.img.bmap      # bmap for flashing

# Clean build artifacts (images, xz, tarballs, logs, bmaps, shasums)
make clean
```

Under the hood `make %.img` runs `vmdb2 --verbose --rootfs-tarball=... --output=... rpi4_trixie.yaml`.

### Containerized build

```bash
docker compose build      # build the builder image (Dockerfile)
docker compose up         # runs `make rpi4_trixie.img` inside a privileged container
```

## Dependencies

Debian Trixie (13)+ with: `vmdb2 dosfstools qemu-utils qemu-user-static debootstrap binfmt-support time kpartx bmap-tools python3 ansible-core fakemachine`, plus `ansible-galaxy collection install community.general`.

If `debootstrap` fails with `exec format error`: `sudo dpkg-reconfigure qemu-user-static`.

## Layout

- `rpi4_trixie.yaml` — vmdb2 build recipe (partitioning, debootstrap, then the Ansible playbook).
- `vmdb2-ansible.yaml` — Ansible playbook invoked during the build.
- `roles/` — Ansible roles for installed tooling: `kismet`, `metasploit`, `proxmark3`, `radare2`, `rtl8812au`, `urh`, `volatility`, plus environment roles (`alacritty`, `antibody`, `extra-packages`).
- `rootfs/` — files copied into the image (`boot/`, `etc/`, `usr/`).
- `Makefile` — build/compress/checksum/clean targets.

## Notes

- No application test/lint suite; validation is building the image and booting it on a Pi 4.
- Builds require root (or `fakemachine`) and produce large image artifacts (16G partition) — do not commit `*.img*`, `*.tar.gz`, or `*.log` (already covered by `.gitignore`).
