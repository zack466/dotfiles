return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()

            local Rule = require("nvim-autopairs.rule")
            local autopairs = require("nvim-autopairs")
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
}
