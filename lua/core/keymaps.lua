-- Keymap to toggle the file explorer like VS Code (Ctrl+B)

-- Normal mode mappings
 vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
 vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
 vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP Show References" })
 vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP Rename Variable" })
 vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })

 -- Save file with Ctrl+S (requires 'n' and 'i' mappings)
 vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<cr>', { desc = "Save file" })

 -- Clear search highlights with <Esc>
 vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

 -- Better window navigation (Ctrl + h,j,k,l)
 vim.keymap.set('n', '<C-h>', '<C-w>h')
 vim.keymap.set('n', '<C-j>', '<C-w>j')
 vim.keymap.set('n', '<C-k>', '<C-w>k')
 vim.keymap.set('n', '<C-l>', '<C-w>l')

 -- Stay in indent mode when tabbing in Visual mode
 vim.keymap.set('v', '<', '<gv')
 vim.keymap.set('v', '>', '>gv')

 vim.keymap.set('n', 'j', 'gj', { desc = 'Up', noremap = true })
 vim.keymap.set('n', 'k', 'gk', { desc = 'Down', noremap = true })
