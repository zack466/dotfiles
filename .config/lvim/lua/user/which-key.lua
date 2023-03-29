local M = {}
M.setup = function()
  lvim.builtin.which_key.setup.plugins.presets = {
    operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
    motions = false, -- adds help for motions
    text_objects = false, -- help for text objects triggered after entering an operator
    windows = true, -- default bindings on <c-w>
    nav = true, -- misc bindings to work with windows
    z = true, -- bindings for folds, spelling and others prefixed with z
    g = true, -- bindings for prefixed with g
  }
  lvim.builtin.which_key.mappings["q"] = { ":q<cr>", "Quit" }
  lvim.builtin.which_key.mappings["C"] = { ":bd<cr>", "Delete Buffer" }
  lvim.builtin.which_key.mappings[" "] = { "<cmd>Telescope find_files<cr>", "Find Files" }
  lvim.builtin.which_key.mappings[","] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" }
  lvim.builtin.which_key.mappings["."] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" }
  lvim.builtin.which_key.mappings["m"] = { "<cmd>!make<cr>", "Make" }

  lvim.builtin.which_key.mappings["e"] = {
    function()
      local config = lvim.lsp.diagnostics.float
      config.scope = "line"
      vim.diagnostic.open_float(config)
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
