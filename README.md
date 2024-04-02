# .config

## Packages

```
sudo pacman -S mesa sway wmenu dmenu foot micro wl-clipboard \
waybar otf-font-awesome pipewire wireplumber pipewire-alsa bluez bluez-utils
```

## Yay

```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

## AUR Packages

```
yay -S google-chrome
```

## Start Sway automatically on TTY login

Add the following to `~/.bash_profile`:

```
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi
```

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