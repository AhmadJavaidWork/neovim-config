return {
	{
		---@module "neominimap.config.meta"
		"Isrothy/neominimap.nvim",
		version = "v3.x.x",
		lazy = false,
		keys = {
			{ "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
			{ "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
			{ "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
			{ "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

			{ "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
			{ "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
			{ "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
			{ "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

			{ "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
			{ "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
			{ "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
			{ "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

			{ "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
			{ "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
			{ "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
			{ "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

			{ "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
			{ "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
			{ "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
		},
		init = function()
			vim.opt.splitright = true
			vim.opt.wrap = true
			vim.opt.sidescrolloff = 5

			vim.g.neominimap = {
				auto_enable = true,
				layout = "split",
				exclude_filetypes = {
					"help",
					"terminal",
					"neominimap",
					"qf",
					"NvimTree",
				},
				split = {
					side = "right",
					width = 20,
					fix_width = true,
				},
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "VimResized" }, {
				callback = function()
					if vim.bo.filetype ~= "neominimap" then
						vim.opt_local.wrap = true
						vim.opt_local.linebreak = true
						vim.opt_local.colorcolumn = "100"
					end
				end,
			})
			vim.api.nvim_create_autocmd("QuitPre", {
				callback = function()
					local invalid_win = {}
					local wins = vim.api.nvim_list_wins()
					for _, win in ipairs(wins) do
						local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
						if bufname:match("neominimap") then
							table.insert(invalid_win, win)
						end
					end
					if #wins - #invalid_win <= 1 then
						for _, win in ipairs(invalid_win) do
							vim.api.nvim_win_close(win, true)
						end
					end
				end,
			})
		end,
	},
}
