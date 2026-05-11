return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()

            local Rule = require("nvim-autopairs.rule")
            local autopairs = require("nvim-autopairs")
            local cond = require("nvim-autopairs.conds")

            -- only single quotes in certain languages
            autopairs.remove_rule("'")
            autopairs.add_rule(Rule("'", "'", { "c", "cpp", "python" }))

            -- for latex
            autopairs.add_rule(Rule("$", "$", { "tex" }))
        end
    },
    { "tpope/vim-surround" },
    { "akinsho/toggleterm.nvim" },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "famiu/bufdelete.nvim" },
    {
        "justinmk/vim-sneak",
        init = function()
            vim.cmd([[let g:sneak#label = 1]])
        end
    },
    {
        "folke/which-key.nvim",
        opts = {
            delay = 100,
        },
    },
    {
        'jremmen/vim-ripgrep',
        commands = { "Rg", "RgRoot" }
    },
    {
        'jpalardy/vim-slime',
        config = function()
            vim.cmd [[
            let g:slime_target = 'tmux'
            let g:slime_bracketed_paste = 1
            let g:slime_default_config = {"socket_name": "default", "target_pane": ".1"}
            ]]
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },
    -- {
    --     'whonore/Coqtail',
    --     config = function()
    --         vim.cmd [[
    --             let g:coqtail_nomap = 1
    --
    --             imap <buffer> <S-Down> <Plug>CoqNext
    --             imap <buffer> <S-Left> <Plug>CoqToLine
    --             imap <buffer> <S-Up> <Plug>CoqUndo
    --             nmap <buffer> <S-Down> <Plug>CoqNext
    --             nmap <buffer> <S-Left> <Plug>CoqToLine
    --             nmap <buffer> <S-Up> <Plug>CoqUndo
    --         ]]
    --     end
    -- }
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        lazy = true,
        -- ft = "markdown",
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Obsidian/*.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "saghen/blink.cmp",
        },
        opts = {
            workspaces = {
                {
                    name = "Zack",
                    path = "/Users/zack4/Obsidian",
                },
            },
            completion = {
                blink = true,
            },
            legacy_commands = false,
            note_id_func = function(title)
                if title ~= nil then
                    return title:gsub(" ", "-"):gsub("[^%w%s-]", ""):lower()
                else
                    return tostring(os.time())
                end
            end,
        },
        config = function(_, opts)
            require("obsidian").setup(opts)
            vim.keymap.set("n", "gf", "<CMD>Obsidian follow_link<CR>", { noremap = true, silent = true })
        end,
    },
    {
        "junegunn/vim-easy-align",
        config = function()
            vim.cmd [[
            " Start interactive EasyAlign in visual mode (e.g. vipga)
            xmap ga <Plug>(EasyAlign)

            " Start interactive EasyAlign for a motion/text object (e.g. gaip)
            nmap ga <Plug>(EasyAlign)
            ]]
        end
    },
    {
        "leath-dub/snipe.nvim",
        keys = {
            {"gb", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
        },
        opts = {}
    },
    { "sindrets/diffview.nvim" }
}
