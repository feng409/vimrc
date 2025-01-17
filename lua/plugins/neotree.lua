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
  },
  window = {
    mappings = {
      ["o"] = { "open", nowait = true, config = { expand_nested_files = true } }, -- expand nested file takes precedence
    },
  },
}
