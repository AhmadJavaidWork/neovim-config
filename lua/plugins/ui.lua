return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- The VS Code Dark+ theme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('vscode').setup({
	transparent_background = true, -- Set to true if you want your terminal's background
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        color_overrides = {
         -- You can fine-tune specific colors here if they feel "off"
        }
      })
      vim.cmd.colorscheme("vscode")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup({ theme = 'vscode' })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
       vim.keymap.set('n', '<C-b>', '<cmd>NvimTreeToggle<cr>')
    end,
  },
}

