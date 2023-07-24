{ lib, pkgs, osConfig, ... }:
{
  imports = [ <home-manager/nixos> ];

  users.users.chris = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  home-manager.stateVersion = "23.05"
  home-manager.users.chris = { pkgs, ... }: {
    home.packages = [ ];
    programs.bash.enable = true;
  };
}