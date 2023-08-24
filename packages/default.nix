{ pkgs }:
{
  #st = pkgs.callPackage ./st/pkg.nix { };
  dwmblocks = pkgs.callPackage ./dwmblocks/pkg.nix { };
}
