return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "pyright", "ts_ls", "zls" },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP Show References" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP Rename Variable" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
  end
}
