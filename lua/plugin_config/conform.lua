local conform = require("conform")
local config = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "ruff_format" },
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
        c = { "clang-format" },
    },
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
}

vim.api.nvim_create_user_command("Format", function()
    conform.format({ async = false })
end, { desc = "conform format" })

vim.keymap.set("n", "<leader>fc", function()
    conform.format({ async = true })
end)
conform.setup(config)
