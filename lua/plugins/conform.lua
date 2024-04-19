return
{
    "stevearc/conform.nvim",
    event = "BufEnter",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            typescript = { "prettierd" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        }

    }

}
