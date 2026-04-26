return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"^node_modules/",
					"^.git/",
					"^compare_codebases/",
					"target/",
					"dist/",
				},
				get_status_text = function(self)
					return ""
				end,
			},
		})

		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fa", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
		vim.keymap.set("n", "<leader>pa", function()
			builtin.find_files({ no_ignore = true, hidden = true })
		end, { desc = "All files" })
	end,
}
