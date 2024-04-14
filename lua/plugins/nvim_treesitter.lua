local opts = {
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",

                ["aL"] = "@loop.outer", -- don't use lowercase 'l' as it is by mini.ai for 'last' (e.g. cilq -> change inside last quotes)
                ["iL"] = "@loop.inner",

                ["aC"] = "@conditional.outer",
                ["iC"] = "@conditional.inner",

                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            include_surrounding_whitespace = true,
        },

        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["pf"] = "@function.outer",
                ["pc"] = "@class.outer",
                ["pv"] = "@assignment.outer",
            },

        }
    },

    -- Auto pairs for nvim-treesitter
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
    },
    -- Autotag for nvim-treesitter (HTML, JSX, TSX)
    autotag = { enable = true },

}

return
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    event = "VeryLazy",
    config = function()
        require("nvim-treesitter.configs").setup(opts)
    end
}
