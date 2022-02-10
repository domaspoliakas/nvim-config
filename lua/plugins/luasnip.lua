local ls = require("luasnip")

ls.snippets = {
  scala = {
    ls.snippet("ival", { ls.text_node("implicit val ") }),
    ls.snippet("idef", { ls.text_node("implicit def ") }),
  }
}
