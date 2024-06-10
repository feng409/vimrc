local conform = require("conform")
local config = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "autopep8" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        go = { "goimports", "gofumpt" },
        sql = { "sql_formatter" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
    formatters = {
        sql_formatter = {
            args = { "-l", "mysql" }, -- default basic
        },
    },
}
vim.keymap.set("n", "<leader>fc", function()
    conform.format({ async = true })
end)
conform.setup(config)
