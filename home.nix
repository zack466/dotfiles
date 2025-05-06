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
    ".config/git/config.inc".source = ./.config/git/config.inc;
  };

   home.packages = with pkgs; [
    cowsay fortune
    git gh tmux coreutils
    imagemagick htop
    tree wget croc curl rlwrap 
    pandoc yt-dlp fastfetch
    ripgrep fd fzf lazygit jq
    wezterm skhd yabai
    micromamba deno nodejs
    roswell coq julia-bin
    typst #opam
    # (pkgs.libqalculate.override { gnuplot = (pkgs.gnuplot.override { withWxGTK = true; }); })
    cmatrix exiftool binwalk
    mpv-unwrapped yt-dlp speedtest-cli
    hyperfine
    wezterm
    podman podman-compose
    gtkwave
    ffmpeg
  ];

  programs.git = {
    enable = true;
    userName = "Zachary Huang";
    userEmail = "55601738+zack466@users.noreply.github.com";
    includes = [ { path = "~/.config/git/config.inc"; } ];
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.nnn = {
    enable = true;
    plugins = {
      src = (pkgs.fetchFromGitHub {
          owner = "jarun";
          repo = "nnn";
          rev = "v4.0";
          sha256 = "sha256-Hpc8YaJeAzJoEi7aJ6DntH2VLkoR6ToP6tPYn3llR7k=";
          }) + "/plugins";
      mappings = {
        k = "chksum";
        f = "fzcd";
        z = "autojump";
        n = "!open .";
        g = "!lazygit";
      };
    };
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    dirHashes = {
      docs  = "$HOME/Documents";
      dl    = "$HOME/Downloads";
      term  = "$HOME/Caltech/SP25";
    };
    sessionVariables = {
      EDITOR = "nvim";
      MAMBA_ROOT_PREFIX = "$HOME/micromamba";
    };
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
    # aliases and stuff
    initExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
      eval $(opam env)
      eval "$(micromamba shell hook --shell zsh)"
      source $HOME/.zsh_aliases
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;
      env_var.NNNLVL = {
        format = "(on [floor $env_value ](yellow))";
      };
    };
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
