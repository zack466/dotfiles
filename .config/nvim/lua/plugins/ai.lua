return
{
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "claude-3.7-sonnet",
                            },
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = 'copilot',
                    slash_commands = {
                        ["buffer"] = {
                            opts = {
                                provider = "telescope",
                            },
                        },
                        ["help"] = {
                            opts = {
                                provider = "telescope",
                                max_lines = 1000,
                            },
                        },
                        ["file"] = {
                            opts = {
                                provider = "telescope",
                            },
                        },
                        ["symbols"] = {
                            opts = {
                                provider = "telescope",
                            },
                        },
                    },
                },
                inline = {
                    adapter = 'copilot'
                },
                cmd = {
                    adapter = 'copilot'
                },
            },
            display = {
                action_palette = {
                    provider = "telescope", -- default|telescope|mini_pick
                },
                diff = {
                    provider = "mini_diff",

                },
            },
        }
    },
    {
        "echasnovski/mini.diff", -- Inline and better diff over the default
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    },
    -- {
    --     "github/copilot.vim"
    -- }
}
