local detail = false

return {
    'stevearc/oil.nvim',
    opts = {
        columns = {
            "icon",
        },
        watch_for_changes = true,
        skip_confirm_for_simple_edits = false,
        keymaps = {
            ["gd"] = {
                desc = "Toggle file detail view",
                callback = function()
                    detail = not detail
                    if detail then
                        require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                    else
                        require("oil").set_columns({ "icon" })
                    end
                end,
            },
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
