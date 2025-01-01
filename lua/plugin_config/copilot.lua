local module = require("copilot")

module.setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,

        keymap = {
            accept = "<C-F>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
})
