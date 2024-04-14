-- https://github.com/folke/lazy.nvim#-plugin-spec
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Auto lazy loading when 1) plugin exists only as dependency 2) plugin has "event", "cmd", "ft" or "keys" key 3) config.defaults.lazy = true

local opts = {
    defaults = {
        lazy = true
    }
}


require("lazy").setup("plugins", opts)
