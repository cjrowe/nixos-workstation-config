{ pkgs, config, ... }:

let
  localPkgs = import ./packages/default.nix { pkgs = pkgs; };
  customPackages = with localPkgs; [
    dwmblocks
    st
    # dmenu
    # anypinentry
  ];
in
{
  # Packages
  environment.systemPackages = customPackages;
}
