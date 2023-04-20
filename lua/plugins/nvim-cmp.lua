-- Get or set editor options, like :set. Invalid key is an error.
local options = vim.o

-- A comma separated list of options for Insert mode completion
-- menu	    Use a popup menu to show the possible completions.-
-- menuone  Use the popup menu also when there is only one match.
-- noselect  Do not select a match in the menu, force the user to
-- 	    select one from the menu. 
options.completeopt = "menu,menuone,noselect"

local handlers = require('nvim-autopairs.completion.handlers')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' }
  }
})

-- TODO don't insert parens on imports somehow
-- TODO don't insert parens on parameter-less stuff
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' }}))

local default_handler = handlers["*"]

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = default_handler
        }
      },
      scala = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          handler = function(char, item, bufnr, rules, commit_character)
            local colonIndex = string.find(item.detail, ":[^:]*$")

            if colonIndex ~= nil and
               colonIndex > 1 and
               string.sub(item.detail, colonIndex - 1, colonIndex - 1) ~= ')' then
                return
            end

            default_handler(char, item, bufnr, rules, commit_character)
          end
        }
      }
    }
  })
)
--[[
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
}) ]]
