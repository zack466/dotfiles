return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = {
            file_ignore_patterns = { "^.git/", "^node_modules/" },
            mappings = {
                i = {
                    ["<C-o>"] = function(prompt_bufnr)
                        -- open all files in quickfix list in new buffers
                        require('telescope.actions').send_selected_to_qflist(prompt_bufnr, " ")
                        vim.cmd('silent cfdo edit')
                    end,
                },
                n = {
                    ["<C-o>"] = function(prompt_bufnr)
                        -- open all files in quickfix list in new buffers
                        require('telescope.actions').send_selected_to_qflist(prompt_bufnr, " ")
                        vim.cmd('silent cfdo edit')
                    end,
                },
            },
        },
        pickers = {
            live_grep = {
                additional_args = { "--hidden" }
            }
        },

    }
}
