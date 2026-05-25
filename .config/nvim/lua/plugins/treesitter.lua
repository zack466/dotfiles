return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        vim.filetype.add({ extension = { wgsl = "wgsl" } })

        -- Use the new setup location
        require("nvim-treesitter").setup({
            highlight = { enable = true },
            ensure_installed = {
                "json", "typescript", "javascript", "latex", "ocaml", "haskell", "python", "cpp"
            }
        })
    end,
}
