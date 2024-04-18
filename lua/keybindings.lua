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

-- vim.keymap.set("n", "za", ":xa<cr>", {silent = true})
vim.keymap.set("n", "zq", ":quitall!<cr>", { silent = true })
vim.keymap.set("n", "cq", ":cquit!<cr>", { silent = true })
vim.keymap.set("n", "<SPACE>q", ":bd<cr>", { silent = true })
-- vim.keymap.set("n", "<F2>", ":set paste<cr>", { silent = true }) // conflict with lspconfig
vim.keymap.set("x", "p", "pgvy", { silent = true })
vim.keymap.set("n", "<C-H>", ":bp<cr>", { silent = false })
vim.keymap.set("n", "<C-L>", ":bn<cr>", { silent = false })
-- vim.keymap.set("n", "<C-M>", ":only<cr>", { silent = true })
vim.keymap.set('n', 'za', function()
    -- wirte all buffers first
    vim.api.nvim_command(":wa")
    -- quit all buffers
    vim.api.nvim_command(":qa")
end, { remap = true })

local function toggle_quickfix()
    local windows = vim.fn.getwininfo()
    for _, win in pairs(windows) do
        if win["quickfix"] == 1 then
            vim.cmd.cclose()
            return
        end
    end
    vim.cmd.copen()
end
vim.keymap.set('n', '<space>k', toggle_quickfix, { silent = true, desc = "Toggle Quickfix Window" })


