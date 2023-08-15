{ config, pkgs, ... }:
{
  imports = [
    ./users.nix
    ./window-manager.nix
    ./yubikey.nix
  ];

  nixpkgs.config.allowUnfree = true;

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
    htop
  ];

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      fira-code
      fira-code-symbols
      jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "jetbrains-mono" ];
      };
    };
  };

}
