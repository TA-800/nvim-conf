local conform = require("conform")

-- https://github.com/stevearc/conform.nvim#options
conform.setup({
  -- formatters_by_ft = {
  --   c = { "clang-format" },
  --   cpp = { "clang-format" },
  -- },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500
  }
})

vim.keymap.set("n", "<leader>f", function()
  conform.format({
    lsp_fallback = false,
    async = false,
    timeout_ms = 500
  })
end)

