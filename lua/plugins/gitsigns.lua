return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)

				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end)

				map("n", "<leader>hs", gs.stage_hunk)
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hr", gs.reset_hunk)

				map("n", "<leader>hi", gs.preview_hunk_inline)
				map("n", "<leader>hp", gs.preview_hunk)

				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>tw", gs.toggle_word_diff)

				map("n", "<leader>tb", gs.toggle_current_line_blame)
				map("n", "<leader>hb", function()
					gs.blame_line({ full = false })
				end)
			end,
		},
	},
}
