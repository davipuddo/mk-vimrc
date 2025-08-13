function comment(ctype)
	vim.cmd("normal! 0i"..ctype.."\t");
end

function uncomment(ctype)

	n = ctype:len()+1;
	if (ctype == "#") then -- Fix [\t] being converted to 3 spaces after [#]
		n = n + 2;
	end

	vim.cmd("normal! 0"..n.."x");
end
function commentBlock(ctype)

	local s = vim.fn.line("'<");
	local e = vim.fn.line("'>");

	for line = s, e do
		vim.fn.setline(line, ctype.."\t"..vim.fn.getline(line));
	end
end

function uncommentBlock(ctype)

	local s = vim.fn.line("'<");
	local e = vim.fn.line("'>");

	print("oie");
	for line = s, e do
		n = ctype:len() + 2;
		vim.fn.setline(line, vim.fn.getline(line):sub(n));
	end
end

vim.keymap.set("x", "<leader>c", function() 
	vim.cmd("normal! gv"); 
	commentBlock("--"); 
end)

vim.keymap.set("x", "<leader>d", function() 
	vim.cmd("normal! gv"); 
	uncommentBlock("--"); 
end)

function setCompletion(COMPLETION)
	vim.cmd("inoremap <buffer> BLOB "..COMPLETION);
end

function toggleHex()
	if (HEX_EDITOR == false) then
		vim.cmd("%!xxd");
	else
		vim.cmd("%!xxd -r");
	end
	HEX_EDITOR = not HEX_EDITOR;
end
