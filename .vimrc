" Settings
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set clipboard^=unnamed
set re=0

" Plugins
call plug#begin()
Plug 'machakann/vim-sandwich'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'jpalardy/vim-slime'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

" Plugin configuration
runtime macros/sandwich/keymap/surround.vim
let g:slime_target = 'tmux'
let g:slime_bracketed_paste = 1

" Mappings
let mapleader=" "
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>, :bprev<cr>
nnoremap <leader>. :bnext<cr>
nnoremap <leader>c :bdelete<cr>
nnoremap <leader><leader> :CtrlP<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
vnoremap <C-a> :s/\d\+/\=(submatch(0)+1)/g<cr>:nohlsearch<cr>

" swap display line up/down
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" swap lines up and down in visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Persistent undo
if has('persistent_undo')
	call system('mkdir ~/.vim')
	call system('mkdir ~/.vim/undo')
	set undofile
	set undodir=$HOME/.vim/undo
	set undolevels=1000
	set undoreload=10000
endif

" the most important part
colorscheme catppuccin_mocha
