" Settings
filetype plugin on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set clipboard^=unnamed
set re=0
set lazyredraw
set smartcase
set hidden
set updatetime=100
set laststatus=2

" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'jpalardy/vim-slime'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'lifepillar/vim-mucomplete'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Plugin configuration
runtime macros/sandwich/keymap/surround.vim
let g:slime_target = 'tmux'
let g:slime_bracketed_paste = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": ".1"}

" Minimal statusline
" filename, [modified] ... git status, line/column, filetype
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('<+%d ~%d -%d>', a, m, r)
endfunction

set statusline=
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=%{GitStatus()}
set statusline+=\ :%l:%c:
set statusline+=\ (%p%%)
set statusline+=\ %y

" Completion
let g:mucomplete#enable_auto_at_startup = 1
imap <expr> <right> mucomplete#extend_fwd("\<right>")
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,noselect
set shortmess+=c

" Mappings
let mapleader=" "
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>, :bprev<cr>
nnoremap <leader>. :bnext<cr>
nnoremap <leader>c :bdelete<cr>
nnoremap <leader><leader> :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <leader>Lc :e ~/.vimrc<cr>
nnoremap <leader>Lr :source ~/.vimrc<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pU :PlugUpgrade<cr>

" swap display line up/down
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Center selection when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" swap lines up and down in visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Increment all values within a visual selection
vnoremap <C-a> :s/\d\+/\=(submatch(0)+1)/g<cr>:nohlsearch<cr>

" A shorter way of entering markdown links (select text then press <C-k>)
" Only works with vim-surround
vmap <C-k> S]%a()<Esc>i

" Persistent undo
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
    let &runtimepath.=','.vimDir
endif

if has('persistent_undo')
    " different undo files for vim and neovim
    let myUndoDir = expand(vimDir . '/undodir' . (has('nvim') ? 'neo' : ''))
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
	set undolevels=1000
	set undoreload=10000
    set undofile
endif

" the most important part
colorscheme catppuccin_mocha
