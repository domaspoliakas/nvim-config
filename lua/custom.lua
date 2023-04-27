-- Custom funcs

local M = {}

local function import(import_lines)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local packageIndex = nil
  for i, line in ipairs(lines) do
    if string.sub(line, 1, 7) == "package" then
      packageIndex = i
      break
    end

  end

  if packageIndex ~= nil then
    vim.api.nvim_buf_set_lines(0, packageIndex, packageIndex, false, { "", unpack(import_lines) })
  end
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- Scala convenient imports telescope picker
local imports = function()
  local opts = require("telescope.themes").get_dropdown{}

  pickers.new(opts, {
    prompt_title = "import",
    finder = finders.new_table {
      results = {
        {
          "cats.syntax.all._",
          function ()
            import { "import cats.syntax.all._"}
          end
        },
        {
          "FunctionK (~>)",
          function ()
            import { "import cats.~> "}
          end
        }
      },
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        selection.value[2]()
      end)
      return true
    end,
  }):find()
end

M.imports = imports

return M
