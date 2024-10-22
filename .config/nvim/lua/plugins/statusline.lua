function _G.get_oil_winbar()
  local dir = require("oil").get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("lualine").setup {
            options = {
                disabled_filetypes = { "NvimTree", "toggleterm", "oil", "neo-tree" },
                ignore_focus = {
                    "dapui_scopes", "dapui_watches", "dap-repl",
                    "dapui_console", "dapui_breakpoints", "dapui_stacks"
                }
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "fileformat", "filetype" },
                lualine_y = { "diagnostics" },
                lualine_z = { "location" }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_a = { {
                    "tabs",
                    mode = 1,
                    use_mode_colors = true,
                    max_length = vim.o.columns * 4 / 5,
                    fmt = function(name, context)
                        -- display directory name if in oil.nvim buffer
                        local buflist = vim.fn.tabpagebuflist(context.tabnr)
                        local winnr = vim.fn.tabpagewinnr(context.tabnr)
                        local bufnr = buflist[winnr]
                        local ftype = vim.fn.getbufvar(bufnr, '&filetype')

                        if ftype == "oil" then
                            return get_oil_winbar()
                        else
                            return name
                        end
                    end

                } },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "diff" },
                lualine_z = { "branch" }
            }
        }
    end
}
