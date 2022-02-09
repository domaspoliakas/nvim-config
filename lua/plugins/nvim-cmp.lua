-- Get or set editor options, like :set. Invalid key is an error.
local options = vim.o

-- A comma separated list of options for Insert mode completion
-- menu	    Use a popup menu to show the possible completions.-
-- menuone  Use the popup menu also when there is only one match.
-- noselect  Do not select a match in the menu, force the user to
-- 	    select one from the menu. 
options.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})
