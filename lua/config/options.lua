-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 设置背景透明
-- vim.cmd([[
-- autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
-- ]])

vim.opt.clipboard = "unnamedplus" -- 原生 OSC52 支持 (Neovim 0.10+)
vim.lsp.inlay_hint.enable(false) -- Neovim 0.11 原生 API
vim.opt.scrolloff = 0 -- LazyVim 默认4，改为0可滚动到边缘
vim.opt.sidescrolloff = 0 -- 同上，水平方向
vim.opt.relativenumber = false
vim.g.lazyvim_python_lsp = "pyright"
vim.opt.timeoutlen = 30 -- 默认是1000ms
vim.opt.ttimeoutlen = 5 -- 默认是50ms
vim.opt.swapfile = false
