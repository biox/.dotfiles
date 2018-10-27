# Usage

- Install a new bare NixOS system on an EFI compatible system, login as root
- `nix-env -i git vim`
- `vi /etc/nixos/smb-secrets` (format username=X\npassword=Y)
- `chmod 0400 /etc/nixos/smb-secrets`
- `git clone https://github.com/biox/dotfiles`
- `cp .dotfiles/configuration.nix /etc/nixos/configuration.nix`
- `nixos-rebuild switch`
- `reboot`
- Login as jesse
- vi -> :GoInstallBinaries
- `git clone https://github.com/biox/dotfiles`
- `stow vim/reshift/zsh/etc/whatever`
- DONE

## Install via curl

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/biox/.dotfiles/master/distribute.sh)"
```

## GPG setup

- Attach smartcard
- `gpg --card-edit`
- `fetch`
- `quit`
- `gpg --edit-key key_id`
- "I trust ultimately"

_enter passwords as required_

# TODO

- [x] replace topbar with fontawesome icons
- [x] autostart everything via i3
- [x] configure twmn and autostart it
- [x] Import all of my musick w/ beets, overwrite it on server
- [x] change terminal font to Source Code Pro and increase size to 13pt
- [x] Find suitable music player appy (yay deadbeef)
- [x] Figure out how GTK themes work and make deadbeef look perty
- [x] Store dotfiles in nixos config (.i3/config .i3blocks .zshrc .tmux.conf .beetsconfig etc)
- [x] Fix shitty vim outline
- [ ] Make polybar comfy

## GPG Project

- [x] buy a ~~yubikey~~ OpenPGP smartcard
- [x] generate GPG master keypair + 3 subkeys
- [x] Store master on paper + usb drive
- [x] Store subkey secrets on ~~yubikey~~ OpenPGP smartcard
- [x] SSH auth via GPG
- [ ] sup + msmtp + offlineimap via GPG
- [x] pass via GPG
- [x] git via GPG
- [ ] figure out email encryption via GPG

## WireGuard Project

- [ ] configure wireguard (local server running headphones to download music -> VPN via wireguard to the outside world)

## Blog Project

- [ ] Auto-deploy blog on nixos via nixops on DO (project)

## Tectonic Project

- [ ] Setup tectonic locally via virtualbox ayy
