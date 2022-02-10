require('plugins')
require('plugins.galaxyline')
require('plugins.nvim-cmp')
require('plugins.nvim-metals')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.indent-blankline')
require('plugins.luasnip')
require('keymap')

-- Get or set editor options, like :set. Invalid key is an error.
local options = vim.o

-- Global (g:) editor variables.
local global = vim.g

-- ###############
-- ## SEARCHING ##
-- ###############

-- While typing a search command, show where the pattern, as it was typed so far, matches.
options.incsearch = true
-- If the 'ignorecase' option is on, the case of normal letters is ignored.
options.ignorecase = true
-- Override the 'ignorecase' option if the search pattern contains upper case characters.
options.smartcase = true

-- #############
-- ## GENERAL ##
-- #############

-- When off a buffer is unloaded (including loss of undo information)
-- when it is abandoned.  When on a buffer becomes hidden when it is
-- abandoned.
options.hidden = true
-- precede each line with its line number
options.number = true
-- Show the line number relative to the line with the cursor in front of each line.
options.relativenumber = true

-- Number of spaces that a <Tab> in the file counts for. 
options.tabstop = 2

-- Number of spaces to use for each step of (auto)indent.  Used for
-- 'cindent', >>, <<, etc.
options.shiftwidth = 2

-- In Insert mode: Use the appropriate number of spaces to insert a
-- <Tab>.  Spaces are used in indents with the '>' and '<' commands and
-- when 'autoindent' is on.  To insert a real tab when 'expandtab' is
-- on, use CTRL-V<Tab>
options.expandtab = true

-- Copy indent from current line when starting a new line (typing <CR>
-- in Insert mode or when using the "o" or "O" command).
options.autoindent = true

-- Draw signs in the number column
options.signcolumn = "number"

-- If this many milliseconds nothing is typed the swap file will be
-- written to disk.  Also used for the CursorHold autocommand event.
options.updatetime = 300

-- Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
options.cursorline = true
-- When on, lines longer than the width of the window will wrap and
-- displaying continues on the next line.  When off lines will not wrap
options.wrap = false

-- Like 'autowrite', but also used for commands ":edit", ":enew", ":quit",
-- ":qall", ":exit", ":xit", ":recover" and closing the Vim window.
--
options.autowriteall = true

-- Name of the shell to use for ! and :! commands
options.shell = "fish"

-- To make ripgrep work
options.grepprg = "rg --vimgrep"
options.grepformat = "%f:%l:%c:%m"

-- expand the longest matching common substring of commands
options.wildmode = "longest:full"

--[[ don't give ins-completion-menu messages.  For example,
"-- XXX completion (YYY)", "match 1 of 2", "The only match",
"Pattern not found", "Back at original", etc. ]]
vim.opt_global.shortmess:append("c")

-- ## COLORS ##
require('colors')
