local status, lualine = pcall(require, "lualine")
if not status then
	return
end
--
--
local colors = {
	red = "#ee6d85",
	green = "#95c561",
	blue = "#7199ee",
	grey = "#11121d",
	gray = "#4a5057",
	cyan = "#8cf7ee",
	purple = "#a485dd",
	yellow = "#d7a65f",
	orange = "#f6955b",
}
local theme = {
  normal = {
      a = {bg = colors.blue, fg = "#000000"} , b = {bg = colors.grey}, c = {fg = colors.blue}, x = {fg = "#aaafff"}, z={bg = colors.green, fg="#000000"}
  },
  insert = { a = {bg = colors.green , fg = "#000000"}, x = {fg = "#aaafff"} , b = {bg = colors.grey}, c = {fg = colors.green},  z={bg = colors.orange, fg="#000000"}},
  visual = { a = {bg = colors.purple, fg = "#000000"} , b = {bg = colors.grey}, c = {fg = colors.purple}, x = {fg = "#aaafff"}, z={bg = colors.blue, fg="#000000"} },

  replace = {a = {bg = colors.red, fg = "#000000"} , b = {bg = colors.grey}, c = {fg = colors.red}, x = {fg = "#aaafff"}, z={bg = colors.yellow, fg="#000000"}},
}

lualine.setup ({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "❯" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right="" }, right_padding = 2 } },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { {"encoding", separator={left = ""}}, "filetype"},
		lualine_y = { {"progress", separator = {left = "", right = ""} }},
		lualine_z = { { "location", separator = {right = "" } } },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

