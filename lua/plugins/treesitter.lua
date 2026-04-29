return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter")
		treesitter.install({
			"go",
			"typescript",
			"json",
			"javascript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"vimdoc",
			"c",
			"zig",
		})
	end,
}
