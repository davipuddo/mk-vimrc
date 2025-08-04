function Colors(color)
	color = color or "oxocarbon"
	vim.cmd.colorscheme(color);

	vim.api.nvim_set_hl(0, "TelescopeNormal",         { bg = "#262626", fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "TelescopeBorder",         { bg = "#262626", fg = "#ff7eb6" })

	vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { bg = "#262626" })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { bg = "#262626", fg = "#ff7eb6" })
	vim.api.nvim_set_hl(0, "TelescopePromptPrefix",   { bg = "#262626", fg = "#ff7eb6" })
	vim.api.nvim_set_hl(0, "TelescopePromptTitle",    { bg = "#ff7eb6", fg = "#262626" })

	vim.api.nvim_set_hl(0, "TelescopeResultsTitle",   { bg = "#262626", fg = "#ffffff" })

	vim.api.nvim_set_hl(0, "TelescopePreviewTitle",   { bg = "#262626", fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { bg = "#262626", fg = "#ff7eb6" })
	vim.api.nvim_set_hl(0, "TelescopePreviewLine",    { bg = "#ff7eb6", fg = "#ffffff", bold = true})

	vim.api.nvim_set_hl(0, "TelescopeSelection",      { bg = "#78a9ff", fg = "#ffffff", bold = true })

	vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = "#3ddbd9", bold = true })
end

Colors()
