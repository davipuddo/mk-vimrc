require('pdd.functions')

-- Define leader
vim.g.mapleader = " ";

-- Open current directory
vim.keymap.set("n", "<leader>D", vim.cmd.Ex);

-- Exit insertion mode
vim.keymap.set("i", "jk", "<Esc>"); 
vim.keymap.set("x", "<leader>jk", "<Esc>"); 

-- Save buffer
vim.keymap.set("n", "<C-q>", ":w<CR>");

-- Copy selected
vim.keymap.set("v", "<C-c>", "\"+y");

-- Toggle highlights
vim.keymap.set("n", "<M-h>", ":set hls!<CR>");

-- Increment/Decrement rebind
vim.keymap.set("n", "<M-a>", "<C-a>");
vim.keymap.set("n", "<M-x>", "<C-x>");

-- Exit buffer
vim.keymap.set("n", "<C-x>", ":q!<CR>");

-- Select all
vim.keymap.set("n", "<C-a>", "gg0v<S-g>$");

-- Move UP/Down
vim.keymap.set("n", "<M-Up>", "kddpk");
vim.keymap.set("n", "<M-Down>", "ddp");
vim.keymap.set("i", "<M-Up>", "kddpk");
vim.keymap.set("i", "<M-Down>", "ddp");

-- Define comment keybinds

	--  Normal mode
vim.keymap.set("n", "<M-c>", function() comment(COMMENT_TYPE) end) 
vim.keymap.set("n", "<M-d>", function() uncomment(COMMENT_TYPE) end) 

	--  Insertion mode
vim.keymap.set("i", "<M-c>", function() comment(COMMENT_TYPE) end) 
vim.keymap.set("i", "<M-d>", function() uncomment(COMMENT_TYPE) end) 

	--  Visual mode
vim.keymap.set("x", "<M-c>", function()
	vim.cmd("normal! gv")
	commentBlock(COMMENT_TYPE)
end)

vim.keymap.set("x", "<M-d>", function()
	vim.cmd("normal! gv")
	uncommentBlock(COMMENT_TYPE)
end)

--	Replace
vim.keymap.set("n", "<leader>r", "vey:s/<C-r>0/");

--	Replace All
vim.keymap.set("n", "<leader>R", "vey:%s/<C-r>0/");

-- Toggle Hex editor
vim.keymap.set("n", "<leader>X", function() toggleHex() end);
