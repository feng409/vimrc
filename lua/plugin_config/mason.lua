require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "debugpy",
        "gopls",
        "jsonls",
        -- "tsserver", -- for typescript
        -- "volar", -- for vue
    },
})
