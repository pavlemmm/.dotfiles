# NixOS Installation (Minimal / No GUI)

1. **Boot the NixOS installer and connect to the internet**
   ```bash
   setfont ter-v32n # optional larger tty font
   lsblk
   ip a
   nmtui # easiest way if you need Wi-Fi
   ```
   - On Ethernet, networking often works automatically.
   - On Wi-Fi, connect before continuing.
---
2. **Partition disks**
   Launch `cfdisk`:
   ```bash
   cfdisk /dev/nvme0n1
   ```
   - Create partitions:
     - **EFI System Partition (ESP)** – 512 MiB, type `EFI System`
     - **Swap partition** – 4 GB or more, type `Linux swap`
     - **Root (/) partition** – remaining space, type `Linux filesystem`
   - If you are dual booting and already have an EFI partition, reuse it and **do not format it**.
---
3. **Format partitions**
   ```bash
   mkfs.ext4 /dev/<root_partition>
   mkfs.fat -F32 /dev/<efi_partition>
   mkswap /dev/<swap_partition>
   ```
   - Skip `mkfs.fat` if you are reusing an existing EFI partition for dual boot.
---
4. **Mount partitions**
   ```bash
   mount /dev/<root_partition> /mnt
   mount --mkdir /dev/<efi_partition> /mnt/boot
   swapon /dev/<swap_partition>
   ```
   - For `systemd-boot`, the EFI partition is usually mounted at `/boot`, not `/boot/efi`.
---
5. **Generate initial NixOS config**
   ```bash
   nixos-generate-config --root /mnt
   ```
   This creates:
   - `/mnt/etc/nixos/configuration.nix`
   - `/mnt/etc/nixos/hardware-configuration.nix`
---
6. **Edit temporary `configuration.nix` for the first boot**
   Open the file:
   ```bash
   nvim /mnt/etc/nixos/configuration.nix
   ```

   Use a small bootstrap config so you can boot, get networking, install `git`, and then switch to this repo immediately:
   ```nix
   { config, pkgs, ... }:

   {
     imports = [
       ./hardware-configuration.nix
     ];

     boot.loader.systemd-boot.enable = true;
     boot.loader.efi.canTouchEfiVariables = true;
     boot.loader.efi.efiSysMountPoint = "/boot";

     networking.hostName = "nix-pc";
     networking.networkmanager.enable = true;

     time.timeZone = "Europe/Belgrade";
     i18n.defaultLocale = "en_US.UTF-8";

     users.users.pavlem = {
       isNormalUser = true;
       description = "PavleM";
       extraGroups = [ "wheel" "networkmanager" ];
       shell = pkgs.zsh;
     };

     environment.systemPackages = with pkgs; [
       git
       neovim
       curl
       wget
     ];

     programs.zsh.enable = true;
     nix.settings.experimental-features = [ "nix-command" "flakes" ];

     system.stateVersion = "25.11";
   }
   ```
   - Keep the hostname as `nix-pc` if you want to use the existing host from this repo without renaming anything.
   - Set `system.stateVersion` to the NixOS release you installed.
---
7. **Install the system**
   ```bash
   nixos-install
   ```
---
8. **Set passwords if needed**
   If you did not set them during `nixos-install`:
   ```bash
   nixos-enter --root /mnt -c passwd
   nixos-enter --root /mnt -c 'passwd pavlem'
   ```
---
9. **Reboot**
   ```bash
   reboot
   ```
---
## Switch To Repo Config

1. **Log into the new system and clone the repo**
   ```bash
   git clone https://github.com/pavlemmm/.dotfiles ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Make the repo config minimal before linking it**
   Open:
   ```bash
   nvim ~/.dotfiles/nixos/hosts/nix-pc/configuration.nix
   ```
   Remove or comment out:
   ```nix
   ../../modules/desktop.nix
   ```

   Then trim GUI / desktop packages if needed:
   ```bash
   nvim ~/.dotfiles/nixos/modules/packages.nix
   ```

3. **Link `/etc/nixos` to the repo**
   ```bash
   ~/.dotfiles/scripts/nixos/link-nixos.sh nix-pc
   ```
   This script:
   - replaces `/etc/nixos` with a symlink to `~/.dotfiles/nixos`
   - regenerates `hosts/nix-pc/hardware-configuration.nix`

4. **Rebuild from the flake**
   ```bash
   sudo nixos-rebuild switch --flake /etc/nixos#nix-pc
   ```

5. **Optional: link home dotfiles and setup zsh plugins**
   ```bash
   ~/.dotfiles/scripts/link-dotfiles.sh
   ~/.dotfiles/scripts/setup-zsh.sh
   ```

---
## Notes

- Your current repo is still desktop-oriented by default because `nixos/hosts/nix-pc/configuration.nix` imports `../../modules/desktop.nix`.
- `nixos/modules/packages.nix` also includes GUI and desktop packages, so trim that file too if you want a true no-GUI setup.
- After everything is linked, use this for future rebuilds:
  ```bash
  sudo nixos-rebuild switch --flake /etc/nixos#nix-pc
  ```
