-- Plugins should be set up in the following order:
-- 1. mason.nvim (via require "plugin" in init.lua)
-- 2. mason-lspconfig.nvim (via require "plugin" in init.lua)
-- 3. setup servers via lspconfig (via require "plugins_config" in init.lua)
-- So have lspconfig load mason and friends as dependencies

return {
    "mfussenegger/nvim-jdtls",
    -- lazy = false
}
