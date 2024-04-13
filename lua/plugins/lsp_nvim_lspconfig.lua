config = function()

local lspconfig = require('lspconfig')
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pylsp', 'lua_ls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
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

end

-- Plugins should be set up in the following order:
-- 1. mason.nvim (via require "plugin" in init.lua)
-- 2. mason-lspconfig.nvim (via require "plugin" in init.lua)
-- 3. setup servers via lspconfig (via require "plugins_config" in init.lua)
-- So have lspconfig load mason and friends as dependencies

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = config,
    event = "BufEnter",
}
