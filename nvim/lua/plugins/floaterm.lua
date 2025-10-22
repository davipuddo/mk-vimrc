local state = {
	float = {
		buf = -1,
		win = -1,
	}
}

local function float_window(opt)
	opt = opt or {}
	local width = math.floor(vim.o.columns * 0.7);
	local height = math.floor(vim.o.lines * 0.7);

	local col = math.floor((vim.o.columns - width) / 2);
	local row = math.floor((vim.o.lines - height) / 2);

	local buf = nil;
	if vim.api.nvim_buf_is_valid(opt.buf) then
		buf = opt.buf
	else
		buf = vim.api.nvim_create_buf(false, true);
	end

	local config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", border = "rounded",
		footer = "._.",
		footer_pos = "center",
	}

	local win = vim.api.nvim_open_win(buf, true, config);

	return { buf = buf, win = win }
end

local toggle = function()
	if not vim.api.nvim_win_is_valid(state.float.win) then
		state.float = float_window { buf = state.float.buf };
		if vim.bo[state.float.buf].buftype ~= "terminal" then
			vim.cmd.term()
		end
	else
		vim.api.nvim_win_hide(state.float.win);
	end
end

vim.keymap.set("t", "<esc>", toggle);
vim.keymap.set({"n", "t"}, "<leader>tt", function()
	toggle()
	vim.cmd("normal! i");
end);

