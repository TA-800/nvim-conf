-- https://github.com/nanotee/nvim-lua-guide
-- Lua Guide ^

require('config-settings') -- Leader is set to space in settings/init.lua. Must happen before plugin manager
require('config-lazy')
require('config-presence')
require('config-mappings')
require('config-lualine')
require('config-nvimtree')
require('config-barbar')
require('config-toggleterm')
require('config-telescope')
require('config-autopair')
require('config-neodev')
vim.cmd('colorscheme gruvbox-baby')
-- require('config-copilot') -- Copilot config in lualine for copilot status indicator

-- LSPs
require('config-mason')
require('config-lsp.language-servers')
require('config-lsp.nvim-cmp')
require('config-lsp.lightbulb')

-- DAP
require('config-nvimdapui')

-- Formatter
require('config-formatter')

-- Treesitter
require('config-treesitter')
require('config-ufo')          -- Folding
require('config-moretextobjs') -- Text objects from mini.ai

