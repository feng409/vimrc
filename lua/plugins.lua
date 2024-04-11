--[[=============================================================================
#     FileName: plugins.lua
#         Desc: plugin list
#       Author: chemf
#        Email: eoyohe@gmail.com
#     HomePage: eoyohe.cn
#      Version: 0.0.1
#   LastChange: 2023-05-03 16:37:16
#      History:
=============================================================================]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


return require('lazy').setup({
    -- 树形结构目录插件
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require('plugin_config.nvim-tree') end
    },
    -- 代码注释插件
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
    --markdown语法高亮插件
    'plasticboy/vim-markdown',

    -- airline 的 vcs支持
    'tpope/vim-fugitive',

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
        config = function() require("bufferline").setup {} end
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require('lualine').setup() end
    },

    -- git 代码行状态插件
    --use 'airblade/vim-gitgutter'
    --撤销记录
    'mbbill/undotree',
    --代码模板插件
    --use 'aperezdc/vim-template'
    --代码搜索工具
    'mileszs/ack.vim',

    -- 作者信息插件
    {
        'feng409/AuthorInfo',
        config = function()
            vim.g.vimrc_author = 'chemf'
            vim.g.vimrc_email = 'eoyohe@gmail.com'
            vim.g.vimrc_homepage = 'eoyohe.cn'
            vim.keymap.set("n", "<F4>", ":AuthorInfoDetect<cr>", { silent = true })
        end
    },

    -- 函数栏, 支持 coc lsp ctags 等多种方式
    {
        'liuchengxu/vista.vim',
        config = function()
            local vimrc = vim.fn.stdpath("config") .. "/lua/plugin_config/vista.vim"
            vim.cmd.source(vimrc)
        end
    },
    -- csv 文件支持
    'chrisbra/csv.vim',
    -- 环境替换插件，比如“替换为<
    'tpope/vim-surround',
    -- 异步实时执行代码
    'metakirby5/codi.vim',
    -- 异步命令行执行代码，quickfix 显示
    {
        'skywind3000/asyncrun.vim',
        config = function()
            -- local vimrc = vim.fn.stdpath("config") .. "/lua/plugin_config/asyncrun.vim"
            -- vim.cmd.source(vimrc)
        end
    },

    { 'ericbn/vim-solarized', config = function() vim.cmd [[colorscheme solarized]] end },
    -- {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end },

    -- 语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { 'p00f/nvim-ts-rainbow' },
        build = ":TSUpdate",
        config = function() require("plugin_config.nvim-treesitter") end
    },

    --use({
    --'p00f/nvim-ts-rainbow',
    --})

    -- 类似 easymotion 的快速跳转
    { 'phaazon/hop.nvim',      branch = 'v2',                                     config = function() require(
        "plugin_config.hop") end },

    {
        'neoclide/coc.nvim',
        build = 'yarn install --frozen-lockfile',
        config = function() require("plugin_config.coc") end,
        dependencies = {
            { 'xiyaowong/coc-sumneko-lua', build = 'yarn install --frozen-lockfile' },
            { 'fannheyward/coc-pyright',   build = 'yarn install --frozen-lockfile' },
            { 'weirongxu/coc-kotlin',      build = 'yarn install --frozen-lockfile' },
            { 'neoclide/coc-pairs',        build = 'yarn install --frozen-lockfile' },

            {
                'neoclide/coc-snippets', -- 代码片段引擎
                build = 'yarn install --frozen-lockfile',
                dependencies = { 'rafamadriz/friendly-snippets' },
            },
        }
    },
    -- 格式化
    'prettier/vim-prettier',

    -- 查找面版
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require("plugin_config.telescope") end,
    },
    -- 终端
    { 'akinsho/toggleterm.nvim', version = '*', config = function() require("plugin_config.toggleterm") end },

    -- ex 命令浮动窗口
    -- use {
    --     'VonHeikemen/fine-cmdline.nvim',
    --     dependencies = {
    --         { 'MunifTanjim/nui.nvim' }
    --     },
    --     config = function ()
    --         vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    --     end
    -- }

    -- 终端复制转义序列
    {
        'ojroques/nvim-osc52',
        config = function() require("plugin_config.osc52") end,
    },

    -- 光标选中
    {
        'mvllow/modes.nvim',
        version = 'v0.2.0',
        config = function()
            require('modes').setup()
        end
    },
})
