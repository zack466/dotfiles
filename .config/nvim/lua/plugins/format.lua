return {
    "stevearc/conform.nvim",
    config = function()
        local formatters = {
            { ft = { "python" },            fmt = { "isort", "flake8", "black" } },
            { ft = { "html", "css" },       fmt = { "prettier" } },
            { ft = { "bash", "zsh", "sh" }, fmt = { "beautysh" } },
            { ft = { "ocaml" },             fmt = { "ocamlformat" } },
            { ft = { "c", "cpp" },          fmt = { "clang-format" } },
            {
                ft = { "javascript", "typescript",
                    "javascriptreact", "typescriptreact" },
                fmt = { "prettierd", "prettier", "eslint_d" }
            },
        }

        local formatters_expanded = {}
        for i = 1, #formatters do
            for _, ft in ipairs(formatters[i].ft) do
                formatters_expanded[ft] = formatters[i].fmt
            end
        end

        require("conform").setup({
            formatters_by_ft = formatters_expanded,
        })
    end
}
