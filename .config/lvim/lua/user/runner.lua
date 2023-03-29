-- shamelessly stolen from https://github.com/ericlovesmath/dotfiles
local M = {}

M.setup = function()
  -- Create quick code runner shortcuts
  local config = {
    filetypes = {
      bash = "bash $fileName",
      c = "cd $folder && gcc $fileName -o $fileNoExt.out && ./$fileNoExt.out",
      cpp = "cd $folder && g++ -std=c++17 %:p -o $fileNoExt.out -Wall -Wextra -Wshadow && ./$fileNoExt.out",
      go = "go run $fileName",
      java = "javac $fileName && java $fileNoExt",
      javascript = "node $fileName",
      julia = "julia $fileName",
      lua = "luajit $fileName",
      make = "make",
      python = "python $fileName",
      rust = "cargo run",
      sh = "bash $fileName",
      tex = "pdflatex $fileName && open $fileNoExt.pdf",
      typescript = "deno run",
    },
  }

  local function parseCmd(ft)
    local mappings = {
      fileName = "%%:p",
      fileNoExt = "%%:t:r",
      folder = "%%:p:h",
    }

    local cmd = config.filetypes[ft]
    for keyword, modifier in pairs(mappings) do
      cmd = cmd:gsub("$" .. keyword, modifier)
    end

    return cmd
  end

  vim.api.nvim_create_augroup("CodeRunner", { clear = true })

  for ft, _ in pairs(config.filetypes) do
    local cmd = ":w<CR>:vsp<CR>:term " .. parseCmd(ft) .. "<CR><C-\\><C-n>"
    vim.api.nvim_create_autocmd("Filetype", {
      group = "CodeRunner",
      pattern = ft,
      callback = function()
        lvim.builtin.which_key.mappings["x"] = { cmd, "Execute File" }
      end,
      -- command = "nnoremap <buffer> " .. config.key .. " " .. cmd,
    })
  end
end
return M
