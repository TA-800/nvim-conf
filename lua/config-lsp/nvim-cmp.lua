-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
-- lspkind (autocomplete icons) setup
local lspkind = require('lspkind')
-- autopair on pressing enter with cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

-- https://github.com/L3MON4D3/LuaSnip#add-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- https://github.com/hrsh7th/nvim-cmp#setup
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  }, mapping = cmp.mapping.preset.insert({
  -- The following 2 mappings are to navigate the documentation popup on selecting / hovering over a completion item
  ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
  ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
  -- C-b (back) C-f (forward) for snippet placeholder navigation.
  -- C-e closes the snippet (already set by default)
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },

  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end, { 'i', 's' }),
  ['<S-Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { 'i', 's' }),
}),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',  -- show symbol and text annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function(entry, vim_item)
      --   return vim_item
      -- end
    })
  }

}

-- https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
-- Enable autopairs on pressing enter with cmp
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
