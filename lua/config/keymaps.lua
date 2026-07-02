-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "zq", ":quitall!<cr>", { silent = true, desc = "quitall" })
vim.keymap.set("n", "cq", ":cquit!<cr>", { silent = true, desc = "quit vim with error code" })
vim.keymap.set("n", "<leader>r", ":FzfLua resume<cr>", { silent = true, desc = "FzfLua resume" })
-- vim.keymap.set("n", "<SPACE>qq", ":bd<cr>", { silent = true, desc = "quit the current buffer" })
-- vim.keymap.set("n", "<SPACE>qc", ":bd<cr>", { silent = true, desc = "close the current window" })

-- vim.keymap.set("n", "zh", ":bp<cr>", { silent = false })
-- vim.keymap.set("n", "zl", ":bn<cr>", { silent = false })

vim.keymap.set("n", "za", function()
  vim.cmd.wa()
  vim.cmd.qa()
end, { remap = true })

-- Terminal mode: <C-h/j/k/l> -> 退出终端 insert 再切窗口
for _, k in ipairs({ "h", "j", "k", "l" }) do
  vim.keymap.set("t", "<C-" .. k .. ">", "<C-\\><C-n><C-w>" .. k, { silent = true, desc = "Go to " .. k .. " window" })
end
