zmodload zsh/zprof

## idk what is even going on anymore with Anaconda...
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/zack4/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ 1 -eq 0 ]; then
#if [ $! -eq 0 ]; then
    #eval "$__conda_setup"
#else
if [ -f "/Users/zack4/opt/anaconda3/etc/profile.d/conda.sh" ]; then
  . "/Users/zack4/opt/anaconda3/etc/profile.d/conda.sh"
else
  export PATH="/Users/zack4/opt/anaconda3/bin:$PATH"
fi
export PATH="/Users/zack4/opt/anaconda3/bin:$PATH"
#fi
#unset __conda_setup
# <<< conda initialize <<<

## Environment Variables
export PATH="/Users/zack4/.local/bin:$PATH"
export PATH="/Users/zack4/.cargo/bin:$PATH"
export PATH="/Users/zack4/go/bin:$PATH"
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk17-temurin/Contents/Home # in case multiple JDKs are installed
export PATH="/Applications/MacVim.app/Contents/bin:$PATH" # macvim
export PATH="/Applications/Firefox Developer Edition.app/Contents/MacOS:$PATH" # firefox
export PATH="/Users/zack4/j903/bin:$PATH"
export PATH="/Users/zack4/.yarn/bin:$PATH"

## emacs ew
export PATH="/Applications/EmacsServer.app/Contents/MacOS/bin:$PATH"
export PATH="/Applications/EmacsServer.app/Contents/MacOS:$PATH"
alias emacs="/Applications/EmacsServer.app/Contents/MacOS/bin/emacsclient --no-wait --quiet --suppress-output --create-frame"
export PATH="/Users/zack4/.emacs.d/bin:$PATH"
alias everywhere="emacsclient --eval '(emacs-everywhere)' --no-wait --quiet --suppress-output --create-frame"
set -o emacs

## aliases
alias ls="ls --color"
alias ll='ls -laF'
alias la='ls -A'
alias l='ls -CF'
alias lg=lazygit
alias cd=z
alias c=bat
alias mp3="yt-dlp -x --audio-format mp3 -o '%(title)s.%(ext)s'"
alias vim=nvim
alias vi=vim
alias vs='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
alias va='vim ~/.alacritty.yml'
alias vy='vim ~/.config/yabai/yabairc'
alias vh='vim ~/.config/skhd/skhdrc'
alias vt='vim ~/.tmux.conf'
alias v=gvim
alias copy='pbcopy' # macos
alias paste='pbpaste' # macos
alias listen="nc -l 2001"
alias connect='f () {nc $1 2001}; f'
alias localip="ipconfig getifaddr en0"
alias ip="curl -4 icanhazip.com"
export EDITOR=vim

## functions
notif() {
	osascript -e "display notification \"$1\" sound name \"Ping\""
}
# ex: pdfpages source.pdf 2-5 output.pdf
pdfpages() {
	pdftk $1 cat $2 output $3
}

## opam configuration
[[ ! -r /Users/zack4/.opam/opam-init/init.zsh ]] || source /Users/zack4/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER='@@'
export FZF_COMPLETION_OPTS='--border --info=inline'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# select makefile target with fzf
alias m="[ -f Makefile ] && rg '^([a-zA-Z0-9_-]+):.*' Makefile -r '\$1' -N | fzf | xargs make"

# from when I was working on this: https://pdos.csail.mit.edu/6.S081/2021/schedule.html
export RISCV_OPENOCD_PATH="/Users/zack4/tools/riscv-openocd-0.10.0-2020.12.1-x86_64-apple-darwin"
export RISCV_PATH="/Users/zack4/tools/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-apple-darwin"
export PATH="$RISCV_PATH/bin:$PATH"

# get lambda.txt from here: https://www.gotlisp.com/lambda/lambda.txt
alias lambda="fortune lambda"

## Bun
export BUN_INSTALL="/Users/zack4/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/Users/zack4/.bun/_bun" ] && source "/Users/zack4/.bun/_bun"

## N
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

## zsh init
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
