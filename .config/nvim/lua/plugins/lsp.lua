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

            -- Used to be used for html and cssls?
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.diagnostic.config({ virtual_text = false })
            require("mason").setup()

            vim.lsp.enable({ "pyright", "ts_ls", "coq_lsp", "gdscript", "hls",
                             "ocamllsp", "rocls", "lua_ls", "html", "cssls" })
                             --
            vim.lsp.config("ghdl_ls", {
                cmd = { "/Users/zack4/micromamba/bin/ghdl-ls" }
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
                    javascript = { "prettierd",  "eslint_d" },
                    typescript = { "prettierd",  "eslint_d" },
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
