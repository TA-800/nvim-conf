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
    {
        "ibhagwan/fzf-lua",
        config = function()
            require('fzf-lua').setup {
                file_icon_padding = ' ', -- https://github.com/ibhagwan/fzf-lua/wiki#differences-fzf.vim (Icon padding)
                winopts = { border = "single" },
                keymap = {
                    builtin = {
                        ["<C-d>"] = "preview-page-down",
                        ["<C-u>"] = "preview-page-up" -- you must use neovim-style keymaps (i.e. <C-c> for Control-C) for built-in
                    },
                    fzf = {
                        ['shift-tab'] = 'up', -- you must use fzf-style keymaps (i.e. ctrl-c for Control-c) for fzf
                        ['tab'] = 'down',     -- replaces 'tab' for adding to quickfix list
                        -- ctrl-j|k still usable for list navigation
                    }
                }
            }
        end
    },
    "nvim-lualine/lualine.nvim",
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


    -- LSP (mostly)
    "folke/neodev.nvim",                 -- Neovim kit for Lua Development
    "williamboman/mason.nvim",           -- LSP Installer
    "williamboman/mason-lspconfig.nvim", -- LSP Configs for Mason
    "neovim/nvim-lspconfig",
    'hrsh7th/nvim-cmp',                  -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',              -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip',          -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',                  -- Snippets plugin
    "rafamadriz/friendly-snippets",      -- Snippets collection
    'onsails/lspkind.nvim',              -- Icons for autocomplete
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {} -- Use <ctrl-w>w to focus preview window when off of it
        end
    },

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
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    "nvim-treesitter/nvim-treesitter-refactor",    -- Refactoring support for nvim-treesitter
    "windwp/nvim-autopairs",                       -- Autopairs for nvim
    "windwp/nvim-ts-autotag",                      -- Autotag for nvim-treesitter (HTML, JSX, TSX)
    "nvim-treesitter/nvim-treesitter-textobjects", -- Textobjects for nvim-treesitter
    "stevearc/conform.nvim",                       -- Format on save
    "echasnovski/mini.ai",                         -- More textobjects and improved motions
    -- https://www.reddit.com/r/neovim/comments/wiamjt/comment/ijae8yc/?utm_source=share&utm_medium=web2x&context=3
}

local opts = {}

require("lazy").setup(plugins, opts)
