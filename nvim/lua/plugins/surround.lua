function _G.surround(opts)
	local wall = opts.args;

	local wall_start = wall;
	local wall_end = wall;

	local sep = wall:find(";");
	if (#wall >= 2 and sep and sep >= 1) then
		wall_start = wall:sub(1,sep-1);
		wall_end = wall:sub(sep+1,#wall);
	end

	if (wall_start == "(") then
		wall_end = ")"
	elseif (wall_start == "{") then
		wall_end = "}"
	elseif (wall_start == "[") then
		wall_end = "]"
	end

	local start_line = vim.fn.line("'<");
	local end_line = vim.fn.line("'>");
	local start_col = vim.fn.col("'<");
	local end_col = vim.fn.col("'>");

	if (start_line == end_line) then -- Single line

		local line = vim.fn.getline(start_line);
		local before = line:sub(1, start_col-1);
		local middle = line:sub(start_col, end_col);
		local after = line:sub(end_col+1);

		vim.fn.setline(start_line, before..wall_start..middle..wall_end..after);

	else -- Multiple line

		local first_line = vim.fn.getline(start_line);
		local last_line = vim.fn.getline(end_line);

		local buffer = first_line:sub(1, start_col-1)..wall_start..first_line:sub(start_col);
		vim.fn.setline(start_line, buffer);

		buffer = last_line:sub(1, end_col)..wall_end..last_line:sub(end_col+1);
		vim.fn.setline(end_line, buffer);

	end
end

vim.api.nvim_create_user_command('Surround', surround, { nargs="*"});

vim.keymap.set("n", "<leader>S", function()
	surround({args = vim.fn.input("Surround > ")});
end)
