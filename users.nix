{ lib, pkgs, osConfig, ... }:
{
  imports = [
    <home-manager/nixos>
    ./personal/chris/email-accounts.nix
  ];

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

    programs.gpg = {
      enable = true;
      mutableKeys = true;
      mutableTrust = true;
    };

    programs.zsh = {
      enable = true;

      shellAliases = {
        hgrep = "history | grep";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "theunraveler";
      };
    };

    programs.git = {
      enable = true;
      userName = "Chris Rowe";
      userEmail = "chris@chrisrowe.co.uk";
      signing.key = "0x17A0DABCBA7A9461";
    };

    programs.neomutt = {
      enable = true;
    };

    programs.abook = {
      enable = true;
      extraConfig =
        ''
        set show_all_emails=true
        set mutt_command=neomutt
        set mutt_return_all_emails=true
        set address_style=uk
        '';
    };

    programs.neovim = {
      enable = true;
      vimAlias = true;
    };
  };
}
