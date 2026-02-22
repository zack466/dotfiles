return {
    -- strange issues with terminal inputs like :rgb:0000/0000/0000 when
    -- toggling or using yazi in neovim
    -- {
    --     "mikavilpas/yazi.nvim",
    --     version = "*", -- use the latest stable version
    --     event = "VeryLazy",
    --     dependencies = {
    --         { "nvim-lua/plenary.nvim", lazy = true },
    --     },
    --     keys = {
    --         {
    --             "<leader>n",
    --             mode = { "n", "v" },
    --             "<cmd>Yazi<cr>",
    --             desc = "Open yazi at the current file",
    --         },
    --         {
    --             -- Open in the current working directory
    --             "<leader>o",
    --             "<cmd>Yazi cwd<cr>",
    --             desc = "Open the file manager in nvim's working directory",
    --         },
    --         {
    --             "<c-n>",
    --             "<cmd>Yazi toggle<cr>",
    --             desc = "Resume the last yazi session",
    --         },
    --     },
    --     ---@type YaziConfig | {}
    --     opts = {
    --         -- if you want to open yazi instead of netrw, see below for more info
    --         open_for_directories = false,
    --         keymaps = {
    --             show_help = "<f1>",
    --         },
    --     },
    --     -- 👇 if you use `open_for_directories=true`, this is recommended
    --     init = function()
    --         -- mark netrw as loaded so it's not loaded at all.
    --         --
    --         -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    --         vim.g.loaded_netrwPlugin = 1
    --     end,
    -- },
    {
        "luukvbaal/nnn.nvim",
        opts = {
            explorer = {
                cmd = "nnn",       -- command override (-F1 flag is implied, -a flag is invalid!)
                width = 24,        -- width of the vertical split
                side = "topleft",  -- or "botright", location of the explorer window
                session = "",      -- or "global" / "local" / "shared"
                tabs = true,       -- separate nnn instance per tab
                fullscreen = true, -- whether to fullscreen explorer window when current tab is empty
            },
            picker = {
                cmd = "nnn",       -- command override (-p flag is implied)
                style = {
                    width = 0.9,     -- percentage relative to terminal size when < 1, absolute otherwise
                    height = 0.8,    -- ^
                    xoffset = 0.5,   -- ^
                    yoffset = 0.5,   -- ^
                    border = "single"-- border decoration for example "rounded"(:h nvim_open_win)
                },
                session = "",      -- or "global" / "local" / "shared"
                tabs = true,       -- separate nnn instance per tab
                fullscreen = true, -- whether to fullscreen picker window when current tab is empty
            },
            auto_open = {
                setup = nil,       -- or "explorer" / "picker", auto open on setup function
                tabpage = nil,     -- or "explorer" / "picker", auto open when opening new tabpage
                empty = false,     -- only auto open on empty buffer
                ft_ignore = {      -- dont auto open for these filetypes
                    "gitcommit",
                }
            },
            auto_close = false,  -- close tabpage/nvim when nnn is last window
            replace_netrw = nil, -- or "explorer" / "picker"
            mappings = {},       -- table containing mappings, see below
            windownav = {        -- window movement mappings to navigate out of nnn
                left = "<C-w>h",
                right = "<C-w>l",
                next = "<C-w>w",
                prev = "<C-w>W",
            },
            buflisted = false,   -- whether or not nnn buffers show up in the bufferlist
            quitcd = nil,        -- or "cd" / tcd" / "lcd", command to run on quitcd file if found
            offset = false,      -- whether or not to write position offset to tmpfile(for use in preview-tui)
        }
    }
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons"
    --     },
    --     opts = {
    --         tab = {
    --             sync = {
    --                 open = true,
    --                 close = true
    --             },
    --         },
    --         filters = {
    --             git_ignored = false,
    --         },
    --         update_focused_file = {
    --             enable = true,
    --             update_root = true,
    --         },
    --         sync_root_with_cwd = true,
    --         respect_buf_cwd = true,
    --     },
    -- },
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
