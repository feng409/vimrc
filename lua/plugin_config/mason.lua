require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
        "jsonls",
        -- "tsserver", -- for typescript
        -- "volar", -- for vue
    },
})
