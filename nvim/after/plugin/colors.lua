local function mycolors (opts)

	-- Define default colorscheme and colors
	color = "oxocarbon";
	transparent = true;
	local baseColor = "#161616"
	local commentColor = "#525252"

	if (opts and opts.args ~= "") then 
		local args = vim.split(opts.args, "%s+")
		color = args[1];
		transparent = (args[2] == "true") or false;
	end

	vim.cmd.colorscheme(color);

	-- Define colors
	if (transparent == true) then
		baseColor = "none"
		commentColor = "#3ddbd9"
	end

	local accent = "#ff237f"
	local white = "#ffffff"
	local blue = "#78a9ff" 
	local cyan = "#3ddbd9"

	-- Define Telescope's colors
	vim.api.nvim_set_hl(0, "TelescopeNormal",         { bg = baseColor, fg = white })
	vim.api.nvim_set_hl(0, "TelescopeBorder",         { bg = baseColor, fg = accent })

	vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { bg = baseColor })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { bg = baseColor, fg = accent })
	vim.api.nvim_set_hl(0, "TelescopePromptPrefix",   { bg = baseColor, fg = accent })
	vim.api.nvim_set_hl(0, "TelescopePromptTitle",    { bg = accent, fg = baseColor })

	vim.api.nvim_set_hl(0, "TelescopeResultsTitle",   { bg = baseColor, fg = white })

	vim.api.nvim_set_hl(0, "TelescopePreviewTitle",   { bg = baseColor, fg = white })
	vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { bg = baseColor, fg = accent })
	vim.api.nvim_set_hl(0, "TelescopePreviewLine",    { bg = accent, fg = white, bold = true})

	vim.api.nvim_set_hl(0, "TelescopeSelection",      { bg = blue, fg = white, bold = true })

	vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = cyan, bold = true })

	-- Set other colors
	vim.api.nvim_set_hl(0, "Normal", { bg = baseColor })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = baseColor })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = baseColor })
	vim.api.nvim_set_hl(0, "LineNr", { bg = baseColor })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = baseColor })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = accent })
	vim.api.nvim_set_hl(0, "Comment", { fg = commentColor })

end

mycolors()
vim.api.nvim_create_user_command('Colors', mycolors, { nargs="*"});
vim.api.nvim_create_user_command('ToggleTransparency', function()
	mycolors({args="oxocarbon "..tostring((not transparent))});
end, { nargs="*"});
