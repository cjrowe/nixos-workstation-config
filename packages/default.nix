{ pkgs }:
{
  dwm = pkgs.callPackage ./dwm/pkg.nix { };
  st = pkgs.callPackage ./st/pkg.nix { };
  dwmblocks = pkgs.callPackage ./dwmblocks/pkg.nix { };
}
