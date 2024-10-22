return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        -- Vim doesn't recognize WGSL as a filetype yet
        vim.filetype.add({ extension = { wgsl = "wgsl" } })

        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<S-CR>",
                    node_decremental = "<BS>",
                },
            },
            ensure_installed = {
                "json", "typescript", "javascript", "latex", "ocaml", "haskell", "python", "cpp"
            }
        })
    end,
}
