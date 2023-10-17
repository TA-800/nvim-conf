-- https://github.com/nanotee/nvim-lua-guide
-- Lua Guide ^

require('settings') -- Leader is set to space in settings/init.lua
require('packer-config')
require('presence-config')
require('mappings')
require('lualine-config')
require('nvim-tree-config')
require('toggleterm-config')
require('autopair-config')
require("textobjects-config")
vim.cmd('colorscheme carbonfox')

-- LSPs
require('mason-config')
require('lsp-config.language-servers')
require('lsp-config.nvim-cmp')

-- Treesitter
require('treesitter-config')
