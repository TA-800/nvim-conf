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

-- Auto lazy loading when 1) plugin exists only as dependency 2) plugin has "event", "cmd", "ft" or "keys" key 3) config.defaults.lazy = true

local plugins = {

    'andweeb/presence.nvim',
    'tpope/vim-surround',
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "sainnhe/gruvbox-material",
    "nvim-tree/nvim-web-devicons",
    "ibhagwan/fzf-lua", -- FZF (Telescope alternative)
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-tree.lua",
    "romgrk/barbar.nvim",
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
        end
    },
    { 'kevinhwang91/nvim-ufo',   dependencies = 'kevinhwang91/promise-async' },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
        }
    },
    { "akinsho/toggleterm.nvim", version = '*' },
    {
        -- Lazy load copilot as it takes time to connect to server, need to define config function here
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true
                }
            })
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {}
    },

    -- LSP (mostly)
    "folke/neodev.nvim",                 -- Neovim kit for Lua Development
    "williamboman/mason.nvim",           -- LSP Installer
    "williamboman/mason-lspconfig.nvim", -- LSP Configs for Mason
    "neovim/nvim-lspconfig",
    {
        'hrsh7th/nvim-cmp', -- Autocompletion plugin
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        }
    },
    'saadparwaiz1/cmp_luasnip',     -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',             -- Snippets plugin
    "rafamadriz/friendly-snippets", -- Snippets collection
    'onsails/lspkind.nvim',         -- Icons for autocomplete
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {} -- Use <C-w>w to focus preview window when off of it
        end
    },
    'kosayoda/nvim-lightbulb',

    'mfussenegger/nvim-jdtls', -- LSP for Java
    "mfussenegger/nvim-dap",   -- Debug Adapter Protocol
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        }
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" }
    },

    -- TREE-SITTER
    "stevearc/conform.nvim",
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    "nvim-treesitter/nvim-treesitter-refactor",    -- Refactoring support for nvim-treesitter
    "windwp/nvim-autopairs",                       -- Autopairs for nvim
    "windwp/nvim-ts-autotag",                      -- Autotag for nvim-treesitter (HTML, JSX, TSX)
    "nvim-treesitter/nvim-treesitter-textobjects", -- Textobjects for nvim-treesitter
    "echasnovski/mini.ai",                         -- More textobjects and improved motions
    -- https://www.reddit.com/r/neovim/comments/wiamjt/comment/ijae8yc/?utm_source=share&utm_medium=web2x&context=3
}

local opts = {}

require("lazy").setup(plugins, opts)
