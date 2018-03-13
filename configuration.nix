{ config, pkgs, ... }:

{

  system.stateVersion = "17.09";
  # Ugh
  nixpkgs.config.allowUnfree = true;

  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda3";
      preLVM = true;
    }
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelModules = [ "kvm-intel" ];

  time.timeZone = "America/Chicago";

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  hardware.opengl.driSupport32Bit = true;

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    virtualbox.host.enable = true;
  };

  fileSystems."/mnt/music" = {
    device = "//192.168.1.5/losershare/Music";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };

  environment.systemPackages = with pkgs; [

    # WM Essentials
    i3-gaps i3status i3lock i3blocks
    rofi rofi-pass

    # Rofi-pass deps
    xdotool

    # Desktop
    ranger pavucontrol lxappearance compton nitrogen redshift
    audacity mumble keepassx2 twmn arc-theme arc-icon-theme
    pcmanfm

    # Loves of my Life
    vimHugeX zsh tmux firefox alacritty pass gnupg

    # Tools
    curl lsof jq tmux wget git which nmap packer terraform
    vagrant tree s3cmd wireguard stow unzip virtmanager
    neofetch kubernetes pinentry

    # Media
    scrot zathura mpv feh owncloud-client beets
    mutt ncmpcpp libreoffice

    # Programming
    man ack ruby python27Full python3 go

    # Non-Free Software
    steam

  ];

  fonts = {
    fonts = with pkgs; [
      source-code-pro
      font-awesome-ttf
      powerline-fonts
    ];
  };

  services = {
    mpd = {
      enable = true;
      user = "jesse";
      group = "users";
      dataDir = "/home/jesse/.mpd";
      musicDirectory = "/mnt/music";
      extraConfig = ''
        audio_output {
          type "pulse"
          name "pulse audio"
        }
      '';
    };
    
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps";
      displayManager = {
        lightdm.enable = true;
      };
      windowManager = {
        i3.enable = true;
        default = "i3";
      };
      videoDrivers = [ "nvidia" ];
    };
  };

  users.extraUsers.jesse = {
    isNormalUser = true;
    uid = 1000;
    useDefaultShell = false;
    initialPassword = "sekret";
    extraGroups = ["wheel" "audio" "docker" "libvirtd"];
    shell = "/run/current-system/sw/bin/zsh";
  };

}
