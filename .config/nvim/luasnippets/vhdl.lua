local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- "sl" expands to "std_logic"
  s({
    trigger = "sl",
    name = "std_logic",
    dscr = "Standard logic type"
  }, {
    t("std_logic")
  }),

  -- "slv" expands to "std_logic_vector(X)" with cursor at X
  s({
    trigger = "slv",
    name = "std_logic_vector",
    dscr = "Standard logic vector type"
  }, {
    t("std_logic_vector("),
    i(1),
    t(")")
  }),

  -- "const" expands to "constant X : Y := Z;" with tabstops
  s({
    trigger = "const",
    name = "constant",
    dscr = "VHDL constant declaration"
  }, {
    t("constant "),
    i(1, "name"),
    t(" : "),
    i(2, "type"),
    t(" := "),
    i(3, "value"),
    t(";")
  })
}
