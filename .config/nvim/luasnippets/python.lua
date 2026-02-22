local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
    s("main", fmt([[
def main():
    {}

if __name__ == "__main__":
    main()
]], {
        i(0)
    }))
})

