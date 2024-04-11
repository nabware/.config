# .config

## Packages

```
sudo pacman -S mesa sway wmenu dmenu foot micro wl-clipboard grim \
waybar otf-font-awesome noto-fonts-emoji \
pipewire wireplumber pipewire-alsa bluez bluez-utils \
git base-devel vulkan-icd-loader vulkan-radeon vulkan-headers \
vulkan-validation-layers vulkan-tools xorg-xwayland renderdoc
```

## Yay

```
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

## AUR Packages

```
yay -S google-chrome visual-studio-code-bin
```

## Start Sway automatically on TTY login

Add the following to `~/.bash_profile`:

```
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi
```

## Google Chrome

Run Google Chrome with `google-chrome-stable --ozone-platform=wayland`
and set permanently through `chrome://flags`.

## Bluetooth

```
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
bluetoothctl
scan on
connect <device_id>
trust <device_id>
```

## Git

```
git config --global user.name "First Last"
git config --global user.email user@email.com
git config --global init.defaultBranch main
git config --global credential.helper store
```

## Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Steam

Uncomment lines below in `/etc/pacman.conf`:

```
#[multilib]
#Include = /etc/pacman.d/mirrorlist
```

Upgrade and install:

```
sudo pacman -Syu
sudo pacman -S steam
```

## OBS

```
sudo pacman -S obs qt6-wayland xdg-desktop-portal-wlr libva-mesa-driver
```

## VLC

```
sudo pacman -S vlc
yay -S vlc-plugin-pipewire
```
