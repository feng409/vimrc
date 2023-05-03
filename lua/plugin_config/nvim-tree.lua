require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
        icons = {},             -- 如有需要，在这里关闭图标
    },
    filters = {
        dotfiles = true,
    },
    git = {
        ignore = false,
    }
})
vim.keymap.set('', '<c-t>', ':NvimTreeToggle<cr>', { remap = true, silent = true })
