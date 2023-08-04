{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hplip
  ];
}
