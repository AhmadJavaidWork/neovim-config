return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local win_config = {
				border = "single",
				max_width = 80,
				max_height = 20,
				focusable = true,
				style = "rounded",
			}

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "zls", "vue_ls", "gopls" },
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["gopls"] = function()
						lspconfig.gopls.setup({
							capabilities = capabilities,
							settings = {
								gopls = {
									completeUnimported = true,
									usePlaceholders = true,
									analyses = { unusedparams = true },
									staticcheck = true,
								},
							},
						})
					end,

					["vue_ls"] = function()
						lspconfig.vue_ls.setup({
							capabilities = capabilities,
							init_options = {
								vue = {
									hybridMode = true,
								},
							},
						})
					end,

					["ts_ls"] = function()
						local mason_registry = require("mason-registry")
						local vue_language_server_path = mason_registry
							.get_package("vue-language-server")
							:get_install_path() .. "/node_modules/@vue/language-server"

						lspconfig.ts_ls.setup({
							capabilities = capabilities,
							init_options = {
								plugins = {
									{
										name = "@vue/typescript-plugin",
										location = vue_language_server_path,
										languages = { "vue" },
									},
								},
							},
							filetypes = { "javascript", "typescript", "vue" },
						})
					end,
				},
			})
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover(win_config)
			end, { desc = "LSP Hover Documentation" })

			vim.keymap.set({ "i", "n" }, "<C-k>", function()
				vim.lsp.buf.signature_help(win_config)
			end, { desc = "LSP Signature Help" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP Show References" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename Variable" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"gofumpt",
					"lua-language-server",
					"stylua",
				},
			})
		end,
	},
}
