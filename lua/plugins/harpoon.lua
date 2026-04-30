return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		vim.keymap.set("n", "<leader>hc", function()
			harpoon:list():clear()
			print("Harpoon cleared")
		end, { desc = "Clear Harpoon" })

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add to harpoon" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Show harpoon list" })

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, { desc = "Go to buffer 1 in harpoon list" })

		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end, { desc = "Go to buffer 2 in harpoon list" })

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end, { desc = "Go to buffer 3 in harpoon list" })

		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end, { desc = "Go to buffer 4 in harpoon list" })

		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Go to previous buffer in harpoon list" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Go to next buffer in harpoon list" })

		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<Esc>", function()
					harpoon.ui:close_menu()
				end, { buffer = cx.bufnr, desc = "Close harpoon" })

				vim.keymap.set("n", "<CR>", function()
					local index = vim.fn.line(".")
					harpoon.ui:toggle_quick_menu(harpoon:list())
					harpoon:list():select(index)
				end, { buffer = cx.bufnr, desc = "Select current buffer in harpoon list" })
			end,
		})
	end,
}
