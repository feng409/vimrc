# neovim configuration

基于 `nvim` 的开发配置

- LSP 采用 `coc.nvim` 而不是 `nvim` 自带。
- 插件管理采用 `packer.nvim` ，方便依赖管理，插件配置管理
- 插件原则上尽量用 `lua` 插件，配置过长情况下单独放在 `plugin_config` 目录后，在 `plugins.lua` 插件处进行 `require` 加载
- 配置尽量用 `lua` 写，但对于 `VimScript` 语言实现的插件，配置保持用 `VimScript` 方便从插件 `readme.md` 复制粘贴配置。

## Structure

```shell
.
├── coc-settings.json     // 基于 coc 的 lsp 配置
├── init.lua              // 配置入口
└── lua                   // lua runtimepath
    ├── basic.lua         // 关于 vim 的基本配置，如行号等，必须无插件等其他依赖
    ├── keybindings.lua   // 键位映射，必须无插件依赖
    ├── plugins.lua       // 插件依赖管理，基于 packer.nvim，插件配置也基于 config 字段管理
    └── plugin_config     // 对于配置太长的插件单独列出配置文件在此
```
