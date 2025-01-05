return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  dependencies = {
    {
      "junegunn/fzf",
      build = function()
        vim.fn["fzf#install"]()
      end,
    },
  },
  config = function()
    require("bqf").setup({
      auto_enable = true,
      auto_resize_height = true,
      func_map = { fzffilter = "a", openc = "<CR>", drop = "o" },
    })
  end,
}
