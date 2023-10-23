return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Discord rich presence
  use 'andweeb/presence.nvim'
  -- https://github.com/tpope/vim-surround
  use 'tpope/vim-surround'
  -- https://github.com/tpope/vim-commentary
  use "tpope/vim-commentary"
  -- https://github.com/tpope/vim-repeat
  use "tpope/vim-repeat"
  -- Colorschemes
  -- use "EdenEast/nightfox.nvim" -- https://github.com/EdenEast/nightfox.nvim
  use { "catppuccin/nvim", as = "catppuccin" } -- https://github.com/catppuccin/nvim
  -- Dev icons for file explorer
  use "nvim-tree/nvim-web-devicons"
  -- https://github.com/romgrk/barbar.nvim
  use "romgrk/barbar.nvim" -- Tabs
  -- https://github.com/rcarriga/nvim-notify
  use 'rcarriga/nvim-notify'
  -- https://github.com/nvim-tree/nvim-tree.lua
  use "nvim-tree/nvim-tree.lua"
  -- https://github.com/kosayoda/nvim-lightbulb
  use { 'kosayoda/nvim-lightbulb' }

  -- https://github.com/zbirenbaum/copilot.lua
  use {
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
  }
  -- https://github.com/nvim-lualine/lualine.nvim
  use "nvim-lualine/lualine.nvim"
  -- https://github.com/folke/neodev.nvim
  use "folke/neodev.nvim" -- Neovim kit for Lua Development
  -- https://github.com/akinsho/toggleterm.nvim
  use { "akinsho/toggleterm.nvim", tag = '*' }
  -- https://github.com/nvim-telescope/telescope.nvim#pickers
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- https://github.com/michaeljsmith/vim-indent-object
  use "michaeljsmith/vim-indent-object" -- Text objects for indentation levels
  use "echasnovski/mini.ai"             -- More textobjects and improved motions
  -- https://github.com/williamboman/mason.nvim
  use "williamboman/mason.nvim"         -- LSP Installer
  use "williamboman/mason-lspconfig.nvim"

  -- https://github.com/neovim/nvim-lspconfig
  use "neovim/nvim-lspconfig"
  use 'hrsh7th/nvim-cmp'             -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'         -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'     -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'             -- Snippets plugin
  use "rafamadriz/friendly-snippets" -- Snippets collection
  use 'onsails/lspkind.nvim'         -- Icons for autocomplete

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use "nvim-treesitter/nvim-treesitter-refactor"    -- Refactoring support for nvim-treesitter
  use "andymass/vim-matchup"
  use "windwp/nvim-autopairs"                       -- Autopairs for nvim
  use "windwp/nvim-ts-autotag"                      -- Autotag for nvim-treesitter (HTML, JSX, TSX)
  use "nvim-treesitter/nvim-treesitter-textobjects" -- Textobjects for nvim-treesitter
  -- https://www.reddit.com/r/neovim/comments/wiamjt/comment/ijae8yc/?utm_source=share&utm_medium=web2x&context=3
end)
