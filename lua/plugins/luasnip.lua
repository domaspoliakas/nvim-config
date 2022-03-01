local ls = require("luasnip")
local conds = require("luasnip.extras.expand_conditions")

ls.snippets = {
  scala = {
    ls.snippet("ival", { ls.text_node("implicit val ") }, { condition = conds.line_begin }),
    ls.snippet("idef", { ls.text_node("implicit def ") }, { condition = conds.line_begin }),
  }
}
