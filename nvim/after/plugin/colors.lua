function Colors(color)

	-- Define default colorscheme
	color = color or "oxocarbon"
	vim.cmd.colorscheme(color);

	-- Define colors
	accent = "#ff237f"
	gray = "#161616"
	white = "#ffffff"
	blue = "#78a9ff" 
	cyan = "#3ddbd9"

	-- Define Telescope's colors
	vim.api.nvim_set_hl(0, "TelescopeNormal",         { bg = gray, fg = white })
	vim.api.nvim_set_hl(0, "TelescopeBorder",         { bg = gray, fg = accent })

	vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { bg = gray })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { bg = gray, fg = accent })
	vim.api.nvim_set_hl(0, "TelescopePromptPrefix",   { bg = gray, fg = accent })
	vim.api.nvim_set_hl(0, "TelescopePromptTitle",    { bg = accent, fg = gray })

	vim.api.nvim_set_hl(0, "TelescopeResultsTitle",   { bg = gray, fg = white })

	vim.api.nvim_set_hl(0, "TelescopePreviewTitle",   { bg = gray, fg = white })
	vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { bg = gray, fg = accent })
	vim.api.nvim_set_hl(0, "TelescopePreviewLine",    { bg = accent, fg = white, bold = true})

	vim.api.nvim_set_hl(0, "TelescopeSelection",      { bg = blue, fg = white, bold = true })

	vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = cyan, bold = true })
end

Colors()
