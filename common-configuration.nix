{ config, pkgs, ... }:
{
  imports = [
    ./window-manager.nix
    ./yubikey.nix
  ];
}
