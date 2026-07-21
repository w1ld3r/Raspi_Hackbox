# Raspi Hackbox

**Raspi Hackbox** is a Debian-based Raspberry Pi image that transforms your Pi into a portable hacking lab.  
It comes preloaded with:

- A lightweight **i3 desktop environment**  
- **zsh** shell for productivity  
- A curated set of **offensive security tools**  

The toolkit is tailored for **IoT**, **OT**, and **automotive hacking**, making it ideal for pentesters, researchers, and enthusiasts who want a ready-to-go hacking environment.

---

## 🚀 Building an Image

Clone this repository:

```bash
git clone --recursive https://github.com/w1ld3r/Raspi_Hackbox
cd Raspi_Hackbox
```

### Dependencies

Make sure you are running **Debian Trixie (13)** or higher. Install the required packages:
```bash
sudo apt install -y \
 vmdb2 dosfstools qemu-utils qemu-user-static debootstrap \
 binfmt-support time kpartx bmap-tools python3 ansible-core \
 fakemachine
```

Install Ansible collections:
```bash
ansible-galaxy collection install community.general
```

👉 If `debootstrap` fails with an `exec format error`, try:
```bash
sudo dpkg-reconfigure qemu-user-static
```
This re-registers the format handler with `binfmt-support`.

---

### Building with Makefile

This repo includes a build recipe: [rpi4_trixie.yaml](rpi4_trixie.yaml), which
defines the preinstalled environment and hacking tools.

A `Makefile` automates the build:
```bash
sudo make rpi4_trixie.img
```

- Uses `vmdb2` + `ansible` under the hood
- Can run unprivileged if `fakemachine` is available
- Requires `sudo` otherwise

📖 [vmdb2 documentation](https://vmdb2.liw.fi/documentation/) for more details.

---

### 🐳 Building in a Container
If you prefer Docker, ensure your container has at least:
- **8 GB RAM**
- **60 GB disk space**

Install required packages (Docker Engine with the Compose v2 plugin):
```bash
sudo apt install -y binfmt-support qemu-system-common qemu-user-static docker.io docker-compose-v2
```

Build and run the container (it runs `make rpi4_trixie.img` inside a privileged
container — `privileged` and the `/dev` mount are required by `vmdb2`):
```bash
sudo docker compose up --build
```

The image is written to the repository directory (mounted into the container).

--- 

## 💾 Installing the Image on an SD Card

Insert your SD card (⚠️ this will erase all data).
Assuming the device is /dev/sdb, flash the image:

### Using `bmap-tools` (faster, recommended)

```bash
bmaptool copy rpi4_trixie.img.xz /dev/sdb
```

### Using `dd` with compressed image

```bash
xzcat rpi4_trixie.img.xz | dd of=/dev/sdb bs=64k oflag=dsync status=progress
```

### Using `dd` with uncompressed image

```bash
dd if=rpi4_trixie.img of=/dev/sdb bs=64k oflag=dsync status=progress
```

--- 

## 🛠️ Post-Install Setup

The image contains:
- **Partition 1** → `RASPIFIRM` (boot firmware + kernel)
- **Partition 2** → `RASPIROOT` (Debian system)

You should expand the root partition and create a swap partition

```bash
sudo parted /dev/sdb
(parted) help
(parted) print
(parted) mkpart primary linux-swap -4096 -0
(parted) resizepart 2 -4096
(parted) quit

sudo mkswap -L RASPSWAP /dev/sdb3
sudo e2fsck -f /dev/sdb2
sudo resize2fs /dev/sdb2
```

Swap is already configured in `/etc/fstab`. Verify with:
```bash
free -h
```

---

## 🔌 First Boot

- Default hostname: `rpi4-YYYYMMDD`
- Default user: `user`
- Default password: `user`

Insert the SD card, power up your Pi, and you’re ready to go.

> ⚠️ **Security:** the image ships with a well-known default password (`user`)
> for an account with `sudo`, and the SSH server is enabled. Before connecting
> the Pi to any untrusted network, log in on the console and **change the
> password immediately** (`passwd`), or disable SSH password authentication and
> switch to key-based login.

⚡ Hack responsibly — with great power comes great responsibility.
