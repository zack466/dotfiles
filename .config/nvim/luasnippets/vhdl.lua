local function snip(trigger, text, nodes)
    return s({ trig = trigger }, fmt(text, nodes))
end

return {
  -- "sl" expands to "std_logic"
  snip(
    "sl",
    "std_logic",
    {}
  ),

  -- "slv" expands to "std_logic_vector(X)" with cursor at X
  snip(
    "slv",
    "std_logic_vector({1})",
    {
      i(1)
    }
  ),

  -- "const" expands to "constant X : Y := Z;" with tabstops
  snip(
    "const",
    "constant {1} : {2} := {3};",
    {
      i(1, "name"),
      i(2, "type"),
      i(3, "value")
    }
  )
}

