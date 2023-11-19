-- https://github.com/folke/lazy.nvim#-plugin-spec
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
    -- Discord rich presence
    'andweeb/presence.nvim',
    -- https://github.com/tpope/vim-surround
    'tpope/vim-surround',
    -- https://github.com/tpope/vim-commentary
    "tpope/vim-commentary",
    -- https://github.com/tpope/vim-repeat
    "tpope/vim-repeat",
    -- Colorschemes
    "sainnhe/gruvbox-material",
    -- Dev icons for file explorer
    "nvim-tree/nvim-web-devicons",
    -- https://github.com/romgrk/barbar.nvim
    "romgrk/barbar.nvim", -- Tabs
    -- https://github.com/rcarriga/nvim-notify
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
        end
    },
    -- https://github.com/nvim-tree/nvim-tree.lua
    "nvim-tree/nvim-tree.lua",
    -- https://github.com/kosayoda/nvim-lightbulb
    'kosayoda/nvim-lightbulb',
    -- https://github.com/kevinhwang91/nvim-ufo
    { 'kevinhwang91/nvim-ufo',   dependencies = 'kevinhwang91/promise-async' },
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
        }
    },

    -- https://github.com/zbirenbaum/copilot.lua
    {
        -- Lazy load copilot because it takes a while to connect to server
        -- So we need to define config function here
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
                suggestion = {
                    auto_trigger = true
                }
            })
        end
    },
    -- https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",
    -- https://github.com/folke/neodev.nvim
    "folke/neodev.nvim", -- Neovim kit for Lua Development
    -- https://github.com/akinsho/toggleterm.nvim
    { "akinsho/toggleterm.nvim", version = '*' },
    -- https://github.com/nvim-telescope/telescope.nvim#pickers
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim', 'debugloop/telescope-undo.nvim' }
    },

    -- https://github.com/michaeljsmith/vim-indent-object
    "michaeljsmith/vim-indent-object", -- Text objects for indentation levels
    "echasnovski/mini.ai",             -- More textobjects and improved motions
    -- https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",         -- LSP Installer
    "williamboman/mason-lspconfig.nvim",

    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    'hrsh7th/nvim-cmp',             -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',         -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip',     -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',             -- Snippets plugin
    "rafamadriz/friendly-snippets", -- Snippets collection
    'onsails/lspkind.nvim',         -- Icons for autocomplete
    -- https://github.com/rmagatti/goto-preview
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {} -- Use <C-w>w to focus to preview window when off of it
        end
    },
    -- https://github.com/mfussenegger/nvim-jdtls
    -- LSP for Java
    'mfussenegger/nvim-jdtls',

    -- Debug Adapter Protocol
    -- https://github.com/mfussenegger/nvim-dap
    "mfussenegger/nvim-dap",
    -- https://github.com/rcarriga/nvim-dap-ui
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } }, -- setup in config-mason.lua
    -- https://github.com/jay-babu/mason-nvim-dap.nvim
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        }
    },
    -- https://github.com/mfussenegger/nvim-dap-python
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" }
    },

    -- https://github.com/stevearc/conform.nvim#installation
    "stevearc/conform.nvim",
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    "nvim-treesitter/nvim-treesitter-refactor",    -- Refactoring support for nvim-treesitter
    "andymass/vim-matchup",
    "windwp/nvim-autopairs",                       -- Autopairs for nvim
    "windwp/nvim-ts-autotag",                      -- Autotag for nvim-treesitter (HTML, JSX, TSX)
    "nvim-treesitter/nvim-treesitter-textobjects", -- Textobjects for nvim-treesitter
    -- https://www.reddit.com/r/neovim/comments/wiamjt/comment/ijae8yc/?utm_source=share&utm_medium=web2x&context=3
}

local opts = {}

require("lazy").setup(plugins, opts)

