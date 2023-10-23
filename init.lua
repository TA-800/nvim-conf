-- https://github.com/nanotee/nvim-lua-guide
-- Lua Guide ^

require('config-settings') -- Leader is set to space in settings/init.lua
require('config-packer')
require('config-presence')
require('config-mappings')
require('config-lualine')
require('config-nvimtree')
require('config-barbar')
require('config-toggleterm')
require('config-autopair')
require('config-textobjects')
-- require('config-copilot') This is only needed in lualine, not here
require('config-colorscheme')
vim.cmd('colorscheme catppuccin-mocha')
-- vim.cmd('colorscheme carbonfox')

-- LSPs
require('config-mason')
require('config-lsp.language-servers')
require('config-lsp.nvim-cmp')
require('config-lsp.lightbulb')

-- Treesitter
require('config-treesitter')
