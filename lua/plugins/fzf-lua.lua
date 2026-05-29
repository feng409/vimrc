return {
  "ibhagwan/fzf-lua",
  opts = {
    line_query = true, -- 支持搜索时 file:line 格式
    previewers = {
      builtin = {
        syntax = true,
        syntax_delay = 0,
      },
    },
  },
}