-- ###########
-- ## THEME ##
-- ###########

-- onedark resets highlights and I'm not sure when that occurs exactly
-- but my highlights were getting clear regardless of 
-- where I put my commands
--
-- There for I defined an autocommand to set them _after_ 
-- the colorscheme is applied to make sure it works
vim.cmd [[augroup custom_highlight]]

vim.cmd [[autocmd!]]
vim.cmd [[au ColorScheme * hi! link LspReferenceText Visual]]
vim.cmd [[au ColorScheme * hi! link LspReferenceRead Visual]]
vim.cmd [[au ColorScheme * hi! link LspReferenceWrite Visual]]

vim.cmd [[augroup END]]

vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})

vim.cmd [[augroup highlight_yank]]
    vim.cmd [[autocmd!]]
    vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}]]
vim.cmd [[augroup END]]

-- This needs to go on the bottom because of reasons
-- Check lua/plugins/onedark.lua for more
require('plugins.onedark')

