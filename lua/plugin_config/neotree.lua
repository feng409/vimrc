local neotree = require("neo-tree")
local config = {
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
    },
    window = {
        mappings = {
            ["o"] = { "open", nowait = true, config = { expand_nested_files = true } }, -- expand nested file takes precedence
        },
    },
    filesystem = {
        window = {
            mappings = {
                -- I don't care order
                ["o"] = { "open", nowait = true, config = { expand_nested_files = true } }, -- expand nested file takes precedence
                ["oc"] = "noop",
                ["od"] = "noop",
                ["og"] = "noop",
                ["om"] = "noop",
                ["on"] = "noop",
                ["os"] = "noop",
                ["ot"] = "noop",
            },
        },
    },
    vim.api.nvim_create_user_command("Reveal", "Neotree reveal", {}),
}
neotree.setup(config)
