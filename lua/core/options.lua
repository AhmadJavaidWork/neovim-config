local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.scrolloff = 15
opt.sidescrolloff = 30

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.colorcolumn = "100"

opt.termguicolors = true

opt.mouse = "a"

opt.cursorline = true
opt.cursorcolumn = true

vim.api.nvim_set_hl(0, "Cursor", {
	fg = "#1e1e1e",
	bg = "#c0c0c0",
})
