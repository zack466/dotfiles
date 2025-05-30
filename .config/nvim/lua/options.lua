-- set leader key
vim.g.mapleader     = " "

-- line numbers
vim.opt.number      = true
vim.opt.signcolumn  = "yes"

-- tabs
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true

vim.api.nvim_create_autocmd("Filetype", {
    group = vim.api.nvim_create_augroup("TwoTabWidth", { clear = true }),
    pattern = { "c", "css", "cpp", "html", "ocaml", "javascript*", "typescript*", "svelte", "wgsl", "markdown", "typst", "nix" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- case sensitivity
vim.opt.ignorecase   = true
vim.opt.smartcase    = true

-- wrapping
vim.opt.breakindent  = true
vim.opt.linebreak    = true

-- scrolling
vim.opt.smoothscroll = true

-- split pane location
vim.opt.splitright   = true
vim.opt.splitbelow   = true

-- don't show insert in command line
vim.opt.showmode     = false

-- use system clipboard
vim.opt.clipboard:append({ 'unnamedplus' })

-- get rid of annoying ctrl-space behavior
vim.cmd [[
inoremap <C-Space> <ESC>
nnoremap <C-Space> <CMD>w<CR>
]]

-- nvim-tree says to do this
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors    = true

vim.opt.pumheight = 10
----------------------------

-- folding
vim.opt.foldmethod       = "expr"
vim.opt.foldexpr         = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext         = ""
vim.opt.foldlevelstart   = 4
vim.opt.foldnestmax      = 6

-- persistent undo
vim.cmd [[
if !isdirectory("/tmp/.nvim-undo-dir")
    call mkdir("/tmp/.nvim-undo-dir", "", 0700)
endif
set undodir=/tmp/.nvim-undo-dir
set undofile
set undolevels=1000
set undoreload=10000
]]
