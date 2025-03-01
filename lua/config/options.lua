-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 设置背景透明
-- vim.cmd([[
-- autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
-- ]])

vim.opt.relativenumber = false
vim.g.lazyvim_python_lsp = "pyright"
vim.opt.timeoutlen = 30 -- 默认是1000ms
vim.opt.ttimeoutlen = 5 -- 默认是50ms
