-- https://www.reddit.com/r/neovim/comments/wiamjt/miniai_now_supports_textobjects_based_on/
local spec_treesitter = require('mini.ai').gen_spec.treesitter
require('mini.ai').setup({
  custom_textobjects = {
    f = spec_treesitter({
      a = '@function.outer', i = '@function.inner',
    }),
  }
})
