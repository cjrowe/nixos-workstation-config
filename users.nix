{ lib, pkgs, osConfig, ... }:
{
  imports = [ <home-manager/nixos> ];

  # Make zsh available system-wide
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ 
    zsh
  ];

  users.users.chris = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  home-manager.users.chris = { pkgs, ... }: {
    home.stateVersion = "23.05";
    home.packages = with pkgs; [ 
      brave
      neomutt
      isync
      msmtp
      pass
    ];

    programs.zsh = {
      enable = true;

      shellAliases = {
        hgrep = "history | grep";
      };

      oh-my-zsh = {
        plugins = [ "git" ];
        theme = "robyrussell";
      };
    };

    programs.git = {
      enable = true;
      userName = "Chris Rowe";
    };

    programs.abook = {
      enable = true;
    };
  };
}
