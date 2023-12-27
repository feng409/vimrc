require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = 'float',
    -- direction = 'horizontal',
    size = 10,
})

local commands = {
    ["go"] = "go run %",
    ["python"] = "python %",
    ["sh"] = "bash %",
    ["c"] = "gcc -o %:r % && ./%:r",
    ["cpp"] = "g++ -o %:r % && ./%:r",
    ["php"] = "php %",
}

function _G.run_code()
    local cmd = commands[vim.bo.filetype]
    if cmd ~= nil then
        vim.cmd('w')
        local termexec = 'TermExec cmd="' .. cmd .. '"'
        vim.api.nvim_command(termexec)
    else
        vim.notify('unknown filetype ' .. vim.bo.filetype)
    end
end

vim.keymap.set("n", "<F5>", '<CMD>lua _G.run_code()<CR>', { silent = true })
