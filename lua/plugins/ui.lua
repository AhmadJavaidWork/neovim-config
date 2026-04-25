return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vscode").setup({
				italic_comments = true,
				underline_links = true,
				terminal_colors = true,
				color_overrides = {
					vscLineNumber = "#858585",
					vscBack = "#1e1e1e",
				},
				group_overrides = {
					Cursor = { fg = "#000000", bg = "#78797b", bold = true },

					GitSignsDelete = { fg = "#F14C4C" },
					GitSignsChange = { fg = "#1b81a8" },
					GitSignsAdd = { fg = "#487e02" },

					NormalFloat = { bg = "#252526" },
					FloatBorder = { fg = "#858585" },

					LspSignatureActiveParameter = { fg = "#252526", bold = true, underline = true },

					CursorColumn = { bg = "#2d2d2d" },
					CursorLine = { bg = "#2d2d2d" },

					PmenuSel = { bg = "#04395E", fg = "NONE" },
					Pmenu = { bg = "#1e1e1e", fg = "#cccccc" },
				},
			})
			vim.cmd.colorscheme("vscode")

			local hl = vim.api.nvim_set_hl
			hl(0, "DiffAdd", { bg = "#4B5A2A" })
			hl(0, "DiffDelete", { bg = "#6F1312" })
			hl(0, "DiffChange", { bg = "#1e2a3a" })
			hl(0, "DiffText", { bg = "#3a5f87" })
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				theme = "vscode",
				icons_enabled = true,
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>")
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
