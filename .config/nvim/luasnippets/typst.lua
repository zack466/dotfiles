local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local function snip(trigger, text, nodes)
    return s({ trig = trigger }, fmt(text, nodes))
end

return {
    -- Equation with alignment
    snip("eq", "$ {} &= {} $", { i(1), i(2) }),

    -- Less than or equal
    snip("leq", "$ {} &<= {} $", { i(1), i(2) }),
    snip("le",  "$ {} &< {} $", { i(1), i(2) }),

    -- Greater than or equal
    snip("geq", "$ {} &>= {} $", { i(1), i(2) }),
    snip("ge",  "$ {} &> {} $", { i(1), i(2) }),
}
