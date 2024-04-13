-- After-load configuration of plugins

-- COLORSCHEME
require 'nvim-treesitter.install'.compilers = { "clang" },

vim.cmd("let g:gruvbox_material_background = 'hard'")
vim.cmd("let g:gruvbox_material_foreground = 'hard'")
vim.cmd("colorscheme gruvbox-material")


