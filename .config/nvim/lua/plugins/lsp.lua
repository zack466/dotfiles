return {
    -- {
    --     "mfussenegger/nvim-jdtls",
    --     ft = { "java" },
    -- },
    { "mason-org/mason.nvim",           version = "^1.0.0" },
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "LspInfo", "LspStart", "LspRestart", "Mason" },
        dependencies = {
            { "folke/lazydev.nvim", ft = "lua" },
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "stevearc/conform.nvim",
        },
        config = function()
            require("lazydev").setup()

            local nvim_lsp = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.diagnostic.config({ virtual_text = false })

            -- Mason.nvim config
            require("mason").setup()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    nvim_lsp[server_name].setup({})
                end,
                ["tinymist"] = function()
                    nvim_lsp.tinymist.setup({
                        settings = {
                            formatterMode = "typstyle",
                            exportPdf = "onSave",
                        }
                    })
                end
                --     ["html"] = function()
                --         nvim_lsp.html.setup({ capabilities = capabilities })
                --     end,
                --     ["cssls"] = function()
                --         nvim_lsp.cssls.setup({ capabilities = capabilities })
                --     end,
                --     ["rust_analyzer"] = function()
                --         nvim_lsp.rust_analyzer.setup({
                --             settings = {
                --                 ["rust-analyzer"] = {
                --                     check = {
                --                         overrideCommand = {
                --                             "cargo",
                --                             "clippy",
                --                             "--all-features",
                --                             "--all-targets",
                --                             "--workspace",
                --                             "--message-format=json",
                --                             -- "--target=wasm32-unknown-unknown",
                --                         },
                --                     },
                --                 },
                --             },
                --         })
                --     end,
                --     ["tsserver"] = function()
                --         nvim_lsp.tsserver.setup({
                --             settings = {
                --                 typescript = { format = { semicolons = "insert" } },
                --                 javascript = { format = { semicolons = "insert" } },
                --             },
                --         })
                --     end,
                --     ["jdtls"] = function() end, -- Use nvim-jdtls instead
            })

            -- LSPs not installed with mason.nvim
            -- nvim_lsp.gdscript.setup({})
            nvim_lsp.hls.setup({})
            nvim_lsp.ocamllsp.setup({})

            -- This is absolutely cooked
            nvim_lsp.ghdl_ls.setup({
                cmd = { "/Users/zack4/micromamba/bin/ghdl-ls" }
            })

            -- vim.api.nvim_create_autocmd("LspAttach", {
            --     group = vim.api.nvim_create_augroup("LspKeybinds", {}),
            --     callback = function(args)
            --         -- Use Treesitter instead of LSP
            --         -- local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "invalid client")
            --         -- client.server_capabilities.semanticTokensProvider = nil
            --     end,
            -- })

            -- Use Semantic Tokens AFTER Treesitter (see above to disable semantic tokens)
            -- vim.highlight.priorities.semantic_tokens = 95
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
