return {
  { "folke/flash.nvim", enabled = false },

  { import = "lazyvim.plugins.extras.ai.copilot" },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      scroll = { enabled = false },
      bigfile = { enabled = true },
    },
  },
}
