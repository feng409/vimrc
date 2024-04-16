local gitsigns = require('gitsigns')

vim.keymap.set('n', '<space>hd', gitsigns.diffthis)
gitsigns.setup {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 50,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
}
