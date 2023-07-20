" Settings
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set clipboard^=unnamed

" Plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-sandwich'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
call plug#end()

runtime macros/sandwich/keymap/surround.vim

" Mappings
let mapleader=" "
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <C-n> :NERDTreeToggle<cr>

" swap display line up/down
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" swap lines up and down in visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Persistent undo
if has('persistent_undo')
	call system('mkdir ~/.vim')
	call system('mkdir ~/.vim/undo')
	set undofile
	set undodir=$HOME/.vim/undo
	set undolevels=1000
	set undoreload=10000
endif
