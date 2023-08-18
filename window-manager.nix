{ config, pkgs, ... }:
{
  
  services.xserver = {
    enable = true;
    layout = "gb";

    windowManager.dwm.enable = true;
    
    displayManager.sessionCommands =
      ''
        ${pkgs.dwmblocks}/bin/dwmblocks &
      '';
      
  };

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
    (st.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        (fetchpatch {
          url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff";
	  sha256 = "0mgsklws6jsrngcsy64zmr604qsdlpd5pqsa3pci7j3gn8im4zyw";
	})
      ];
    }))
    dmenu
    dwmblocks
    xcompmgr
  ];
}



