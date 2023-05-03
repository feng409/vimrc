--[[=============================================================================
#     FileName: keybindings.lua
#         Desc: 通用按键映射，不包含插件
#       Author: chemf
#        Email: eoyohe@gmail.com
#     HomePage: eoyohe.cn
#      Version: 0.0.1
#   LastChange: 2023-05-03 01:02:30
#      History:
=============================================================================]]

-- slient: 清除 ex 上显示的输入命令记录

vim.keymap.set("n", "za", ":xa<cr>", {silent = true})
vim.keymap.set("n", "zq", ":quitall!<cr>", {silent = true})
vim.keymap.set("n", "<F2>", ":set paste<cr>", {silent = true})
vim.keymap.set("x", "p", "pgvy", {silent = true})
vim.keymap.set("n", "<C-H>", ":w<cr> :bp<cr>", {silent = true})
vim.keymap.set("n", "<C-L>", ":w<cr> :bn<cr>", {silent = true})
vim.keymap.set("n", "<C-M>",  ":only<cr>", {silent = true})
