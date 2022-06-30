-- TODO:
-- organize config into modules
-- create an actual coloscheme
-- organize keybindings, emacs-inspired
-- workflows plugin - bind F1, F2, etc

-- general settings
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"
lvim.line_wrap_cursor_movement = false
lvim.format_on_save = false
vim.opt.scrolloff = 4;
vim.opt.sidescrolloff = 4;
vim.opt.whichwrap = "";
lvim.builtin.bufferline.active = true;

-- etc keymappings
lvim.keys.normal_mode["<C-x><C-x>"] = ":"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
-- lvim.keys.normal_mode["<leader>e"] = ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>"

-- swapping lines
-- lvim.keys.normal_mode["<M-k>"] = ':let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>'
-- lvim.keys.normal_mode["<M-j>"] = ':let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>'
-- instead, use visual line mode, shift-j and shift-k

-- Buffer navigation
lvim.keys.normal_mode["<A-,>"] = ':BufferLineCyclePrev<cr>'
lvim.keys.normal_mode["<A-.>"] = ':BufferLineCycleNext<cr>'
lvim.keys.normal_mode["<A-<>"] = ':BufferLineMovePrev<cr>'
lvim.keys.normal_mode["<A->>"] = ':BufferLineMoveNext<cr>'
lvim.keys.normal_mode["<A-c>"] = ':BufferKill<cr>'
-- get rid of default buffer next/prev mappings
vim.api.nvim_exec(
  [[
  unmap H
  unmap L
]], false)

vim.api.nvim_exec(
  [[
  let g:paredit_leader = ","
  let g:vlime_cl_use_terminal = v:true
  let g:vlime_window_settings = { "repl": { "pos": "botright", "vertical": v:true}}
]], false)


lvim.builtin.which_key.mappings[","] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" }
lvim.builtin.which_key.mappings["."] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" }

lvim.keys.normal_mode["<A-1>"] = ':BufferGoto 1<cr>'
lvim.keys.normal_mode["<A-2>"] = ':BufferGoto 2<cr>'
lvim.keys.normal_mode["<A-3>"] = ':BufferGoto 3<cr>'
lvim.keys.normal_mode["<A-4>"] = ':BufferGoto 4<cr>'
lvim.keys.normal_mode["<A-5>"] = ':BufferGoto 5<cr>'
lvim.keys.normal_mode["<A-6>"] = ':BufferGoto 6<cr>'
lvim.keys.normal_mode["<A-7>"] = ':BufferGoto 7<cr>'
lvim.keys.normal_mode["<A-8>"] = ':BufferGoto 8<cr>'
lvim.keys.normal_mode["<A-9>"] = ':BufferGoto 9<cr>'
lvim.keys.normal_mode["<A-0>"] = ':BufferPick<cr>'

lvim.keys.normal_mode["<M-x>"] = ':'

lvim.keys.normal_mode["j"] = 'gj'
lvim.keys.normal_mode["k"] = 'gk'

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

local make_action = function(prompt_bufnr)
  local _, action_state = pcall(require, "telescope.actions.state")
  local entry = action_state.get_selected_entry()
  local target = entry.value
  vim.api.nvim_exec([[:make ]] .. target, false)
  actions.close(prompt_bufnr)
end

local function makefile_targets()
  local opts = require'telescope.themes'.get_ivy {
    cwd = vim.loop.cwd(),
  }
  require'telescope.pickers'.new(opts, {
    prompt_title = "~ Makefile Targets ~",

    finder = require'telescope.finders'.new_oneshot_job(
      vim.tbl_flatten
    {
        "rg",
        "^([^[:space:]\\.]*):.*",
        "Makefile",
        "-r",
        "$1",
        "-N",
      },
      opts
    ),
    sorter = require'telescope.sorters'.get_generic_fuzzy_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<enter>", make_action)
      map("n", "<enter>", make_action)
      return true
    end,
  }):find()
end


-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings[" "] = {":Telescope find_files<cr>", "Find Files"}
lvim.builtin.which_key.mappings["f"] = {"<cmd>lua vim.lsp.buf.references()<CR>", "References"}
lvim.builtin.which_key.mappings["e"] = {":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Errors"}
lvim.builtin.which_key.mappings["d"] = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"}
lvim.builtin.which_key.mappings["y"] = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition"}

-- lvim.keys.normal_mode["<leader>e"] = ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.actions.change_dir.global = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.colors = {
  "#FF0000",
  "#FFFF00",
  "#00FF00",
  "#00FFFF",
  "#0000FF",
  "#FF00FF",
}

