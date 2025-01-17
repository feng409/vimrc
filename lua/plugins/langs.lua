return {
  --python
  { import = "lazyvim.plugins.extras.lang.python" },
  {
    "williamboman/mason.nvim",
    -- enabled = false,
    opts = { ensure_installed = { "pyright" } },
  },
}
