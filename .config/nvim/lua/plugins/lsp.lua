return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "LspInfo", "LspStart", "LspRestart", "Mason" },
        dependencies = {
            { "folke/lazydev.nvim", ft = "lua" },
            "williamboman/mason.nvim",
            "stevearc/conform.nvim",
        },
        config = function()
            require("lazydev").setup()

            vim.diagnostic.config({ virtual_text = false })
            require("mason").setup()

            vim.lsp.enable({ "pyright", "ts_ls", "hls", "ocamllsp", "lua_ls",
                             "html", "cssls", "tinymist", "ghdl_ls", "clangd" })

            vim.lsp.config("ghdl_ls", {
                cmd = { "ghdl-ls" }
            })

            vim.lsp.config("tinymist", {
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "onSave",
                }
            })

            -- Formatters and Linters with conform.nvim, replacing LSP
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    asm = { "asmfmt" },
                    bash = { "shfmt" },
                    lua = { "stylua" },
                    ocaml = { "ocamlformat" },
                    haskell = { "fourmolu" },
                    python = { "isort", "flake8", "black" },
                    cpp = { "clang-format" },
                    javascript = { "prettierd", "eslint_d" },
                    typescript = { "prettierd", "eslint_d" },
                    javascriptreact = { "prettierd", "eslint_d" },
                    typescriptreact = { "prettierd", "eslint_d" },
                },
            })

            -- vim.keymap.set("n", "<leader>vf", function()
            --     conform.format({ lsp_fallback = true })
            -- end)
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {
            open_no_results = true,
            warn_no_results = false,
        },
    },
}
