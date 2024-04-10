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
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- 树形结构目录插件
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function() require('plugin_config.nvim-tree') end
    }
    -- 代码注释插件
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
    --markdown语法高亮插件
    use 'plasticboy/vim-markdown'

    -- airline 的 vcs支持
    use 'tpope/vim-fugitive'

    -- bufferline
    use {
        "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
        config = function() require("bufferline").setup {} end
    }

    -- lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function() require('lualine').setup() end
    }

    -- git 代码行状态插件
    --use 'airblade/vim-gitgutter'
    --撤销记录
    use 'mbbill/undotree'
    --代码模板插件
    --use 'aperezdc/vim-template'
    --代码搜索工具
    use 'mileszs/ack.vim'

    -- 作者信息插件
    use {
        'feng409/AuthorInfo',
        config = function()
            vim.g.vimrc_author = 'chemf'
            vim.g.vimrc_email = 'eoyohe@gmail.com'
            vim.g.vimrc_homepage = 'eoyohe.cn'
            vim.keymap.set("n", "<F4>", ":AuthorInfoDetect<cr>", { silent = true })
        end
    }

    -- 函数栏, 支持 coc lsp ctags 等多种方式
    use {
        'liuchengxu/vista.vim',
        config = function()
            local vimrc = vim.fn.stdpath("config") .. "/lua/plugin_config/vista.vim"
            vim.cmd.source(vimrc)
        end
    }
    -- csv 文件支持
    use 'chrisbra/csv.vim'
    -- 环境替换插件，比如“替换为<
    use 'tpope/vim-surround'
    -- 异步实时执行代码
    use 'metakirby5/codi.vim'
    -- 异步命令行执行代码，quickfix 显示
    use { 'skywind3000/asyncrun.vim', config = function()
        -- local vimrc = vim.fn.stdpath("config") .. "/lua/plugin_config/asyncrun.vim"
        -- vim.cmd.source(vimrc)
    end }

    use { 'ericbn/vim-solarized', config = function() vim.cmd [[colorscheme solarized]] end }
    use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }

    -- 语法高亮
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = { 'p00f/nvim-ts-rainbow' },
        run = ":TSUpdate",
        config = function() require("plugin_config.nvim-treesitter") end
    }

    --use({
    --'p00f/nvim-ts-rainbow',
    --})

    -- 类似 easymotion 的快速跳转
    use { 'phaazon/hop.nvim', branch = 'v2', config = function() require("plugin_config.hop") end }

    use { 'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile', config = function() require("plugin_config.coc") end }
    -- LSP
    use { 'xiyaowong/coc-sumneko-lua', run = 'yarn install --frozen-lockfile', after = "coc.nvim" }
    use { 'fannheyward/coc-pyright', run = 'yarn install --frozen-lockfile', after = "coc.nvim" }
    use { 'weirongxu/coc-kotlin', run = 'yarn install --frozen-lockfile', after = "coc.nvim" }
    use { 'neoclide/coc-pairs', run = 'yarn install --frozen-lockfile', after = "coc.nvim" }
    -- 代码片段引擎
    use { 'neoclide/coc-snippets',
        run = 'yarn install --frozen-lockfile',
        requires = { 'rafamadriz/friendly-snippets' },
        after = "coc.nvim",
    }
    -- 格式化
    use 'prettier/vim-prettier'

    -- 查找面版
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require("plugin_config.telescope") end,
    }
    -- 终端
    use { 'akinsho/toggleterm.nvim', tag = '*', config = function() require("plugin_config.toggleterm") end }

    -- ex 命令浮动窗口
    -- use {
    --     'VonHeikemen/fine-cmdline.nvim',
    --     requires = {
    --         { 'MunifTanjim/nui.nvim' }
    --     },
    --     config = function ()
    --         vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    --     end
    -- }

    -- 终端复制转义序列
    use {
        'ojroques/nvim-osc52', 
        config = function() require("plugin_config.osc52") end,
    }

    -- 光标选中
    use({
        'mvllow/modes.nvim',
        tag = 'v0.2.0',
        config = function()
            require('modes').setup()
        end
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
