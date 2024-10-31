{ pkgs, ... }: {
  programs.home-manager.enable = true;

  home.username = "zack4";
  home.homeDirectory = "/Users/zack4";
  home.stateVersion = "24.05";

  # config files not specified in nix
  home.file = {
    ".tmux.conf".source = ./.tmux.conf;
    ".zsh_aliases".source = ./.zsh_aliases;
    ".config/nvim".source = ./.config/nvim;
    ".config/skhd/skhdrc".source = ./.config/skhd/skhdrc;
    ".config/yabai/yabairc".source = ./.config/yabai/yabairc;
    ".config/wezterm/wezterm.lua".source = ./.config/wezterm/wezterm.lua;
  };

   home.packages = with pkgs; [
    cowsay fortune
    git gh tmux coreutils
    imagemagick htop
    tree wget croc curl rlwrap 
    pandoc yt-dlp fastfetch
    ripgrep fd fzf lazygit jq
    skhd yabai
    micromamba
  ];

  programs.git = {
    enable = true;
    userName = "Zachary Huang";
    userEmail = "55601738+zack466@users.noreply.github.com";
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    dirHashes = {
      docs  = "$HOME/Documents";
      dl    = "$HOME/Downloads";
      term  = "$HOME/Caltech/FA25";
    };
    autocd = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#d1d1d1,bold,underline";
      strategy = [
        "completion"
        "history"
      ];
    };
    # accept autocompletions using ctrl-space
    completionInit = ''
      bindkey '^ ' autosuggest-accept
    '';
    # aliases and nix-index
    initExtra = ''
      source $HOME/.zsh_aliases
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';
  };

  programs.starship = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  home.shellAliases = {
    # see .zsh_aliases
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
  };
}
