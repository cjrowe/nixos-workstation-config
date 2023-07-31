{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam
    lutris
    wine64
  ];
}
