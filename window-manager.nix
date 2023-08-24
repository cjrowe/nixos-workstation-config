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
        ${pkgs.xcompmgr}/bin/xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
        ${localPkgs.dwmblocks}/bin/dwmblocks &
      '';
      
  };


  environment.systemPackages = with pkgs; [
    dmenu
  ];
}



