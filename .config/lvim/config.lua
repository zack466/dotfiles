-- general settings
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"
lvim.line_wrap_cursor_movement = false

-- etc keymappings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
-- lvim.keys.normal_mode["<leader>e"] = ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>"

-- swapping lines
lvim.keys.normal_mode["<M-k>"] = ':let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>'
lvim.keys.normal_mode["<M-j>"] = ':let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>'

-- Buffer navigation
lvim.keys.normal_mode["<A-,>"] = ':BufferPrevious<cr>'
lvim.keys.normal_mode["<A-.>"] = ':BufferNext<cr>'
lvim.keys.normal_mode["<A-<>"] = ':BufferMovePrevious<cr>'
lvim.keys.normal_mode["<A->>"] = ':BufferMoveNext<cr>'
lvim.keys.normal_mode["<A-c>"] = ':BufferClose<cr>'

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

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings[" "] = {":Telescope find_files<cr>", "Find Files"}
lvim.builtin.which_key.mappings["f"] = nil
lvim.builtin.which_key.mappings["e"] = {":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Errors"}
-- lvim.keys.normal_mode["<leader>e"] = ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>"
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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

-- Additional Plugins
lvim.plugins = {
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
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
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
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      local dial = require "dial"
      vim.cmd [[
        nmap <C-x> <Plug>(dial-increment)
        nmap <C-z> <Plug>(dial-decrement)
        vmap <C-x> <Plug>(dial-increment)
        vmap <C-z> <Plug>(dial-decrement)
        vmap g<C-x> <Plug>(dial-increment-additional)
        vmap g<C-z> <Plug>(dial-decrement-additional)
      ]]

      dial.augends["custom#boolean"] = dial.common.enum_cyclic {
        name = "boolean",
        strlist = { "true", "false" },
      }
      table.insert(dial.config.searchlist.normal, "custom#boolean")

      -- For Languages which prefer True/False, e.g. python.
      dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
        name = "Boolean",
        strlist = { "True", "False" },
      }
      table.insert(dial.config.searchlist.normal, "custom#Boolean")
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
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.treesitter.highlight.enabled = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

lvim.autocommands.custom_groups = {
   { "BufWinEnter", "*.lua", "setlocal ts=2 sw=2" },
   { "BufWinEnter", "*.ts", "setlocal ts=2 sw=2" },
}

lvim.builtin.treesitter.indent = {enable = true, disable = {"python", "html", "javascript", "julia"}}

require'lspconfig'.denols.setup{}
