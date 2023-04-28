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
  else
    error("Could not find the package statement in this file")
  end
end

local function import_custom()
  local opts = {
    prompt = "Enter something to import (e.g. \"org.http4s._\"): "
  }

  local on_confirm = function(input)
    if input ~= nil and input ~= "" then
      import { "import " .. input }
    else
      print("Empty input")
    end
  end

  vim.ui.input(opts, on_confirm)
end

-- Import one of those pesky imports
local imports = function()
  vim.ui.select({
      "cats.syntax.all._",
      "cats.effect.syntax.all._",
      "cats.data.NonEmptyMap",
      "cats.data.NonEmptySet",
      "monocle.syntax.all._",
      "cats.data.NonEmptySet",
      "scala.concurrent.duration._",
      "FunctionK (~>)",
      "custom...",
    }, {
      prompt = "Import something",
      format_item = function(item)
        return item
      end
    },
    function(item, _)
      if item ~= nil then
        if item == "custom..." then
          import_custom()
        else
          import { "import " .. item }
        end
      end
    end
  )
end

------------

local ts = vim.treesitter
local q = vim.treesitter.query

-- TODO neovim seems to crash when I do this
local function effify()
  local current_node = ts.get_node()
  local class_query = q.parse("scala", "(class_definition name: (identifier) @name)")

  print("Gotya")

  if current_node ~= nil then
    print("Gotya")
    local tree = ts.get_node_text(current_node:tree():root(), 0)

    for pattern, match, metadata in class_query:iter_matches(tree:root(), 0, 1, 21) do
      for id, node in pairs(match) do
        -- name of the _capture_
        local name = class_query.captures[id]
        local node_data = metadata[id]

        print("HEK")
        print(ts.get_node_text(node, 0))

      end
    end
  end
end

---

M.imports = imports
M.effify = effify

return M
