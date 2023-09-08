{ lib, pkgs, osConfig, ... }:
{
  imports = [
    <home-manager/nixos>
    ./personal/chris/email/work.nix
    ./personal/chris/email/personal.nix
  ];

  # Make zsh available system-wide
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ 
    zsh
  ];

  users.users.chris = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "cups" ];
    shell = pkgs.zsh;
  };

  home-manager.users.chris = { pkgs, config, ... }: {
    home.stateVersion = "23.05";
    
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [ 
      brave
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "SourceCodePro" ]; })
    ];

    home.sessionVariables = {
      BROWSER="brave";
    };

    accounts.email.maildirBasePath = "${config.xdg.dataHome}/mail";

    programs.password-store = {
      enable = true;
      settings = {
        PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
      };
    };

    programs.mbsync.enable = true;
    programs.msmtp.enable = true;
    programs.notmuch = {
      enable = true;
      hooks = {
        preNew = "mbsync --all";
      };
    };

    xdg = {
      enable = true;
      
      mime = {
        enable = true;
      };

      mimeApps = {
        enable = true;
      };

    };

    programs.bat = {
      enable = true;
    };

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
        theme = "robbyrussell";
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
