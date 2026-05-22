return {
  "smoka7/hop.nvim",
  enabled = true,
  config = function()
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection
    hop.setup({ keys = "etovxqpdygfblzhckisuran" })
    -- vim.keymap.set("", "f", function()
    --   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    -- end, { remap = true })
    -- vim.keymap.set("", "F", function()
    --   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    -- end, { remap = true })
    vim.keymap.set("", "f", ":HopWordMW<cr>", { noremap = true, silent = true })
  end,
}
