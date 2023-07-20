local M = {}

M.setup = function()
  lvim.plugins = {
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "jpalardy/vim-slime",
      config = function()
        vim.cmd("let g:slime_target = 'tmux'")
        -- vim.cmd("let g:slime_python_ipython = 0")
        vim.cmd("let g:slime_bracketed_paste = 1")
      end,
    },
    {
      "machakann/vim-sandwich",
      config = function()
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")
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
      ft = { "fugitive" }
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function() require "lsp_signature".on_attach() end,
    },
    {
      "tpope/vim-repeat"
    },
    {
      "jremmen/vim-ripgrep"
    },
    {
      "felipec/vim-sanegx",
      event = "BufRead",
    },
    {
      "mfussenegger/nvim-jdtls"
    },
    {
      "lervag/vimtex",
      ft = "tex",
      lazy = false,
    },
    {
      "github/copilot.vim"
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
      --   require("catppuccin").setup({
      --     integrations = {
      --     }
      -- })
      end
    }
  }

end

return M
