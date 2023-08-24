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
      #package = localPkgs.dwm;
      package = pkgs.dwm.overrideAttrs {
        src = pkgs.fetchFromGitHub {
          owner = "cjrowe";
	  repo = "dwm";
	  rev = "499d9e523a156e55511cee24ac30da9c0c9919fb";
	  sha256 = "0r4s9azxs7mnrg54n2wcw7w9sk1xbf9k9c3vj9ywma5k3r8pqgpb";
	};
      };
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



