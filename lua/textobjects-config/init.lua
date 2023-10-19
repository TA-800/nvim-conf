-- https://www.reddit.com/r/neovim/comments/wiamjt/miniai_now_supports_textobjects_based_on/
local spec_treesitter = require('mini.ai').gen_spec.treesitter
require('mini.ai').setup({
  custom_textobjects = {
    f = spec_treesitter({
      a = "@function.outer", i = "@function.inner",
    }),
    -- don't use l because mini ai uses that for "last", for example: "v i l '" to select last inner '' content
    L = spec_treesitter({
      a = "@loop.outer", i = "@loop.inner",
    }),
    c = spec_treesitter({
      a = "@conditional.outer", i = "@conditional.inner",
    }),
  }
})
