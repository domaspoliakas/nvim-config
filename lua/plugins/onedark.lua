local global = vim.g
local options = vim.o

-- Enables 24-bit RGB color in the TUI (Terminal UI).
options.termguicolors = true

-- Syntax highlighting enables Vim to show parts of the text in another font or color.
options.syntax = 'enable'

global.onedark_terminal_italics = 1

-- > Note: All options should be set before the colorscheme onedark line in your ~/.vimrc.
vim.cmd("colorscheme onedark")
