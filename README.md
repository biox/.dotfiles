# Usage

- Install a new NixOS system with git, login as your user
- `git clone git@github.com:biox/.dotfiles.git`
- `sudo cp .dotfiles/configuration.nix /etc/nixos/configuration.nix`
- `nixos-rebuild switch`
- `cd .dotfiles`
- `stow vim/reshift/zsh/etc/whatever`

# TODO

- [x] replace topbar with fontawesome icons
- [x] autostart everything via i3
- [x] configure twmn and autostart it
- [x] Import all of my musick w/ beets, overwrite it on server
- [x] change terminal font to Source Code Pro and increase size to 13pt
- [x] Find suitable music player appy (yay deadbeef)
- [x] Figure out how GTK themes work and make deadbeef look perty
- [x] Store dotfiles in nixos config (.i3/config .i3blocks .zshrc .tmux.conf .beetsconfig etc)
- [ ] Fix shitty vim outline

## GPG Project

- [ ] buy a yubikey
- [ ] generate GPG master keypair + 3 subkeys
- [ ] Store master on paper + usb drive
- [ ] Store subkey secrets on yubikey
- [ ] SSH auth via GPG
- [ ] sup + msmtp + offlineimap via GPG
- [ ] pass via GPG
- [ ] git via GPG
- [ ] figure out email encryption via GPG

## WireGuard Project

- [ ] configure wireguard (local server running headphones to download music -> VPN via wireguard to the outside world)

## Blog Project

- [ ] Auto-deploy blog on nixos via nixops on DO (project)
