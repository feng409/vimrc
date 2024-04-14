local telescope_keymap = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope_keymap.find_files, {})
vim.keymap.set('n', '<space>r', telescope_keymap.oldfiles, {})
vim.keymap.set('n', '<leader>ff', telescope_keymap.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_keymap.buffers, {})
vim.keymap.set('n', '<C-e>', telescope_keymap.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_keymap.help_tags, {})

vim.keymap.set('n', '<space>o', telescope_keymap.lsp_document_symbols, {})
vim.keymap.set('n', '<space>n', telescope_keymap.builtin, {})
-- vim.keymap.set('n', 'hr', telescope_keymap.lsp_references, {})


local telescope = require("telescope")
telescope.setup({
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "fd", "-t", "f", "-H"},
        },
    },
})
