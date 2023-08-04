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
        patches = [
          (super.fetchpatch {
            url = "https://dwm.suckless.org/patches/alpha/dwm-alpha-6.4.diff"; 
            sha256 = "06bfx6dwrknk1dchqv920d3m6cn06lgf8i5pzxdmy2kfwf6ci8bi";
          })
          (super.fetchpatch {
            url = "https://dwm.suckless.org/patches/hide_vacant_tags/dwm-hide_vacant_tags-6.3.diff";
            sha256 = "0c8cf5lm95bbxcirf9hhzkwmc5a690albnxcrg363av32rf2yaa1";
          })
        ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    st
    dmenu
  ];
}
