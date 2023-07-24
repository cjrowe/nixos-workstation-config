{ config, pkgs, ... }:
{
  services.xserver.windowManager.dwm.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
   
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    st
    dmenu
  ];
}
