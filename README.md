# Zack's Dotfiles

## [Nix](Nix) - `*.nix`
- I am officially using Nix flakes and [home-manager](home-manager) on my macbook so I can define all of my development dependencies in a single place (and make it easier to re-install my dotfiles on new systems)
- To install software system-wide, I just need to modify `home.nix` and run `make update` (which calls into home-manager)
- Most of my shell configuration is now specified in Nix, while everything else gets symlinked into my home directory by Nix

## [tmux](https://github.com/tmux/tmux/wiki) - `.tmux.conf`
- super basic tmux config
- prefix key: \`
- uses [tpm](https://github.com/tmux-plugins/tpm) (install manually), plus tmux-sensible and one-dark (install with `<prefix-I>`)
- when a session ends, will switch to another active session (useful since I tend to have more sessions than terminal windows open)

## [Neovim](https://neovim.io/) - `.config/nvim/*` 
- I finally bit the bullet and made my own Neovim config
- copied quite a bit from [Brady Bhalla](https://github.com/bradybhalla/dotfiles) and [Eric Lee](https://github.com/ericlovesmath/dotfiles)
- basically a slimmed down version of my previous Lunarvim config merged with my vim config

## [Vim](https://www.vim.org/) - `.vimrc`
- relatively minimal config with a few plugins and mappings, used when I can't be bothered to set up all my neovim stuff
  - vim-sensible, vim-surround, nerdtree (mapped to `<C-n>`), vim-commentary (mapped to `gcc`), and vim-repeat (`.`)
  - leader key is `<Space>`, save with `<leader>w` and quit with `<leader>q` 
  - persistent undo
- uses [vim-plug](https://github.com/junegunn/vim-plug) (install manually), then install plugins with `:PlugInstall`
- `init.lua` simply loads `~/.vimrc`
- works with vim and macvim

## [LunarVim](https://www.lunarvim.org/) - `.config/lvim/`
- A really great neovim IDE layer ~~(my daily driver)~~
- main config file is `config.lua`, with additional modules in `lua/user`

## [zsh](https://zsh.sourceforge.io/) - `.zshrc`
- many random aliases and stuff, plus configuration for various programs
- uses the [starship](https://starship.rs/) prompt
- `cd` aliased to [zoxide](https://github.com/ajeetdsouza/zoxide)
- `n` for nodejs version management (much faster startup than nvm)
- `conda` for python
- `m` to select a makefile target using [fzf](https://github.com/junegunn/fzf)

## [Yabai](https://github.com/koekeishiya/yabai) - `.config/yabai/yabairc`, `.config/skhd/skhdrc`
- I have it installed with ~~macports~~ nix
- Bindings are controlled using skhd (see `skhdrc`)
  - I used [Amethyst](https://ianyh.com/amethyst/) before switching to yabai, so my bindings tend to use shift-alt and shift-ctrl-alt as prefixes
- Note that if you're installing this for the first time, you have to go through a slightly convoluted procedure to [disable SIP](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection) so that everything works properly
- Credit where credit's due: I stole most of this config from [ericlovesmath](https://github.com/ericlovesmath/dotfiles)

## [Wezterm](https://wezfurlong.org/wezterm/) - `.config/wezterm/wezterm.lua`
- installed using ~~macports~~ nix
- I quite like the lua-based configuration
- I switched from Alacritty because... why not? Just wanted to change things up

## [Emacs](https://www.gnu.org/software/emacs/)
- I don't currently use Emacs, but I've tried [Doom Emacs](https://github.com/doomemacs/doomemacs) in the past, and it's pretty great

## Fonts
- [Comic Mono NF](https://github.com/xtevenx/ComicMonoNF) - this is the best coding font in existence, no question about it
- [Blex Mono NF](https://www.nerdfonts.com/font-downloads) - if you don't want to get bullied for using Comic Mono /j
