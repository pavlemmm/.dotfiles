# Arch Installation

1. **Partition disks**  
   Launch `cfdisk`:
   ```bash
   setfont ter-132n # set larger tty font
   lsblk
   cfdisk /dev/nvme0n1
   ```
   - Create partitions:
     - **EFI System Partition (ESP)** – 200 MiB, type `EFI System`
     - **Swap partition** – 4 GB at least, type `Linux swap`
     - **Root (/) partition** – remaining space, type `Linux filesystem`
---
2. **Format partitions:**
   ```bash
   mkfs.ext4 /dev/<root_partition>
   mkfs.fat -F32 /dev/<efi_partition>
   mkswap /dev/<swap_partition>
   ```
---
3. **Mount partitions:**
   ```bash
   mount /dev/<root_partition> /mnt
   mkdir -p /mnt/boot/efi
   mount /dev/<efi_partition> /mnt/boot/efi
   swapon /dev/<swap_partition>
   ```
---
4. **Install base system:**
   ```bash
   pacstrap /mnt base base-devel linux linux-firmware neovim git networkmanager
   ```
---
5. **Generate fstab:**
   ```bash
   genfstab -U /mnt >> /mnt/etc/fstab
   ```
---
6. **Chroot into the new system:**
   ```bash
   arch-chroot /mnt
   ```
---
7. **Configure system:**
   - **Timezone:**
     ```bash
     ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
     hwclock --systohc
     ```
   - **Locale:**
     ```bash
     nvim /etc/locale.gen
     # Uncomment your locale (e.g., en_US.UTF-8 UTF-8)
     locale-gen
     echo "LANG=en_US.UTF-8" > /etc/locale.conf
     ```
   - **Hostname:**
     ```bash
     echo pajarch > /etc/hostname
     ```
     `/etc/hosts`:
     ```
     127.0.0.1   localhost
     ::1         localhost
     127.0.1.1   pajarch.localdomain pajarch
     ```
---
8. **Set root password and add user:**
   ```bash
   passwd

   useradd -m -G wheel -s /bin/bash paja
   passwd paja

   EDITOR=nvim visudo
   ```
   In the sudoers file, uncomment the following line to grant sudo access to the wheel group:
   ```sql
   %wheel ALL=(ALL:ALL) ALL
   ```
---
9. **Install and configure GRUB bootloader (UEFI + Windows Dual Boot + Secure Boot):**
   
   #### 1. Install GRUB, shim, and tools
   ```bash
   pacman -S grub efibootmgr os-prober shim # os-prober for dual booting, shim for secure boot
   ```

   #### 2. Enable os-prober for Windows detection
   ```bash
   echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub # optional, for secure boot
   # or edit /etc/default/grub
   ```

   #### 3. Install GRUB with shim support (for Secure Boot)
   ```bash
   grub-install \
   --target=x86_64-efi \
   --efi-directory=/boot/efi \
   --bootloader-id=GRUB \
   --disable-shim-lock # optional, for secure boot
   ```
   - This uses the pre-signed `shim` binary trusted by Microsoft’s Secure Boot keys.
   - It allows booting Arch with Secure Boot enabled without generating your own keys.
   - Microsoft keys must be enrolled in your UEFI firmware (usually already present on Windows systems).


   #### 4. Detect Windows and generate the GRUB config
   ```bash
   os-prober # optional, if dual booting
   grub-mkconfig -o /boot/grub/grub.cfg
   ```
   - `os-prober` will detect your Windows EFI boot entry and add it to GRUB.

   #### 5. Enable Secure Boot in firmware
   - Reboot, enter your UEFI/BIOS, and enable Secure Boot if shim was used.
   
---
10. **Exit and reboot:**
    ```bash
    exit
    reboot
    ```
---
## Post-Install

### Enabling System Services

```bash
systemctl enable ly.service # Ly display manager
systemctl enable NetworkManager # Network manager
systemctl enable bluetooth.service # Bluetooth
systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service # Pipewire Audio
```

**Note:** PipeWire services are user-level, so `--user` is required.


### LY Display Manager

If not automatically set, configure `ly` to set XDG environment variables for your WM (e.g., `XDG_CURRENT_DESKTOP`), create `.desktop` files in:

```
/usr/share/wayland-sessions
```

This ensures the correct desktop environment variables are exported when starting your WM.

---

# Packages and Explanation

  ### Hyprland
- **xdg-desktop-portal-hyprland** – XDG desktop portal backend for Hyprland.
- **brightnessctl** – Adjust keyboard backlight, screen brightness, and audio keys.
- **policykit-1-gnome** – Authentication agent for GNOME/other DEs.   
  **Note:** Hyprland has its own policykit agent.

   ### Wayland
- **grim, slurp** – Screenshot utilities for Wayland.
- **wl-clipboard** – Wayland clipboard CLI utilities (`wl-copy`, `wl-paste`).
- **cliphist** – Clipboard history manager for Wayland, works with `wl-clipboard` and `wofi`.
- **nwg-look** – GTK theme configuration tool.
- **playerctl** – Media playback control (play/pause/next/previous) for compatible media players.
- **mako** – Notification daemon (on Ubuntu: `mako-notifier`).
- **libnotify** – Provides the `notify-send` command for sending notifications.

   ### Fonts
- **noto-fonts-emoji** – Font with emojis so apps like wofi, vscode can use it to display emojis    
  **Note:** Font awesome is included in Nerd Fonts, unlike color emoji, so there is no need to install it

   ### Bluetooth
- **bluez** – Official Bluetooth utilities for Linux.
- **bluez-utils** – Bluez command line tools like bluetoothctl
- **bluetui** – TUI bluez frontend (complicated hotkeys)
- **blueman** – GTK bluez frontend

---

# Configuring

- **Networking:** Use `nmtui` (NetworkManager TUI) in TTY to configure wired/wireless connections.
- **Bluetooth:** Use `bluetoothctl` in TTY for Bluetooth management, or `bluetui/blueman` for a more user-friendly experience.

---

# Font Recommendations

For terminals or apps that don't have font fallback, use Nerd Fonts variant because its patched with Font Awesome icons.  

**Sans font family** – For GTK themes, bars, and UI elements (e.g., *Ubuntu Nerd Font*).   

**Monospace font family** – For terminals, WM configurations, and code editors (e.g., *UbuntuMono Nerd Font*).  

**Color emoji font** – For apps to see emojis, not included in font awesome/nerd fonts (e.g., *noto fonts emoji*)
