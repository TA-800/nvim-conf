require('config-settings') -- Leader is set to space in settings/init.lua. Must happen before plugin manager
require('config-lazy')
require('config-presence')
require('config-mappings')
require('config-lualine') -- Copilot config partially in lualine, rest in lazy.nvim
require('config-barbar')
require('config-toggleterm')
require('config-autopair')
require('config-neodev')

vim.cmd("let g:gruvbox_material_background = 'hard'")
vim.cmd("let g:gruvbox_material_foreground = 'hard'")
vim.cmd("colorscheme gruvbox-material")

-- LSPs
require('config-mason')
require('config-lsp.language-servers')
require('config-lsp.nvim-cmp')

-- DAP
require('config-nvimdap')
require('config-pythondap')

-- Formatter
require('config-formatter')

-- Treesitter
require('config-treesitter')
require('config-ufo')    -- Folding
require('config-miniai') -- Text objects from mini.ai
