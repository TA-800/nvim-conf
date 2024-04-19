-- After-load configuration of plugins
require 'nvim-treesitter.install'.compilers = { "clang" },

-- COLORSCHEME
vim.cmd("let g:gruvbox_material_background = 'hard'")
vim.cmd("let g:gruvbox_material_foreground = 'hard'")
vim.cmd("let g:gruvbox_material_disable_italic_comment = 1")
vim.cmd("colorscheme gruvbox-material")


