
local colors = {
	black = "#000000";
	white = "#ffffff";
	gray = "#262626";
	blue = "#237eff";
	cyan = "#56beff";
	red = "#ff237f";
	green = "#9df260";
	orange = "#fccb50";
	purple = "#b162ea";
	pink = "#ffaaef";
}

local theme = {
	normal = {
		a = {bg = colors.blue, fg = colors.white, gui = 'bold'},
		b = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		c = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		x = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		y = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		z = {bg = colors.gray, fg = colors.white, gui = 'bold'},
	},
	insert = {
		a = {bg = colors.red, fg = colors.white, gui = 'bold'},
		b = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		c = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		x = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		y = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		z = {bg = colors.gray, fg = colors.white, gui = 'bold'},
	},
	visual = {
		a = {bg = colors.purple, fg = colors.white, gui = 'bold'},
		b = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		c = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		x = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		y = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		z = {bg = colors.gray, fg = colors.white, gui = 'bold'},
	},
	replace = {
		a = {bg = colors.orange, fg = colors.white, gui = 'bold'},
		b = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		c = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		x = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		y = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		z = {bg = colors.gray, fg = colors.white, gui = 'bold'},
	},
	command = {
		a = {bg = colors.green, fg = colors.white, gui = 'bold'},
		b = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		c = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		x = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		y = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		z = {bg = colors.gray, fg = colors.white, gui = 'bold'},
	},
	terminal = {
		a = {bg = colors.pink, fg = colors.white, gui = 'bold'},
		b = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		c = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		x = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		y = {bg = colors.gray, fg = colors.white, gui = 'bold'},
		z = {bg = colors.gray, fg = colors.white, gui = 'bold'},
	},
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
