require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "golden" },
    mappings = {
      i = {
        -- ["<C-t>"] = "layout.toggle_preview",
        ["<C-h>"] = "which_key"
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
