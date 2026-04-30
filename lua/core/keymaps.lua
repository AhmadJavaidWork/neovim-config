local set_keymap = vim.keymap.set

set_keymap("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
set_keymap("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
set_keymap("n", "gr", vim.lsp.buf.references, { desc = "LSP Show References" })
set_keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename Variable" })
set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
set_keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Stop highlighting current search" })

set_keymap("v", "<", "<gv", { desc = "Indent to left" })
set_keymap("v", ">", ">gv", { desc = "Indent to right" })

set_keymap("n", "j", "gj", { desc = "Moves to the next visual line", noremap = true })
set_keymap("n", "k", "gk", { desc = "Moves to the previous visual line", noremap = true })

set_keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text to one line down adjusting indents" })
set_keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text to one line up adjusting indents" })

set_keymap("n", "J", "mzJ`z", { desc = "Move and append next line to current line" })
set_keymap("n", "<C-d>", "<C-d>zz", { desc = "Move half page down" })
set_keymap("n", "<C-u>", "<C-u>zz", { desc = "Move half page up" })
set_keymap(
	"n",
	"n",
	"nzzzv",
	{ desc = "When jump between search matches, the cursor stays centered and folded code opens automatically" }
)
set_keymap(
	"n",
	"N",
	"Nzzzv",
	{ desc = "When jump between search matches, the cursor stays centered and folded code opens automatically" }
)
set_keymap("n", "=ap", "ma=ap'a", { desc = "Reindents the paragraph but keeps cursor exactly where it was" })

set_keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
set_keymap("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

set_keymap({ "n", "v" }, "<leader>d", '"_d', { desc = "Deletes text without overwriting last yank" })

set_keymap(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor globally" }
)
set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

set_keymap("n", "<leader>ga", function()
	vim.cmd("silent !git add " .. vim.fn.expand("%"))
end, { desc = "Git add current file (silent)" })

set_keymap("n", "<leader>gc", function()
	vim.ui.input({ prompt = "Commit Message: " }, function(input)
		if input then
			vim.cmd('!git commit -m "' .. input .. '"')
		end
	end)
end, { desc = "Git Commit" })

local function run_git_and_show(cmd)
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
	local full_cmd = cmd .. " origin " .. branch

	print("Executing: " .. full_cmd)

	local output = vim.fn.system(full_cmd)

	vim.schedule(function()
		print(output)
	end)
end

set_keymap("n", "<leader>gp", function()
	run_git_and_show("git push")
end, { desc = "Git push current branch" })

set_keymap("n", "<leader>gl", function()
	run_git_and_show("git pull")
end, { desc = "Git pull current branch" })
