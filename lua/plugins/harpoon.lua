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
			local harpoon = require("harpoon")
			harpoon:list():clear()
			print("Harpoon cleared")
		end, { desc = "Clear Harpoon list" })

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)

		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<Esc>", function()
					harpoon.ui:close_menu()
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<CR>", function()
					local index = vim.fn.line(".")
					harpoon.ui:toggle_quick_menu(harpoon:list())
					harpoon:list():select(index)
				end, { buffer = cx.bufnr })
				vim.keymap.set("n", "<C-v>", function()
					select_item("vsplit")
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					select_item("split")
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					select_item("tabedit")
				end, { buffer = cx.bufnr })
			end,
		})
	end,
}
