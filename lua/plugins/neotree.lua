return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<C-Y>",
      "<cmd>Neotree toggle right document_symbols<cr>",
      desc = "document_symbols on right",
      remap = true,
    },
  },
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    window = {
      mappings = {
        ["o"] = { "open", nowait = true, config = { expand_nested_files = true } }, -- expand nested file takes precedence
        -- Copy paths to system clipboard (+ register → nvim built-in OSC52 → tmux → iTerm2/Mac)
        ["Y"] = function(state)
          local node = state.tree:get_node()
          local path = node and node:get_id() or ""
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path)
        end,
        ["<C-y>"] = function(state)
          -- relative to cwd
          local node = state.tree:get_node()
          local path = node and node:get_id() or ""
          path = vim.fn.fnamemodify(path, ":.")
          vim.fn.setreg("+", path)
          vim.notify("Copied (rel): " .. path)
        end,
      },
    },
  },
}
