-- ### SETUP ###
local gl = require("galaxyline")
local gls = gl.section
local conditions = require('galaxyline.condition')

--- ### MISC SETTINGS ###

-- Disable '--INSERT--' etc in the command line
vim.o.showmode = false

--- ### HELPERS ###

local buffer_not_empty = conditions.buffer_not_empty

--[[ local lefts = 1
function pushLeft(elem) 
  gls.left[lefts] = elem
  lefts = lefts + 1
end

local shortLefts = 1
function pushShortLeft(elem) 
  gls.short_line_left[shortLefts] = elem
  shortLefts = shortLefts + 1
end

local rights = 1
function pushRight(elem) 
  gls.right[rights] = elem
  rights = rights + 1
end

local shortRights = 1
function pushShortRight(elem) 
  gls.short_line_right[shortRights] = elem
  shortRights = shortRights + 1
end

local mids = 1
function pushMid(elem)
  gls.mid[mids] = elem
  mids = mids + 1
end ]]


local colors = {
  bg = "#282c34", -- black
  line_bg = "#353644",
  fg = "#abb2bf", -- white

  dark_red = "#be5046",
  dark_yellow = "#d19a66",
  gutter_grey = "#4b5263",
  comment_grey = "#5c6370",

  yellow = "#e5c07b", -- light yellow
  cyan = "#56b6c2", -- cyan
  green = "#98c379", -- green
  orange = "#be5046",
  purple = "#5d4d7a",
  magenta = "#c678dd", -- magenta
  blue = "#61afef", -- blue
  red = "#e06c75", -- light red
}

-- ### MAIN ###

gls.left[1] = {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        [""] = colors.magenta, -- visual block
        v = colors.magenta,
        [""] = colors.magenta,
        V = colors.magenta,
        c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange, -- select block
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      return "▊"
    end,
    separator = ' ',
    separator_highlight = { colors.fg, colors.line_bg },
    highlight = { colors.red, colors.line_bg },
  },
}

gls.left[2] = {
  FileIcon = {
      provider = { "FileIcon" },
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.line_bg },
    }
}

gls.left[3] = {
  FileName = {
      provider = function()
        local a = vim.fn.expand("%")
        return a
      end,
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.line_bg },
    }
}

gls.right[1] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "",
    highlight = { colors.red, colors.line_bg },
  },
}

gls.right[2] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "",
    highlight = { colors.yellow, colors.line_bg },
  },
}

gls.right[3] = {
  MetalsStatus = {
    provider = function()
      return (vim.g["metals_status"] or "")
    end,
    highlight = { colors.fg, colors.dark_red },
  },
}

-- ### SHORTS ###

