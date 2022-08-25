local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end
local cp = require("catppuccin.palettes").get_palette()
local custom_catppuccin = require "lualine.themes.catppuccin"
custom_catppuccin.normal.b.bg = cp.surface0
custom_catppuccin.normal.c.bg = cp.base
custom_catppuccin.insert.b.bg = cp.surface0
custom_catppuccin.command.b.bg = cp.surface0
custom_catppuccin.visual.b.bg = cp.surface0
custom_catppuccin.replace.b.bg = cp.surface0
custom_catppuccin.inactive.a.bg = cp.surface0
custom_catppuccin.inactive.c.bg = cp.base
custom_catppuccin.inactive.b.bg = cp.surface0
require("lualine").setup {
  options = {
    globalstatus = false,
    theme = custom_catppuccin,

		component_separators = "|",
		section_separators = { left = "", right = "" },
  },
  extensions = { "fugitive", "nvim-tree", "toggleterm", "aerial", "quickfix", "symbols-outline" },
	sections = {
		-- lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_a = { { "mode", right_padding = 2 } },
    lualine_b = {
      { "filename" },
      { "branch" },
      {
        "diff",
        symbols = { added = " ", modified = "柳", removed = " " }, -- changes diff symbols
      },
      { "diagnostics" },
    },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filetype","vim.api.nvim_buf_line_count(0)" },
		lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
		-- lualine_z = { { "location", left_padding = 2 } },
	},
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = {
		lualine_a = {
			{
				"buffers",
				-- separator = { left = "", right = "" },
				separator = { right = "" },
				right_padding = 2,
				symbols = { alternate_file = "" },
			},
		},
	},
}
