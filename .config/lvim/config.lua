-- Lunarvim Settings
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
lvim.line_wrap_cursor_movement = false
lvim.leader = "space"
-- lvim.builtin.lualine.style = "default"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.lualine.style = "lvim"
-- lvim.use_icons = false
-- lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Vim Settings
vim.opt.timeoutlen = 0
vim.opt.scrolloff = 4;
vim.opt.sidescrolloff = 4;
vim.opt.whichwrap = "";

-- swap lines up and down in visual mode
vim.cmd([[
  vnoremap K :m '<-2<CR>gv=gv
  vnoremap J :m '>+1<CR>gv=gv
]])

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm<cr>" -- <C-\> to close
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"

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

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

require("user.which-key").setup()
require("user.plugins").setup()
require("user.runner").setup()
require("user.autocommands").setup()
require("user.lsp.clangd").setup()
