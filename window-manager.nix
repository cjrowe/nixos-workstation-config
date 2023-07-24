{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "gb";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

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
