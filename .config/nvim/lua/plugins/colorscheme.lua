return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = false,
            integrations = {
                mason = true,
            },
            custom_highlights = function(colors)
                return {
                    SpellBad = { fg = colors.red }, -- spelling errors
                    SpellCap = { fg = colors.red }, -- capitalization errors
                    Conceal = { fg = colors.pink },  -- VimTeX conceal

                    DapBreakpoint = { fg = colors.blue },
                    DapStopped = { fg = colors.blue },
                }
            end

        })
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
