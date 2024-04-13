local config = function()
    require('fzf-lua').setup {
        file_icon_padding = ' ', -- https://github.com/ibhagwan/fzf-lua/wiki#differences-fzf.vim (Icon padding)
        winopts = { border = "single" },
        keymap = {
            builtin = {
                ["<C-d>"] = "preview-page-down",
                ["<C-u>"] = "preview-page-up" -- you must use neovim-style keymaps (i.e. <C-c> for Control-C) for builtin
            }
            -- you must use fzf-style keymaps (i.e. ctrl-c for Control-C) for fzf options
        }
    }
end


return {
        "ibhagwan/fzf-lua",
        config = config,
        event = "VeryLazy"
    }
