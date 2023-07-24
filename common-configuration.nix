{ config, pkgs, ... }:
{
  imports = [
    ./window-manager.nix
    ./yubikey.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
  ];
}
