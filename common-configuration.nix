{ config, pkgs, ... }:
{
  imports = [
    ./users.nix
    ./window-manager.nix
    ./yubikey.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
  ];
}
