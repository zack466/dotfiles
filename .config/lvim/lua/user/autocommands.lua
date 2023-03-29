local M = {}
M.setup = function()
  -- set tab size based on filetype
  local config = {
    tabsize = {
      bash = 4,
      c = 2,
      cpp = 2,
      go = 4,
      java = 4,
      javascript = 2,
      julia = 4,
      lua = 2,
      make = 4,
      python = 4,
      rust = 4,
      tex = 4,
      typescript = 2,
    },
  }

  for ft, _ in pairs(config.tabsize) do
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = ft,
      callback = function()
        vim.cmd("set shiftwidth=" .. config.tabsize[ft])
        vim.cmd("set tabstop=" .. config.tabsize[ft])
      end,
    })
  end

end
return M
