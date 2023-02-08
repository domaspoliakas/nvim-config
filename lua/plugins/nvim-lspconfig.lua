-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
local util = require 'lspconfig.util'

if not configs.wsk_lsp then
  configs.wsk_lsp = {
    default_config = {
      -- cmd = { '/home/dpol/open-source/scala/langoustine/modules/tracer/backend/target/jvm-3/universal/stage/bin/langoustine-tracer', '/home/dpol/misc/wsk-lsp-native/target/scala-3.2.0/wsk-lsp-out' },
      cmd = { '/home/dpol/precog/devtools/wsk-lsp/server/target/scala-3.2.0/wsk-lsp-out' },
      -- cmd = { '/home/dpol/.local/share/coursier/bin/scala-cli', 'run', '/home/dpol/misc/wsk-lsp/poop/potato.scala' },
      filetypes = { 'json' },
      root_dir = util.root_pattern('web-source-kinds'),
      settings = {}
    };
  }
end


lspconfig.wsk_lsp.setup {
  on_attach = function (client, bufnr)
    require("vim.treesitter.query").set_query("json", "injections", [[
      value: (string (string_content) @precog)
    ]])
  end
}

lspconfig['rust_analyzer'].setup {
  cmd = { "rustup", "run", "nightly", "rust-analyzer" }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.precog = {
  install_info = {
    url = "/home/dpol/misc/tree-sitter-precog",
    files = {"src/parser.c"},
    generate_requires_npm = false
  },
  filetype = "precog"
}

-- example to setup sumneko and enable call snippets
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

--[[ vim.treesitter.parse_query(
  "json",
  "value: (string (string_content) @string)"
) ]]
