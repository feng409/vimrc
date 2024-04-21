local dap, dapui = require("dap"), require("dapui")

dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "launch file",
        program = "${file}",
        pythonPath = function()
            return "python"
        end,
    },
}
require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" } })

------------------------- dap ui -------------------------
local dap_breakpoint_color = {
    breakpoint = {
        ctermbg = 0,
        fg = "#993939",
        bg = "#31353f",
    },
    logpoing = {
        ctermbg = 0,
        fg = "#61afef",
        bg = "#31353f",
    },
    stopped = {
        ctermbg = 0,
        fg = "#98c379",
        bg = "#31353f",
    },
}

vim.api.nvim_set_hl(0, "DapBreakpoint", dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, "DapLogPoint", dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, "DapStopped", dap_breakpoint_color.stopped)

local dap_breakpoint = {
    error = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = "ﳁ",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = "",
        texthl = "DapLogPoint",
        linehl = "DapLogPoint",
        numhl = "DapLogPoint",
    },
    stopped = {
        text = "",
        texthl = "DapStopped",
        linehl = "DapStopped",
        numhl = "DapStopped",
    },
}
------------------------- dap ui -------------------------

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
vim.fn.sign_define("DapLogPoint", dap_breakpoint.logpoint)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
-- dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
-- dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.api.nvim_create_user_command("DapUIToggle", function()
    dapui.toggle()
end, { desc = "Toggle DapUI" })

---@diagnostic disable-next-line: missing-fields
dapui.setup({
    layouts = {
        {
            -- You can change the order of elements in the sidebar
            elements = {
                -- Provide IDs as strings or tables with "id" and "size" keys
                {
                    id = "scopes",
                    size = 0.25, -- Can be float or integer > 1
                },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left", -- Can be "left" or "right"
        },
        {
            elements = {
                "repl",
                -- "console",
            },
            size = 10,
            position = "bottom", -- Can be "bottom" or "top"
        },
    },
})

vim.keymap.set(
    { "i", "n", "v" },
    "<F3>",
    "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
    { silent = true, noremap = true }
)
vim.keymap.set({ "i", "n", "v" }, "<F7>", "<cmd>lua require'dap'.step_into()<CR>", { silent = true, noremap = true })
vim.keymap.set({ "i", "n", "v" }, "<F8>", "<cmd>lua require'dap'.step_over()<CR>", { silent = true, noremap = true })
vim.keymap.set({ "i", "n", "v" }, "<F9>", "<cmd>lua require'dap'.continue()<CR>", { silent = true, noremap = true })
