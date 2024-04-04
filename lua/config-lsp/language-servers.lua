-- Neodev Kit: https://github.com/folke/neodev.nvim#-setup
require("neodev").setup({})
-- Setup language servers.
local lspconfig = require('lspconfig')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition || Already mapped to treesitter, will fallback to lsp
        -- vim.keymap.set("n", "gi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
        -- vim.keymap.set('n', 'gr', "vim.lsp.buf.references", opts) -- Uses FzfLua lsp_references
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true }) -- Uses goto-preview.nvim
        vim.keymap.set('i', '<c-u>', vim.lsp.buf.signature_help, opts)                                                  -- Original <c-k>, now u
    end,
})



-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pylsp', 'clangd', 'lua_ls', 'texlab', 'yamlls', 'tsserver', 'omnisharp' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end

-- Fix hovering with gh issue
lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    }
})

-- https://github.com/folke/neodev.nvim/issues/88#issuecomment-1314449905
-- use lua_ls instead of sumneko (deprecated)
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = "Disable",
            },
            completion = {
                callSnippet = "Replace",
            }
        }
    }
})
