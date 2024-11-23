local commands = {

    FormatBuffer = function()
        require("conform").format({ async = true, lsp_format = "fallback" })
    end,


    OpenFinder = function()
        local file_path = vim.fn.expand("%")
        local success
        if file_path ~= "" then
            success, _ = pcall(vim.system, { "open", "-R", file_path }, {})
        else
            success, _ = pcall(vim.system, { "open", vim.fn.expand("%:p:h") }, {})
        end
        if not success then
            vim.print("`open` failed to execute")
        end
    end,


    ToggleSpell = function()
        vim.opt_local.spell = not vim.opt_local.spell:get()
    end,


    Lazygit = function()
        local dir = vim.fn.expand("%:h")
        if vim.fn.isdirectory(dir) == 0 then
            dir = "."
        end
        require("toggleterm.terminal").Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            dir = dir,
            on_open = function(_)
                vim.cmd "startinsert!"
            end,
            count = 99
        }):toggle()
    end,

    ExecuteMake = function()
        require("toggleterm.terminal").Terminal:new({
            cmd = "make",
            hidden = true,
            close_on_exit = false,
            direction = "float",
            dir = "git_dir",
            on_open = function(_)
                vim.cmd "startinsert!"
            end,
            count = 10
        }):toggle()
    end,

    Terminal = function()
        local dir = vim.fn.expand("%:h")
        if vim.fn.isdirectory(dir) == 0 then
            dir = "."
        end
        require("toggleterm.terminal").Terminal:new({
            hidden = true,
            direction = "float",
            dir = dir,
            on_open = function(_)
                vim.cmd "startinsert!"
            end,
            count = 0
        }):toggle()
    end,

    Config = function()
    end,

}


for name, cmd in pairs(commands) do
    vim.api.nvim_create_user_command(name, cmd, {})
end
