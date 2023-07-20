require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "latex" }, -- list of language that will be disabled
  },
}

vim.cmd("call vimtex#init()")
