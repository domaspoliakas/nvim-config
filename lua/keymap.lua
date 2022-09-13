require("globals")

-- esc to leave terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<c-\><c-n>]], {noremap = true})

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- telescope
map("n", "<leader>ff", [[<cmd>lua require"telescope.builtin".git_files()<CR>]])
map("n", "<leader>lg", [[<cmd>lua require"telescope.builtin".live_grep(({ prompt_prefix=🔍 }))<CR>]])
map("n", "<leader>bu", [[<cmd>lua require"telescope.builtin".buffers()<CR>]])
map("n", "<leader>re", [[<cmd>lua require"telescope.builtin".registers()<CR>]])
map("n", "<leader>qf", [[<cmd>lua require"telescope.builtin".quickfix()<CR>]])
map("n", "<leader>tl", [[<cmd>lua require"telescope.builtin".resume()<CR>]])
map("n", "<leader>mc", [[<cmd>lua require("telescope").extensions.metals.commands()<CR>]])

-- dap
map("n", "<leader>dc", [[<cmd>lua require("dap").continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require("dap").repl.toggle()<CR>]])
map("n", "<leader>dK", [[<cmd>lua require("dap.ui.widgets").hover()<CR>]])
map("n", "<leader>dt", [[<cmd>lua require("dap").toggle_breakpoint()<CR>]])
map("n", "<leader>dso", [[<cmd>lua require("dap").step_over()<CR>]])
map("n", "<leader>dsi", [[<cmd>lua require("dap").step_into()<CR>]])
map("n", "<leader>drl", [[<cmd>lua require("dap").run_last()<CR>]])

-- quickfix
map("n", "<leader>fo", ":copen<cr>")
map("n", "<leader>fc", ":cclose<cr>")
map("n", "<leader>fn", ":cnext<cr>")
map("n", "<leader>fp", ":cprevious<cr>")

-- scala-utils
map("n", "<leader>slc", [[<cmd>lua RELOAD("scala-utils.coursier").complete_from_line()<CR>]])
map("n", "<leader>sc", [[<cmd>lua RELOAD("scala-utils.coursier").complete_from_input()<CR>]])

-- kill highlight 
map("n", "<C-h>", ":noh<cr>")

-- LSP
map("n", "<leader>k", [[<cmd>lua vim.lsp.buf.hover()<CR>]])
map("v", "<leader>k", [[<cmd>lua vim.lsp.buf.hover()<CR>]])

map("i", "<C-s>", [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]])
map("n", "<C-s>", [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]])
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
map("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
map("n", "<leader>sd", [[<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>]])
map("n", "<leader>sw", [[<cmd>lua require"telescope.builtin".lsp_dynamic_workspace_symbols()<CR>]])
map("n", "<leader>rn", [[<cmd>lua require('lspsaga.rename').rename()<CR>]])
map("n", "<leader>a", [[<cmd>lua require('lspsaga.codeaction').code_action()<cr>]])
map("v", "<leader>a", [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<cr>]]) 
map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>K", [[<cmd>lua require"metals".hover_worksheet()<CR>]])
-- map("n", "<leader>tt", [[<cmd>lua require("metals.tvp").toggle_tree_view()<CR>]])
-- map("n", "<leader>tr", [[<cmd>lua require("metals.tvp").reveal_in_tree()<CR>]])
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>")

map("n", "<leader>st", [[<cmd>lua require("metals").toggle_setting("showImplicitArguments")<CR>]])

-- diagnostics
map("n", "<leader>da", [[<cmd>lua require"telescope.builtin".diagnostics()<CR>]])
map("n", "<leader>db", [[<cmd>lua require"telescope.builtin".diagnostics({bufnr = 0})<CR>]])
map("n", "<leader>dae", [[<cmd>lua require"telescope.builtin".diagnostics({ severity = "E" })<CR>]])
map("n", "<leader>dbe", [[<cmd>lua require"telescope.builtin".diagnostics({ severity = "E", bufnr = 0})<CR>]])
map("n", "]d", [[<cmd>Lspsaga diagnostic_jump_next<CR>]])
map("n", "[d", [[<cmd>Lspsaga diagnostic_jump_prev<CR>]])



