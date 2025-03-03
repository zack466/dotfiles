local function snip(trigger, text, nodes)
    return s({ trig = trigger }, fmt(text, nodes))
end

return {
    snip("app", "apply {}.", { c(1, {
        i(1),
        fmt("{} in {}", { i(1), i(2) }) 
    }) }),
    snip("ass", "assert ({}: {}). {{{}}}", { i(1, "H"), i(2), i(3) }),
    snip("des", "destruct {}{}.", {
        c(1, {
            i(1),
            fmt("{} as [{}]", { i(1), i(2) })
        }),
        c(2, {
            i(1),
            fmt("{}eqn:{}", { t(" "), i(1, "E") })
        })
    }),
    snip("dis", "discriminate{}.", {i(1)}),
    snip("ind", "induction {}.", { c(1, {
        fmt("{} as [|{} {}]", { i(1), i(2), i(3, "IH") }),
        i(1)
    }) }),
    snip("inj", "injection {}.", { c(1, {
        fmt("{} as {}", { i(1), i(2) }),
        i(1)
    }) }),
    snip("int", "intros{}.", {i(1)}),
    snip("ref", "reflexivity.", {}),
    snip("rep", "replace ({}) with ({}).", { i(1), i(2) }),
    snip("rew", "rewrite{} {}.", {
        c(2, {
            i(1),
            fmt("{}<-{}", {t(" "), i(1)})
        }),
        c(1, {
            i(1),
            fmt("{} in {}", { i(1), i(2) })
        })
    }),
    snip("sim", "simpl{}.", { c(1, {
        i(1),
        fmt("{}in {}", { t(" "), i(1) })
    }) }),
    snip("spe", "specialize {} with ({}).", { i(1), i(2) }),
    snip("unf", "unfold {}.", { c(1, {
        i(1),
        fmt("{} in {}", { i(1), i(2) }) 
    }) }),
}
