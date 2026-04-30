local keymap = vim.keymap

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = {
		source = false,
		prefix = "●",
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { desc = "LSP Hover Documentation" })

		keymap.set({ "i", "n" }, "<C-k>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		keymap.set("n", "gr", vim.lsp.buf.references, opts)
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		keymap.set("n", "<leader>td", function()
			vim.diagnostic.enable(not vim.diagnostic.is_enabled())
		end)
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
		if lang then
			pcall(vim.treesitter.start)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lspinfo,markdown,help",
	callback = function()
		vim.keymap.set("n", "gd", function()
			vim.api.nvim_command("wincmd p")
			vim.lsp.buf.definition()
		end, { buffer = true, silent = true })

		vim.keymap.set("n", "q", ":close<CR>", { buffer = true, silent = true })
	end,
})

vim.keymap.set("n", "<C-space>", "v", { remap = true, desc = "Init selection" })
vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Increment selection" })
vim.keymap.set("x", "<bs>", "in", { remap = true, desc = "Decrement selection" })
vim.treesitter.language.register("bash", "zsh")
