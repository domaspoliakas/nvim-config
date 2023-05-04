require'nvim-treesitter.install'.compilers = { "gcc-13" }

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "json" },
  sync_install = false,
  auto_install = true,

  -- Modules and its options go here
  highlight = { enable = true },
  folding = { enable = true },
  playground = { enable = true },
  --[[ incremental_selection = { enable = true }, ]]
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    }
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.scala = {
  install_info = {
    -- url can be Git repo or a local directory:
    -- url = "~/work/tree-sitter-scala",
    url = "https://github.com/tree-sitter/tree-sitter-scala.git",
    branch = "master",
    files = {"src/parser.c", "src/scanner.c"},
    requires_generate_from_grammar = false,
  },
}

require'treesitter-context'.setup {
  patterns = {
    json = {
      'pair'
    },
    scala = {
      'object_definition',
      'function_definition'
    }
  }
}