vim.list_extend(lvim.lsp.override, { "rust_analyzer" })
-- Additional Plugins
lvim.plugins = {
  {
  "p00f/nvim-ts-rainbow",
},
{"bkad/CamelCaseMotion",
    disable = true,
    config = function()
      vim.api.nvim_exec([[
                map <silent> w <Plug>CamelCaseMotion_w
                map <silent> b <Plug>CamelCaseMotion_b
                map <silent> e <Plug>CamelCaseMotion_e
                map <silent> ge <Plug>CamelCaseMotion_ge
                sunmap w
                sunmap b
                sunmap e
                sunmap ge
                ]], false)
    end
  },
  {
    "mattn/emmet-vim",
    config = function()
      vim.api.nvim_exec([[
      let g:user_emmet_leader_key='<C-y>'
                ]], false)
    end
},
{
    "janet-lang/janet.vim"
  },
{
    "vlime/vlime"
  },
-- {
--     "bhurlow/vim-parinfer"
--   },
{
    "jose-elias-alvarez/nvim-lsp-ts-utils"
  },
{
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        tools = {
          autoSetHints = true,
          hover_with_actions = false,
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          cmd = { vim.fn.stdpath "data" .. "/lsp_servers/rust/rust-analyzer" },
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
        },
      })
    end,
    ft = { "rust", "rs" },
  },
{
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        -- mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = false,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,        -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,              -- Function to run after the scrolling animation ends
      })
      local t = {}
      t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
      t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}
      t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '150'}}
      t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '150'}}
      t['<C-y>'] = {'scroll', {'-0.10', 'false', '50'}}
      t['<C-e>'] = {'scroll', { '0.10', 'false', '50'}}
      t['zt']    = {'zt', {'120'}}
      t['zz']    = {'zz', {'120'}}
      t['zb']    = {'zb', {'120'}}
      require('neoscroll.config').set_mappings(t)
    end
  },
{
    "jremmen/vim-ripgrep",
  },
{
    "mbbill/undotree",
    config = function()
      vim.cmd("nnoremap <F1> :UndotreeToggle<CR>")
    end,
  },
{
    "jpalardy/vim-slime",
    config = function()
      vim.cmd("let g:slime_target = 'tmux'")
      vim.cmd( "let g:slime_python_ipython = 1", false)
      vim.cmd( "let g:slime_bracketed_paste = 1", false)
    end,
  },
{
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },
{ "tpope/vim-repeat" },
{
    "machakann/vim-sandwich",
    config = function()
      vim.cmd("runtime macros/sandwich/keymap/surround.vim")
    end,
  },
{
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },

{
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
{
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
{
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
    end
  },
{
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
{
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- easy access to terminal
lvim.builtin.which_key.mappings["r"] = {
  name = "Repl",
  p = { "<cmd>TermExec cmd='python'<cr>", "python" },
  j = { "<cmd>TermExec cmd='node'<cr>", "nodejs" },
}

lvim.builtin.which_key.mappings["x"] = {
  name = "Execute",
  p = { "<cmd>TermExec cmd='python %'<cr>", "python" },
  m = { "<cmd>TermExec cmd='make'<cr>", "make" },
  M = { "<cmd>TermExec cmd='m'<cr>", "m" },
  c = { "<cmd>TermExec cmd='cmake .'<cr>", "CMake" },
  C = { "<cmd>TermExec cmd='cmake --build .'<cr>", "CMake Build" },
  x = { ":TermExec cmd='", "command" }, -- lets you type in command
}

-- lvim.builtin.which_key.mappings["m"] = { "<cmd>make<cr>", "Make" }
lvim.builtin.which_key.mappings["m"] = { makefile_targets, "Make"}

lvim.builtin.treesitter.highlight.enabled = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

lvim.autocommands.custom_groups = {
{ "BufRead", "*.pn", "setfile pn" },
{ "BufNewFile", "*.pn", "setfile pn" },
{ "BufWinEnter", "*.lua", "setlocal ts=2 sw=2" },
{ "BufWinEnter", "*.ts", "setlocal ts=2 sw=2" },
{ "BufWinEnter", "*.tsx", "setlocal ts=2 sw=2" },
{ "BufWinEnter", "*.js", "setlocal ts=4 sw=4" },
-- { "BufWinEnter", "*.ts", "setlocal ts=4 sw=4" },
{ "BufWinEnter", "*.c", "setlocal ts=2 sw=2" },
{ "BufWinEnter", "*.html", "setlocal ts=2 sw=2" },
{ "BufWinEnter", "*.h", "setlocal ts=2 sw=2" },
{ "BufWinEnter", "*.json", "setlocal ts=2 sw=2" },
}

lvim.builtin.treesitter.indent = {enable = true, disable = {"python", "html", "javascript", "julia"}}

lvim.builtin.autopairs.disable_filetype = {"TelescopePrompt", "vim", "lisp", "ocaml", "pn"}

-- ocaml merlin support
vim.api.nvim_exec(
  [[
    let g:opamshare = substitute(system('opam var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"
]], false)

-- require'lspconfig'.ocamlls.setup{
--   cmd = { "ocaml-language-server", "--stdio" },
--   filetypes = { "ocaml", "reason" },
--   root_dir = require'lspconfig'.util.root_pattern(".git", "*.opam", "esy.json", "package.json")
-- }

require'lspconfig'.ocamllsp.setup{}

local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup { { exe = "uncrustify", args = {} } }

require'lspconfig'.tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({})
    ts_utils.setup_client(client)
  end,
})

