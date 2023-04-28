local actionLayout = require("telescope.actions.layout")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    layout_config = {
      flex = {
        flip_columns = 200
      }
    },
    layout_strategy = "flex",
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
  },
  pickers = {
    find_files = {
      previewer = false
    },
    git_files = {
      previewer = false
    },
    buffers = {
      previewer = false
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

telescope.load_extension("ui-select")
