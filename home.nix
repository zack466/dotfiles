{ config, pkgs, lib, ... }:
let
  # load in script to setup global python env with uv
  scriptContent = builtins.readFile ./scripts/setup-global-python-env.sh;
  substitutedContent = lib.replaceStrings
    [ "@uv@" "@python@" ]
    [ "${pkgs.uv}/bin/uv" "${pkgs.python3}/bin/python" ]
    scriptContent;
  setupScript = pkgs.writeShellScriptBin "setup-global-python" substitutedContent;
in
{
  programs.home-manager.enable = true;

  home.username = "zack4";
  home.homeDirectory = "/Users/zack4";
  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;

  # config files not specified in nix
  home.file = {
    ".tmux.conf".source = ./.tmux.conf;
    ".zsh_aliases".source = ./.zsh_aliases;
    ".config/nvim".source = ./.config/nvim;
    ".config/skhd/skhdrc".source = ./.config/skhd/skhdrc;
    ".config/yabai/yabairc".source = ./.config/yabai/yabairc;
    ".config/wezterm/wezterm.lua".source = ./.config/wezterm/wezterm.lua;
    ".config/git/config.inc".source = ./.config/git/config.inc;
    ".config/uv/global-requirements.txt".source = ./.config/uv/global-requirements.txt;
  };

  # set up global python env
  home.activation.setup-global-python-env = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "Running setup for global Python environment..."
    ${setupScript}/bin/setup-global-python
  '';

   home.packages = with pkgs; [
    # system utilities
    cowsay fortune
    git gh tmux coreutils
    imagemagick htop
    tree wget croc curl rlwrap 
    pandoc yt-dlp fastfetch
    ripgrep fd fzf lazygit jq yazi
    hyperfine
    wezterm skhd yabai
    cmatrix exiftool binwalk
    mpv-unwrapped yt-dlp speedtest-cli
    gtkwave
    ffmpeg
    podman podman-compose
    # languages
    uv deno nodejs go
    roswell coq julia-bin # opam # currently broken
    gcc cmake
    # typesetting
    typst
    texliveFull texlivePackages.revtex4 entr texlivePackages.aastex
    # accounting
    hledger hledger-ui hledger-web
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Zachary Huang";
        email = "55601738+zack466@users.noreply.github.com";
      };
    };
    includes = [ { path = "~/.config/git/config.inc"; } ];
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
      cal   = "$HOME/Caltech";
      term  = "$HOME/Caltech/FA26";
    };
    sessionVariables = {
      EDITOR = "nvim";
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
    initContent = ''
      GLOBAL_VENV_PATH="$HOME/.local/share/uv/global-python"
      if [ -d "$GLOBAL_VENV_PATH/bin" ]; then
        export PATH="$GLOBAL_VENV_PATH/bin:$PATH"
      fi

      export PATH="$PATH:$HOME/.local/bin"
      export PATH="$PATH:$HOME/go/bin"
      export PATH="$PATH:$HOME/.opencode/bin"
      eval $(opam env) # currently installed with macports
      source $HOME/.zsh_aliases
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;
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
