metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = true
}

metals_config.on_attach = function(client, bufnr)
  vim.cmd([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
  vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  vim.cmd([[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])
end

vim.cmd([[augroup lsp]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
vim.cmd([[autocmd FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
vim.cmd([[augroup end]])

