local mason_registry = require("mason-registry")

local vue_ls_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'

return {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_ls_path,
                languages = { "vue" },
            },
        },
    },
    filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
    },
}
