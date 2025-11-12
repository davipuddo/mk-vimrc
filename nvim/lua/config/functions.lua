function Comment(ctype)
	vim.cmd("normal! 0i"..ctype.."\t");
end

function Uncomment(ctype)

	local n = ctype:len()+1;
	print(n);
	if (ctype == "#") then -- Fix [\t] being converted to 3 spaces after [#]
		n = n + 2;
	end

	vim.cmd("normal! 0"..n.."x");
end
function CommentBlock(ctype)

	local s = vim.fn.line("'<");
	local e = vim.fn.line("'>");

	for line = s, e do
		vim.fn.setline(line, ctype.."\t"..vim.fn.getline(line));
	end
end

function UncommentBlock(ctype)

	local s = vim.fn.line("'<");
	local e = vim.fn.line("'>");

	print("oie");
	for line = s, e do
		local n = ctype:len() + 2;
		vim.fn.setline(line, vim.fn.getline(line):sub(n));
	end
end

vim.keymap.set("x", "<leader>c", function()
	vim.cmd("normal! gv");
	CommentBlock("--");
end)

vim.keymap.set("x", "<leader>d", function()
	vim.cmd("normal! gv");
	UncommentBlock("--");
end)

function SetCompletion(COMPLETION)
	vim.cmd("inoremap <buffer> BLOB "..COMPLETION);
end

function ToggleHex()
	if (HEX_EDITOR == false) then
		vim.cmd("%!xxd");
	else
		vim.cmd("%!xxd -r");
	end
	HEX_EDITOR = not HEX_EDITOR;
end

