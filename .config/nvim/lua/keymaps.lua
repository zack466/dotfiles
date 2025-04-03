require("which-key").add({
    {
        -- better indenting
        { ">", ">gv", mode = "v" },
        { "<", "<gv", mode = "v" },
    },

    {
        -- moving between items
        { "]q", "<CMD>cnext<CR>", desc = "next quickfix" },
        { "[q", "<CMD>cprev<CR>", desc = "previous quickfix" },
    },

    {
        -- center selection when searching
        { "n", "nzzzv", desc = "center when searching" },
        { "N", "Nzzzv", desc = "center when searching" },
    },

    {
        -- moving between windows
        { "<C-J>", "<C-W><C-J>", desc = "window down" },
        { "<C-K>", "<C-W><C-K>", desc = "window up" },
        { "<C-H>", "<C-W><C-H>", desc = "window left" },
        { "<C-L>", "<C-W><C-L>", desc = "window right" },
    },

    {
        -- swap display line up/down
        mode = { "n", "v" },
        { "j",  "gj", desc = "display line down" },
        { "k",  "gk", desc = "display line up" },
        { "gj", "j",  desc = "line down" },
        { "gk", "k",  desc = "line up" },
    },

    {
        -- visual mode bindings
        mode = { "v" },
        {
            -- swap lines up/down
            { "J", ":m '>+1<CR>gv=gv", desc = "swap line down" },
            { "K", ":m '<-2<CR>gv=gv", desc = "swap line up" },
        },
        { "<C-a>", [[:s/\d\+/\=(submatch(0)+1)/g<cr>:nohlsearch<cr>]], desc = "increment all" },
        { "<C-k>", "c[<Esc>pa]()<Esc>i",                               desc = "markdown comment" },

    },

    {
        -- general shortcuts
        { "<leader>q",        "<CMD>q<CR>",                                desc = "quit" },
        { "<leader>w",        "<CMD>w<CR>",                                desc = "save" },
        { "<leader>h",        "<CMD>nohl<CR>",                             desc = "no highlight" },
        -- { "<C-n>",            "<CMD>NvimTreeToggle<CR>",                   desc = "toggle filetree" },
        { "<C-n>",            "<CMD>NnnPicker %:p:h<CR>",                  desc = "toggle file explorer", mode = { "t", "n" } },
        { "<leader>c",        "<CMD>Bdelete<CR>",                          desc = "close buffer" },
        { "<leader>,",        "<CMD>bprev<CR>",                            desc = "prev buffer" },
        { "<leader>.",        "<CMD>bnext<CR>",                            desc = "next buffer" },
        { "<leader><leader>", "<CMD>Telescope find_files hidden=true<CR>", desc = "find file" },
        { "<leader>n",        "<CMD>NnnPicker<CR>",                        desc = "open file directory",  mode = { "n" } },
        { "<leader>N",        "<CMD>OpenFinder<CR>",                       desc = "open finder" },
        { "<leader>S",        "<CMD>ToggleSpell<CR>",                      desc = "toggle spellcheck" },
        -- { "<leader>n",        "<CMD>tabnew<CR>",                           desc = "new tab" },
        -- { "<leader>[",        "<CMD>tabprevious<CR>",                      desc = "prev tab" },
        -- { "<leader>]",        "<CMD>tabnext<CR>",                          desc = "next tab" },
        { "<leader>m",        "<CMD>ExecuteMake<CR>",                      desc = "make" },
        { "gd",               vim.lsp.buf.definition,                      desc = "go to definition" },
        { "gD",               vim.lsp.buf.declaration,                     desc = "go to definition" },
    },

    {
        -- git
        { "<leader>g",  group = "git" },
        { "<leader>gg", "<CMD>Lazygit<CR>",                                           desc = "lazygit" },
        { "<leader>gn", "<CMD>lua require('neogit').open({ kind = 'floating' })<CR>", desc = "neogit" },
    },

    {
        -- buffers
        { "<leader>b",  group = "buffer" },
        { "<leader>bn", "<CMD>bnext<CR>",             desc = "next buffer" },
        { "<leader>bp", "<CMD>bprev<CR>",             desc = "prev buffer" },
        { "<leader>bc", "<CMD>Bdelete<CR>",           desc = "delete buffer" },
        { "<leader>bb", "<CMD>Telescope buffers<CR>", desc = "find buffer" },
    },

    {
        -- toggleterm
        { "<C-t>", "<CMD>Terminal<CR>", desc = "toggleterm" },
        {
            mode = { "t" },
            -- { "<Esc>",  "<C-\\><C-n>",            desc = "escape" },
            { "<C-\\>", "<C-\\><C-n><Esc><C-w>c", desc = "toggleterm" },
        }

    },

    -- {
    --     -- oil.nvim
    --     { "-", "<CMD>Oil<CR>", desc = "Open parent directory", mode = { "n" } },
    -- },


    {
        -- telescope
        { "<leader>f",  group = "telescope" },
        { "<leader>ff", "<CMD>Telescope find_files hidden=true<CR>",                desc = "find file" },
        { "<leader>fa", "<CMD>Telescope find_files hidden=true no_ignore=true<CR>", desc = "find file (no ignore)" },
        { "<leader>fg", "<CMD>Telescope live_grep<CR>",                             desc = "find text" },
        { "<leader>fb", "<CMD>Telescope buffers<CR>",                               desc = "find buffer" },
        { "<leader>fh", "<CMD>Telescope help_tags<CR>",                             desc = "search help" },
        { "<leader>ft", "<CMD>Telescope builtin<CR>",                               desc = "telescope builtin" },
    },

    {
        -- luasnip
        { "<S-TAB>", "<CMD>lua require'luasnip'.expand()<CR>",         mode = "i" },
        { "<C-j>",   "<CMD>lua require'luasnip'.jump(1)<CR>",          mode = { "i", "s" } },
        { "<C-k>",   "<CMD>lua require'luasnip'.jump(-1)<CR>",         mode = { "i", "s" } },
        { "<C-e>",   "<CMD>lua require'luasnip'.change_choice(1)<CR>", mode = { "i", "s" } },
        {
            "<C-e>",
            function()
                if require("luasnip").choice_active() then
                    require("luasnip").change_choice(1)
                end
            end,
            mode = { "i", "s" }
        },
    },

    {
        -- lazy
        { "<leader>L",  group = "Config" },
        { "<leader>Lc", "<CMD>Config<CR>", desc = "open config" },
    },

    {
        -- plugins
        { "<leader>p",  group = "Lazy" },
        { "<leader>pp", "<CMD>Lazy profile<CR>", desc = "profile" },
        { "<leader>pi", "<CMD>Lazy install<CR>", desc = "install" },
        { "<leader>pu", "<CMD>Lazy update<CR>",  desc = "update" },
        { "<leader>pc", "<CMD>Lazy clean<CR>",   desc = "clean" },
        { "<leader>ps", "<CMD>Lazy sync<CR>",    desc = "sync" },
        { "<leader>ph", "<CMD>Lazy health<CR>",  desc = "health" },
    },

    {
        -- lsp
        { "<leader>l",  group = "lsp" },
        { "<leader>lI", "<CMD>LspInfo<CR>",                                 desc = "info" },
        { "<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>",          desc = "document symbols" },
        { "<leader>lS", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "workspace symbols" },
        { "<leader>ld", vim.lsp.buf.definition,                             desc = "definition" },
        { "<leader>lD", "<CMD>Telescope lsp_definitions<CR>",               desc = "all definitions" },
        { "<leader>lh", vim.lsp.buf.hover,                                  desc = "hover" },
        { "<leader>li", vim.lsp.buf.implementation,                         desc = "implementation" },
        { "<leader>lH", vim.lsp.buf.signature_help,                         desc = "signature help" },
        { "<leader>lr", vim.lsp.buf.references,                             desc = "references" },
        { "<leader>lR", "<CMD>Telescope lsp_references<CR>",                desc = "all references" },
        { "<leader>ln", vim.lsp.buf.rename,                                 desc = "rename" },
        { "<leader>la", vim.lsp.buf.code_action,                            desc = "code action" },
        { "<leader>e",  vim.diagnostic.open_float,                          desc = "open float" },
        { "<leader>lp", vim.diagnostic.goto_prev,                           desc = "goto prev" },
        { "<leader>ln", vim.diagnostic.goto_next,                           desc = "goto next" },
        { "<leader>lf", "<CMD>FormatBuffer<CR>",                            desc = "format" },
        { "<C-l>",      vim.lsp.buf.signature_help,                         mode = "i" },

    },

    {
        { "<leader>t", group = "Trouble" },
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>tl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>tL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>tQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },

    {
        { "<leader>i", group = "AI" },
        {
            "<leader>ic",
            "<cmd>CodeCompanionChat Toggle<cr>",
            desc = "Toggle Chat",
        },
        {
            "<leader>ii",
            ":CodeCompanion @editor #buffer ",
            desc = "Inline Prompt",
        },
        {
            "<leader>ip",
            "<cmd>CodeCompanionActions<cr>",
            desc = "Inline Prompt",
        },
        {
            "<leader>i",
            ":CodeCompanion @editor ",
            desc = "Visual prompt",
            mode = "v"
        },
    },

    -- {
    --     -- debugger
    --     { "<leader>d",  group = "debugger" },

    --     { "<leader>dt", "<CMD>lua require'dapui'.toggle()<CR>",          desc = "toggle ui" },
    --     { "<leader>dx", "<CMD>lua require'dap'.disconnect()<CR>",        desc = "stop" },
    --     { "<leader>dr", "<CMD>lua require'dap'.restart()<CR>",           desc = "restart" },

    --     { "<leader>db", "<CMD>DapToggleBreakpoint<CR>",                  desc = "toggle breakpoint" },
    --     { "<leader>dB", "<CMD>lua require'dap'.clear_breakpoints()<CR>", desc = "clear breakpoints" },

    --     { "<leader>dc", "<CMD>DapContinue<CR>",                          desc = "continue" },
    --     { "<leader>do", "<CMD>DapStepOver<CR>",                          desc = "step over" },
    --     { "<leader>di", "<CMD>DapStepInto<CR>",                          desc = "step into" },
    --     { "<leader>dO", "<CMD>DapStepOut<CR>",                           desc = "step out" },
    --     { "<leader>dC", "<CMD>lua require'dap'.run_to_cursor()<CR>",     desc = "run to cursor" },
    --     { "<leader>ds", "<CMD>lua require'dap'.goto_()<CR>",             desc = "skip to cursor" },

    --     { "<leader>df", "<CMD>lua require'dap'.focus_frame()<CR>",       desc = "find current line" },
    -- },

})
