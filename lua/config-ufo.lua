-- https://github.com/kevinhwang91/nvim-ufo#minimal-configuration Option 3: Treesitter as main client
local ufo = require('ufo')

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end,
  preview = {
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
    }
  }
})

-- Peek folded lines under cursor
vim.keymap.set(
  'n',
  'zp',
  function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end
)
-- More fold settings in config-settings
