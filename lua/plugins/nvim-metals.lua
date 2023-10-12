local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

local metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = false,
  superMethodLensesEnabled = false,
  enableSemanticHighlighting = false
}

metals_config.on_attach = function(_, bufnr)
  aucmd("CursorHold", {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight
    })

  aucmd("CursorMoved", {
      buffer = bufnr,
      callback = function (args) 
        vim.lsp.buf.clear_references(args.buf)
      end
    })

  aucmd({"BufEnter", "CursorHold", "InsertLeave"}, {
      buffer = bufnr,
      callback = vim.lsp.codelens.refresh
    })

  require('metals').setup_dap()
end

local lsp_au_group = augroup("lsp", {})

aucmd("FileType", {
    pattern = { "scala", "java", "sbt" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = lsp_au_group
  })
