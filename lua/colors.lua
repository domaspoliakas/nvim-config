-- ###########
-- ## THEME ##
-- ###########

-- onedark resets highlights and I'm not sure when that occurs exactly
-- but my highlights were getting clear regardless of 
-- where I put my commands
--
-- There for I defined an autocommand to set them _after_ 
-- the colorscheme is applied to make sure it works

local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

augroup("custom_highlight", {})

aucmd("ColorScheme", { group = "custom_highlight", command = "hi! link LspReferenceText Visual"})
aucmd("ColorScheme", { group = "custom_highlight", command = "hi! link LspReferenceRead Visual"})
aucmd("ColorScheme", { group = "custom_highlight", command = "hi! link LspReferenceWrite Visual"})

vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})

augroup("highlight_yank", {})
aucmd("TextYankPost", { 
    group = "highlight_yank", 
    callback = function() 
        vim.highlight.on_yank{higroup="IncSearch", timeout=300} 
    end 
})

-- This needs to go on the bottom because of reasons
-- Check lua/plugins/onedark.lua for more
require('plugins.onedark')

