{ config, pkgs, ... }:
let
  localPkgs = import ./packages/default.nix { pkgs = pkgs; };
in
{
  
  services.xserver = {
    enable = true;
    layout = "gb";

    windowManager.dwm = {
      enable = true;
      package = localPkgs.dwm;
    };
    
    displayManager.sessionCommands =
      ''
        ${localPkgs.dwmblocks}/bin/dwmblocks &
      '';
      
  };


  environment.systemPackages = with pkgs; [
    dmenu
    xcompmgr
  ];
}



