require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  folding = { enable = true },
  playground = { enable = true }
  --[[ incremental_selection = { enable = true },
  textobjects = { enable = true }, ]]
}


require'treesitter-context'.setup {
  patterns = {
    json = {
      'pair'
    }
  }
}
