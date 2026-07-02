-- Jump to next/prev diff hunk; when the current file has no more hunks,
-- hop to the next/prev file in Diffview and land on its first/last hunk.
-- F7 = next (merges ]c + <Tab>), F8 = prev (merges [c + <S-Tab>)
local function diff_hunk_jump(dir)
  -- dir: 1 = next, -1 = prev
  local key = dir == 1 and "]c" or "[c"
  if not vim.wo.diff then
    -- outside a diff window: just try native (manual vimdiff), swallow errors
    pcall(vim.cmd, "normal! " .. key)
    return
  end
  local before = vim.api.nvim_win_get_cursor(0)
  pcall(vim.cmd, "normal! " .. key)
  local after = vim.api.nvim_win_get_cursor(0)
  if before[1] ~= after[1] or before[2] ~= after[2] then
    return -- moved to another hunk in this file
  end
  -- no more hunks here: switch file in Diffview
  local ok, actions = pcall(require, "diffview.actions")
  if not ok then
    return
  end
  if dir == 1 then
    actions.select_next_entry()
    -- land on first hunk of the new file
    vim.defer_fn(function()
      pcall(vim.cmd, "normal! ]c")
    end, 50)
  else
    actions.select_prev_entry()
    -- land on last hunk of the new file (G to bottom, then [c)
    vim.defer_fn(function()
      pcall(vim.cmd, "normal! G[c")
    end, 50)
  end
end

return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<F7>",  function() diff_hunk_jump(1) end,  desc = "Diff: next hunk or file" },
      { "<F19>", function() diff_hunk_jump(-1) end, desc = "Diff: prev hunk or file" },
    },
    opts = {
      view = {
        default = { disable_diagnostics = true },
        merge_tool = { disable_diagnostics = true },
        file_history = { disable_diagnostics = true },
      },
    },
    config = function(_, opts)
      require("diffview").setup(opts)

      -- Disable diff folds in every Diffview diff buffer (no `-- N lines --` collapse)
      vim.api.nvim_create_autocmd("User", {
        pattern = "DiffviewDiffBufRead",
        callback = function()
          vim.wo.foldenable = false
          vim.wo.foldmethod = "manual"
        end,
      })
      -- On view open, jump to the first diff hunk of the first file
      vim.api.nvim_create_autocmd("User", {
        pattern = "DiffviewViewOpened",
        callback = function()
          vim.defer_fn(function()
            pcall(vim.cmd, "normal! ]c")
          end, 100)
        end,
      })
      -- Prevent LSP (e.g. gopls) from attaching to diffview:// virtual buffers,
      -- which triggers "DocumentURI scheme is not 'file'" errors.
      -- LspAttach detach is too late (didOpen already sent synchronously),
      -- so we block attachment itself by wrapping vim.lsp.buf_attach_client.
      local orig_attach = vim.lsp.buf_attach_client
      vim.lsp.buf_attach_client = function(bufnr, client_id)
        bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name and vim.startswith(name, "diffview://") then
          return false
        end
        return orig_attach(bufnr, client_id)
      end
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
    },
  },
}
