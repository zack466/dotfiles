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

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Persistent undo
if has('persistent_undo')
	call system('mkdir ~/.vim')
	call system('mkdir ~/.vim/undo')
	set undofile
	set undodir=$HOME/.vim/undo
	set undolevels=1000
	set undoreload=10000
endif
