filetype on
filetype plugin indent on
syntax on
set smartindent
set number

if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

set ts=4 sw=4
let mapleader = "\\"
set nocp

set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

"set spell
set spelllang=en

" vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<leader><tab>'
let g:UltiSnipsJumpForwardTrigger = '<leader><tab>'
let g:UltiSnipsJumpBackwardTrigger = '<ledaer><s-tab>'
let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips"]

Plug 'itchyny/lightline.vim'

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

Plug 'evanleck/vim-svelte', {'branch': 'main'}
call plug#end()

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0

colorscheme onedark

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
au FocusGained,BufEnter * :checktime

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

"reduce capital errors when exiting
:command WQ wq
:command Wq wq
:command W w
:command Q q

"move by display lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

map <S-Down> <C-J>
map <S-Up> <C-K>

"easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"quick buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"
" buffer nav
nnoremap <F5> :buffers<CR>:buffer<Space>
