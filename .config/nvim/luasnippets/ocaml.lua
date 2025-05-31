local function snip(trigger, text, nodes)
    return s({ trig = trigger }, fmt(text, nodes))
end

return {
  -- "beg" expands to "begin ... end"
snip("beg", [[
begin
{}
end]], { i(1) })
}

