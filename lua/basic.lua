--[[=============================================================================
#     FileName: basic.lua
#         Desc: basic configuration
#       Author: chemf
#        Email: eoyohe@gmail.com
#     HomePage: eoyohe.cn
#      Version: 0.0.1
#   LastChange: 2023-05-03 01:08:07
#      History:
=============================================================================]]

-- 行号
vim.wo.number = true
-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true

vim.o.smartindent = true
vim.o.autoindent = true

-- 鼠标支持
vim.o.mouse = "a"
-- 去除兼容 vi 一致性
-- vim.o.nocompatible = true
-- 搜索不要高亮
vim.o.hlsearch = false
vim.opt.ignorecase = true

-- 设置黑色背景
vim.o.background = "dark"

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

vim.o.tabstop = 4
-- 使用 shift 每层缩进的空格数。
vim.o.shiftwidth = 4
-- 设置tab键为空格,制表符为noexpandtab
vim.o.expandtab = true
-- 折叠方式为根据语义
-- vim.o.foldmethod = 'syntax'
-- 打开文件是默认不折叠代码
-- vim.o.foldlevelstart = 99

-- vim.api.nvim_create_autocmd("VimEnter", {
--     command = "silent cd %:p:h",
--     desc = "进入vim自动切换对应目录"
-- })

-- 使用系统剪切板
vim.opt.clipboard = "unnamedplus"
-- 禁止使用.swp文件
vim.opt.swapfile = false

-- 设置背景透明
vim.cmd([[
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
]])

-- vim.opt.list = true
-- vim.opt.listchars = {
-- 	space = "⋅",
-- 	eol = "↴",
-- 	tab = "▎_",
-- 	-- tab = "|_>",
-- 	trail = "•",
-- 	extends = "❯",
-- 	precedes = "❮",
-- 	nbsp = "",
-- }

-- vim.diagnostic.config({ signs = false }) -- 禁止 diagnostic 信息展示在 linenum 上，不然 insert/normal 模式切换刷新晃眼睛
vim.o.signcolumn = "yes"
vim.g.mapleader = " "
