# WM Packages and Explanation

Below is a curated list of essential Wayland/WM packages with explanations and usage notes.

- **wlsunset** – Night light / Redshift alternative. Can also use `gammastep`.  
  **Note:** Only use `wlsunset` or `gammastep` if **not** using Hyprland; for Hyprland use `hyprsunset`.
- **brightnessctl** – Adjust keyboard backlight, screen brightness, and audio keys.  
  **Note:** Only use if **not** using Hyprland with `hyprsunset`.
- **grim, slurp** – Screenshot utilities for Wayland.
- **wl-clipboard** – Wayland clipboard CLI utilities (`wl-copy`, `wl-paste`).
- **cliphist** – Clipboard history manager for Wayland, works with `wl-clipboard` and `wofi`.
- **policykit-1-gnome** – Authentication agent for GNOME/other DEs.  
  **Note:** Hyprland has its own policykit agent.
- **nwg-look** – GTK theme configuration tool.
- **playerctl** – Media playback control (play/pause/next/previous) for compatible media players.
- **mako** – Notification daemon (on Ubuntu: `mako-notifier`).
- **libnotify** – Provides the `notify-send` command for sending notifications.
- **xdg-desktop-portal-hyprland** – XDG desktop portal backend for Hyprland.
- **bluez** – Official Bluetooth utilities for Linux.
- **bluetui** – TUI (terminal user interface) Bluetooth manager. Requires `bluez`.

---

# LY Display Manager

To configure `ly` to set XDG environment variables for your WM (e.g., `XDG_CURRENT_DESKTOP`), create `.desktop` files in:

```
/usr/share/wayland-sessions
```

This ensures the correct desktop environment variables are exported when starting your WM.

---

# WM Commands

- **Networking:** Use `nmtui` (NetworkManager TUI) in TTY to configure wired/wireless connections.
- **Bluetooth:** Use `bluetoothctl` in TTY for Bluetooth management, or `bluetui` for a more user-friendly TUI.

---

# Font Recommendations

- **Sans font family** – For GTK themes, bars, and UI elements (e.g., *Ubuntu Nerd Font*).
- **Monospace font family** – For terminals, WM configurations, and code editors (e.g., *UbuntuMono Nerd Font*).

---

# Arch Installation (EFI + systemd-boot/GRUB)

1. **Partition disks** using `cfdisk`  
   - Create at least two partitions: one **Linux filesystem** for root (`/`) and one **EFI System Partition** for boot.
2. **Format partitions:**
   ```bash
   mkfs.ext4 /dev/<root_partition>
   mkfs.fat -F32 /dev/<efi_partition>
   ```
3. **Mount partitions:**
   ```bash
   mount /dev/<root_partition> /mnt
   mkdir -p /mnt/boot/efi
   mount /dev/<efi_partition> /mnt/boot/efi
   ```
4. **Install base system:**
   ```bash
   pacstrap /mnt linux linux-firmware base base-devel nvim
   ```
5. **Chroot into the system:**
   ```bash
   arch-chroot /mnt
   ```
6. **Configure system:**
   - Locale
   - Timezone
   - Networking
7. **Install and configure bootloader:**
   - GRUB or systemd-boot

---

# Post-Install: Enabling System Services

```bash
systemctl enable ly.service
systemctl enable NetworkManager
systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service
```

**Note:** PipeWire services are user-level, so `--user` is required.
