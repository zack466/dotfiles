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
}
