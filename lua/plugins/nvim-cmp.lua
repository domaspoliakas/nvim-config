-- Get or set editor options, like :set. Invalid key is an error.
local options = vim.o

options.completeopt = "menu,menuone,noinsert"

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
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
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
    {
      name = 'nvim_lsp'
      --[[ entry_filter = function(entry, ctx)
        print("POTOOT")
        print(vim.inspect(entry:get_completion_item()))
        print(require('cmp.types').lsp.CompletionItemKind[entry:get_kind()])
        -- print(vim.inspect(ctx))
        return true
      end ]]
    },
    { name = 'buffer' },
    { name = 'luasnip' }
  }
})

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
                 (colonIndex > 1 or
                  string.sub(item.detail, colonIndex - 1, colonIndex - 1) ~= ')') then
                return
            end

            default_handler(char, item, bufnr, rules, commit_character)
          end
        }
      }
    }
  })
)
