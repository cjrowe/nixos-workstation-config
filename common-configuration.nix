{ config, pkgs, ... }:
{
  imports = [
    ./users.nix
    ./window-manager.nix
    ./yubikey.nix
  ];

  config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
  ];
}
