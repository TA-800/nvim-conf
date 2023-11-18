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

-- Disable italics in comments, :h gruvbox-material
vim.cmd("let g:gruvbox_material_disable_italic_comment = 1")
vim.cmd("colorscheme gruvbox-material")
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
require('config-ufo')    -- Folding
require('config-miniai') -- Text objects from mini.ai

