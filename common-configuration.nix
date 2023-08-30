{ config, pkgs, ... }:
{
  imports = [
    ./users.nix
    ./window-manager.nix
    ./yubikey.nix
    ./packages/st.nix
    ./packages/dwmblocks.nix
  ];

  nixpkgs.config.allowUnfree = true;

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
    htop
    solaar
  ];

  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      fira-code
      fira-code-symbols
      jetbrains-mono
      source-code-pro
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono-Medium" ];
      };
    };
  };

}
