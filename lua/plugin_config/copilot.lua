local module = require("copilot")

module.setup({
    suggestion = {
        auto_trigger = true,
        hide_during_completion = false,

        keymap = {
            accept = "ff",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
})

local cmp = require("cmp")
cmp.event:on("menu_opened", function()
    vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
    vim.b.copilot_suggestion_hidden = false
end)
