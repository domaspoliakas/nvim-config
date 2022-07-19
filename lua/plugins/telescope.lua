local actionLayout = require("telescope.actions.layout")

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "golden" },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-t>"] = actionLayout.toggle_preview
      },
      n = {
        ["<C-t>"] = actionLayout.toggle_preview
      }
    }
  }
  --[[ defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-g",
      "golden"
    }
  } ]]
}
