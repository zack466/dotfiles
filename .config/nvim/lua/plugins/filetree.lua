return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            tab = {
                sync = {
                    open = true,
                    close = true
                },
            },
            filters = {
                git_ignored = false,
            },
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
        },
    },
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim",
    --         -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    --     },
    --     opts = {
    --         hijack_netrw_behavior = "disabled",
    --         follow_current_file = {
    --         enabled = true,
    --       },
    --
    --     },
    --     priority = 10,
    -- },
}
