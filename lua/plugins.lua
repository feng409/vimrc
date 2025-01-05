--[[=============================================================================plugins
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

return require("lazy").setup({
    { "folke/neodev.nvim", opts = {}, config = true }, -- neovim 内置 vim 等API文档提供，但会导致 lua completion 变慢
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        cmd = { "Neotree", "Reveal" },
        keys = {
            { "<C-T>", "<cmd>Neotree toggle float<cr>" },
            { "<C-Y>", "<cmd>Neotree toggle right document_symbols<cr>" },
            { "<leader>gk", "<cmd>Neotree toggle float git_status<cr>" },
        },
        config = function()
            require("plugin_config.neotree")
        end,
    },

    -- 代码注释插件
    { "numToStr/Comment.nvim", config = true },
    -- 'plasticboy/vim-markdown', -- deprecated. treesitter supported markdown

    -- airline 的 vcs支持
    -- 'tpope/vim-fugitive',

    -- bufferline
    { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" }, config = true },

    -- lualine
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },

    -- git 代码行状态插件
    --use 'airblade/vim-gitgutter'
    --撤销记录
    -- 'mbbill/undotree',

    -- 作者信息插件
    {
        "feng409/AuthorInfo",
        keys = { { "<F4>", "<cmd>AuthorInfoDetect<CR>", silent = true } },
        config = function()
            vim.g.vimrc_author = "chemf"
            vim.g.vimrc_email = "eoyohe@gmail.com"
            vim.g.vimrc_homepage = "eoyohe.cn"
        end,
    },

    "metakirby5/codi.vim", -- 异步实时执行代码

    -- 'tpope/vim-surround', -- deprecated: 太复杂了，不常用。 环境替换插件，比如“替换为<
    -- { 'skywind3000/asyncrun.vim' }, -- deprecated: 不如用 tmux. 异步命令行执行代码，quickfix 显示

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("plugin_config.tokyonight")
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = true },
    { "ericbn/vim-solarized", lazy = true }, -- colorscheme solarized
    { "morhetz/gruvbox", lazy = true }, -- colorscheme gruvbox

    -- 语法高亮
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "p00f/nvim-ts-rainbow" },
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            require("plugin_config.nvim-treesitter")
        end,
    },

    -- 类似 easymotion 的快速跳转
    {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("plugin_config.hop")
        end,
    },

    -- 格式化
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            require("plugin_config.conform")
        end,
    },

    -- LSP Client 默认配置支持
    {
        "neovim/nvim-lspconfig",
        dependencies = { "folke/neodev.nvim" },
        config = function()
            require("plugin_config.lspconfig")
        end,
    },
    -- LSP 管理
    {
        "williamboman/mason.nvim",
        -- event = "VeryLazy",
        -- cmd = { "Mason" },-- cannot be Lazy if the lsp binaries depend on it to setup the $PATH. but it cost over 10ms, fuck
        dependencies = {
            "williamboman/mason-lspconfig.nvim", -- mason 和 原生 lspconfig 之间的兼容层
        },
        config = function()
            require("plugin_config.mason")
        end,
    },
    -- -- 补全
    -- {
    --     "hrsh7th/nvim-cmp",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-buffer",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-cmdline",
    --         "hrsh7th/cmp-nvim-lsp-signature-help",
    --         {
    --             "L3MON4D3/LuaSnip",
    --             config = function()
    --                 require("luasnip.loaders.from_vscode").lazy_load()
    --             end,
    --             dependencies = { "rafamadriz/friendly-snippets" },
    --         },
    --         "saadparwaiz1/cmp_luasnip",
    --     },
    --     config = function()
    --         require("plugin_config.cmp")
    --     end,
    -- },

    -- {
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     config = function()
    --         -- insert `(` after select function or method item
    --         require("nvim-autopairs").setup({})
    --         local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --         require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --     end,
    -- },
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = "rafamadriz/friendly-snippets",

        version = "*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            },
            completion = {
                list = { selection = "auto_insert" },
            },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                -- nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
        opts_extend = { "sources.default" },
    },

    -- 查找面版
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugin_config.telescope")
        end,
    },

    -- 终端
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("plugin_config.toggleterm")
        end,
    },

    -- { 'mvllow/modes.nvim',     version = 'v0.2.0',                                        config = true }, -- 光标选中, 算了还不如用 iterm2 的 Find Cursor 确定光标位置

    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        dependencies = {
            {
                "junegunn/fzf",
                build = function()
                    vim.fn["fzf#install"]()
                end,
            },
        },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                auto_resize_height = true,
                func_map = { fzffilter = "a", openc = "<CR>", drop = "o" },
            })
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        -- event = "VeryLazy",
        dependencies = "kevinhwang91/promise-async",
        config = function()
            require("plugin_config.ufo")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function(_, opts)
            opts = {
                whitespace = {
                    remove_blankline_trail = false,
                },
                scope = { enabled = false },
            }
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugin_config.gitsigns")
        end,
    },
    {
        "folke/which-key.nvim",
        lazy = false,
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        config = function(_, opts)
            require("which-key").setup(opts)
        end,
    },
    {
        -- select 窗口用 nui 绘制
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            { "theHamsta/nvim-dap-virtual-text", config = true },
            { "leoluz/nvim-dap-go", config = true }, -- dap's adapters and configurations for go
            { "mfussenegger/nvim-dap-python" }, -- dap's adapters and configurations for python
        },
        config = function()
            require("plugin_config.dap")
        end,
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- "rcarriga/nvim-notify",
        },
        config = function()
            require("plugin_config.noice")
        end,
    },

    -- 终端复制转义序列
    {
        "ojroques/nvim-osc52",
        config = function()
            require("plugin_config.osc52")
        end,
    },
    -- { 'Joakker/lua-json5', build = './install.sh' },
    -- lazy.nvim
    { "echasnovski/mini.surround", version = false, config = true }, -- 对选中区域加上双引号等操作
    { "sindrets/diffview.nvim" },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("plugin_config.copilot")
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim" },
        },
        build = "make tiktoken",
        opts = {},
    },
})
