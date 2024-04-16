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
    { "folke/neodev.nvim",         opts = {},                                                         config = true }, -- neovim 内置 vim 等API文档提供，但会导致 lua completion 变慢
    -- 树形结构目录插件
    {
        'nvim-tree/nvim-tree.lua',
        keys = { { "<C-T>", "<cmd>NvimTreeToggle<cr>" } },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require('plugin_config.nvim-tree') end
    },

    -- 代码注释插件
    { 'numToStr/Comment.nvim',     config = true },
    -- 'plasticboy/vim-markdown', -- deprecated. treesitter supported markdown

    -- airline 的 vcs支持
    -- 'tpope/vim-fugitive',

    -- bufferline
    { "akinsho/bufferline.nvim",   dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" }, config = true },

    -- lualine
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },                  config = true },

    -- git 代码行状态插件
    --use 'airblade/vim-gitgutter'
    --撤销记录
    -- 'mbbill/undotree',

    -- 作者信息插件
    {
        'feng409/AuthorInfo',
        keys = { { '<F4>', '<cmd>AuthorInfoDetect<CR>', silent = true } },
        config = function()
            vim.g.vimrc_author = 'chemf'
            vim.g.vimrc_email = 'eoyohe@gmail.com'
            vim.g.vimrc_homepage = 'eoyohe.cn'
        end
    },

    'metakirby5/codi.vim', -- 异步实时执行代码

    -- 'tpope/vim-surround', -- deprecated: 太复杂了，不常用。 环境替换插件，比如“替换为<
    -- { 'skywind3000/asyncrun.vim' }, -- deprecated: 不如用 tmux. 异步命令行执行代码，quickfix 显示

    { 'ericbn/vim-solarized', lazy = true }, -- colorscheme solarized
    { 'morhetz/gruvbox',      lazy = true }, -- colorscheme gruvbox

    -- 语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { 'p00f/nvim-ts-rainbow' },
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function() require("plugin_config.nvim-treesitter") end
    },

    -- outline 函数列表，一般也用不上，但可以开一下装逼
    {
        'stevearc/aerial.nvim',
        opts = {},
        lazy = true,
        keys = { { "<C-Y>", "<cmd>AerialToggle!<cr>", desc = "outline window" } },
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- 类似 easymotion 的快速跳转
    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require(
                "plugin_config.hop")
        end,
    },

    -- LSP Client 默认配置支持
    {
        'neovim/nvim-lspconfig',
        dependencies = { "folke/neodev.nvim" },
        config = function() require("plugin_config.lspconfig") end
    },
    -- LSP 管理
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim', -- mason 和 原生 lspconfig 之间的兼容层
        },
        config = function() require("plugin_config.mason") end,
    },
    -- 补全
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            {
                'L3MON4D3/LuaSnip',
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
                dependencies = { "rafamadriz/friendly-snippets" }
            },
            'saadparwaiz1/cmp_luasnip',
        },
        config = function() require('plugin_config.cmp') end
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            -- insert `(` after select function or method item
            require("nvim-autopairs").setup {}
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    },

    -- 查找面版
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require("plugin_config.telescope") end,
    },

    -- 终端
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function() require("plugin_config.toggleterm") end
    },

    -- 终端复制转义序列
    { 'ojroques/nvim-osc52',     config = function() require("plugin_config.osc52") end },

    -- { 'mvllow/modes.nvim',     version = 'v0.2.0',                                        config = true }, -- 光标选中, 算了还不如用 iterm2 的 Find Cursor 确定光标位置

    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        dependencies = {
            { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end }
        },
        config = function()
            require('bqf').setup({
                auto_enable = true,
                auto_resize_height = true,
                func_map = { fzffilter = 'a', openc = '<CR>', drop = 'o' },
            })
        end
    },

    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function() require("plugin_config.ufo") end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        ft = "python",
        config = function()
            require("ibl").setup {
                scope = { enabled = false },
            }
        end
    },
    { 'lewis6991/gitsigns.nvim', config = function() require('plugin_config.gitsigns') end },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require("treesitter-context").setup({})
            vim.keymap.set("n", "[c", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true })
        end
    },
})
