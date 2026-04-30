vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP Show References" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename Variable" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "j", "gj", { desc = "Up", noremap = true })
vim.keymap.set("n", "k", "gk", { desc = "Down", noremap = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ga", function()
	vim.cmd("silent !git add " .. vim.fn.expand("%"))
end, { desc = "Git add current file (silent)" })

vim.keymap.set("n", "<leader>gc", function()
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

vim.keymap.set("n", "<leader>gp", function()
	run_git_and_show("git push")
end, { desc = "Git push current branch" })

vim.keymap.set("n", "<leader>gl", function()
	run_git_and_show("git pull")
end, { desc = "Git pull current branch" })
