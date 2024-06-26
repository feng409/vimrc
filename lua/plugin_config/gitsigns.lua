local gitsigns = require("gitsigns")

local options = {
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function opts(desc)
            return { buffer = bufnr, desc = desc }
        end

        local map = vim.keymap.set

        map("n", "<leader>hr", gs.reset_hunk, opts("Reset Hunk"))
        map("n", "<leader>hp", gs.preview_hunk, opts("Preview Hunk"))
        map("n", "<leader>gb", gs.blame_line, opts("Blame Line"))

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk)
        map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, opts("stage hunk"))
        map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, opts("reset current_line hunk"))
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "stage buffer" })
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "reset buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview hunk" })
        map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
        end, { desc = "blame line" })
        -- map("n", "<leader>tb", gitsigns.toggle_current_line_blame, {desc = "toggle_current_line_blame"})
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "diffthis" })
        map("n", "<leader>hD", function()
            gitsigns.diffthis("~")
        end, { desc = "diffthis ~" })
        map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "toggle_deleted" })
    end,
}

gitsigns.setup(options)
