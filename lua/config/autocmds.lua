-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Only show ERROR-level diagnostics
vim.diagnostic.config({
  virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
  signs = { severity = { min = vim.diagnostic.severity.ERROR } },
  underline = { severity = { min = vim.diagnostic.severity.ERROR } },
})

-- Auto-run yunshu go mod tidy when opening a Go project with go.mod and go.sum
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.go",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local bufpath = vim.api.nvim_buf_get_name(buf)
    if bufpath == "" then
      return
    end
    local cwd = vim.fn.fnamemodify(bufpath, ":p:h")
    local gomod = vim.fn.findfile("go.mod", cwd .. ";") --[[@as string]]
    local gosum = vim.fn.findfile("go.sum", cwd .. ";") --[[@as string]]
    if gomod ~= "" and gosum ~= "" then
      local root = vim.fn.fnamemodify(gomod, ":p:h")
      if not vim.g["_gomod_tidy_ran_" .. root] then
        vim.g["_gomod_tidy_ran_" .. root] = true
        vim.fn.jobstart("go mod tidy", {
          cwd = root,
          on_exit = function(_, code)
            if code ~= 0 then
              vim.notify("go mod tidy failed (exit " .. code .. ")", vim.log.levels.WARN, { title = "Go Mod Tidy" })
            end
          end,
        })
      end
    end
  end,
  group = vim.api.nvim_create_augroup("GoModTidy", { clear = true }),
})
