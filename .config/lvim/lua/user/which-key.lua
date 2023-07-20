local M = {}
M.setup = function()
  lvim.builtin.which_key.setup = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
  }

  lvim.builtin.which_key.mappings["q"] = { ":q<cr>", "Quit" }
  lvim.builtin.which_key.mappings["C"] = { ":bd<cr>", "Delete Buffer" }
  lvim.builtin.which_key.mappings[" "] = { "<cmd>Telescope find_files<cr>", "Find Files" }
  lvim.builtin.which_key.mappings[","] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" }
  lvim.builtin.which_key.mappings["."] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" }
  lvim.builtin.which_key.mappings["m"] = { "<cmd>!make<cr>", "Make" }

  lvim.builtin.which_key.mappings["e"] = {
    function()
      vim.diagnostic.config({ float = true } );
      vim.diagnostic.open_float()
    end,
    "Show line diagnostics",
  }

  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    t = { "<cmd>TroubleToggle<cr>", "Toggle" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  }
end
return M
