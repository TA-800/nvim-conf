require 'nvim-treesitter.install'.compilers = { "clang" }
require 'nvim-treesitter.configs'.setup {
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

                ["aL"] = "@loop.outer",
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
    },

    -- Auto pairs for nvim-treesitter
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
    },
    -- Autotag for nvim-treesitter (HTML, JSX, TSX)
    autotag = { enable = true },

    -- https://github.com/nvim-treesitter/nvim-treesitter-refactor#navigation
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition_lsp_fallback = "gd",
                goto_definition = false,
                list_definitions = false,
                list_definitions_toc = false,
                goto_next_usage = false,
                goto_previous_usage = false,
            },
        }
    },
}

