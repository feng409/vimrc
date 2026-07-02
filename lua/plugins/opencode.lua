local opencode_cmd = "opencode --port"
local snacks_terminal_opts = { win = { position = "right", width = 0.4 } }

return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  keys = {
    {
      "<leader>oo",
      function()
        Snacks.terminal.toggle(opencode_cmd, snacks_terminal_opts)
      end,
      mode = { "n", "x" },
      desc = "OpenCode TUI (right split toggle)",
    },
    {
      "<leader>oa",
      function()
        require("opencode").ask("@this: ")
      end,
      mode = { "n", "x" },
      desc = "Ask OpenCode…",
    },
    {
      "<leader>os",
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Select OpenCode…",
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
        end,
      },
    }
    vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`
  end,
}
