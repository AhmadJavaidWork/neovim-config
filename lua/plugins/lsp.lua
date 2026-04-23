return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true }, -- Ensure mason setups first
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
  require("mason").setup()
  local lspconfig = require("lspconfig")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "tsserver", "zls", "vue_ls" },
    -- Configuration handlers are now placed directly inside setup()
    handlers = {
      -- Default handler
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      -- Vue-specific handler (Non-Hybrid Mode for Vue 2 & 3)
      ["vue_ls"] = function()
        lspconfig.vue_ls.setup({
          capabilities = capabilities,
          init_options = {
            vue = { hybridMode = false },
	     typescript = {
    tsdk = vim.fn.stdpath("data")
      .. "/mason/packages/typescript-language-server/node_modules/typescript/lib",
  },
          },
        })
      end,

      -- TS-specific handler
      ["tsserver"] = function()
        lspconfig.tsserver.setup({
          capabilities = capabilities,
          -- Standard TS filetypes; vue handled by vue_ls
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        })
      end,
    },
  })

  -- Keymaps
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP Show References" })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP Rename Variable" })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
end

}

