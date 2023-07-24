{ config, pkgs, ... }:
{
  imports = [
    ./home-manager.nix
    ./window-manager.nix
    ./yubikey.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    neofetch
  ];
}
