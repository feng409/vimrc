# neovim configuration

基于 `nvim` 的开发配置

- LSP 采用 `nvim` 自带
    - lspconfig neovim 出品，用于配置以及启动LSP
    - mason 用于安装管理LSP
- 关于补全
    - 采用 nvim-cmp 系列套装，配合 LSP 
    - 代码片段引擎采用 LuaSnip

- 关于插件管理
    采用 `lazy.nvim` ，非必需插件需配置懒启动

- 插件原则上尽量用 `lua` 插件，配置过长情况下单独放在 `plugin_config` 目录后，在 `plugins.lua` 插件处进行 `require` 加载

## Installation

```shell
git clone -b neovim https://github.com/feng409/vimrc.git $HOME/.config/nvim
```

## Structure

```shell
.
├── init.lua              // 配置入口
└── lua                   // lua runtimepath
    ├── basic.lua         // 关于 vim 的基本配置，如行号等，必须无插件等其他依赖
    ├── keybindings.lua   // 键位映射，必须无插件依赖
    ├── plugins.lua       // 插件依赖管理，基于 packer.nvim，插件配置也基于 config 字段管理
    └── plugin_config     // 对于配置太长的插件单独列出配置文件在此
```
